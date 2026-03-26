import 'package:drift/drift.dart';
import '../../../../domain/models.dart';
import '../db_converters/category_type_converter.dart';
import '../db_converters/currency_converter.dart';
import '../entities/cashflow_entity.dart';
import 'database.dart';

part 'category_dao.g.dart';

@DriftAccessor(tables: [Categories, Cashflows])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  // Called by the AppDatabase class
  CategoryDao(super.db);

  Stream<List<CategoryDB>> watchAllCategories() => (select(
    categories,
  )..orderBy([(t) => OrderingTerm(expression: t.title)])).watch();

  Stream<List<CategoryDB>> watchAllCategoriesItems() => (select(
    categories,
  )..orderBy([(t) => OrderingTerm(expression: t.title)])
    ..where((tbl) => tbl.isGroup.equals(false))
  ).watch();

  Future<List<CategoryDB>> getAllCategories() => (select(
    categories,
  )..orderBy([(t) => OrderingTerm(expression: t.title)])).get();

  Future<List<CategoryDB>> getAllCategoriesWithEmptyCloudId() =>
      (select(categories)
            ..orderBy([(t) => OrderingTerm(expression: t.title)])
            ..where((tbl) => tbl.cloudId.equals('')))
          .get();

  Future<CategoryDB> getCategoryById(int id) =>
      (select(categories)..where((c) => c.id.equals(id))).getSingle();

  Future<CategoryDB?> getCategoryByCloudId(String cloudId) => (select(
    categories,
  )..where((c) => c.cloudId.equals(cloudId))).getSingleOrNull();

  Future<List<CategoryDB>> getAllNotSynced() =>
      (select(categories)..where((tbl) => tbl.synced.equals(false))).get();

  Stream<CategoryDB> watchCategoryById(int id) =>
      (select(categories)..where((c) => c.id.equals(id))).watchSingle();

  Stream<List<CategoryDB>> watchAllCategoriesByType(CategoryType type) =>
      (select(categories)
            ..where(
              (cat) => cat.operationType.equals(
                const CategoryTypeConverter().toSql(type),
              ),
            )
            ..orderBy([(t) => OrderingTerm(expression: t.title)]))
          .watch();

  Future<Map<DateTime, Balance>> getMonthlyExpenses(
    int categoryId,
    int monthCount,
  ) async {
    final sumBalance = cashflows.sum.sum().cast<int>();
    final currency = cashflows.currency.cast<String>();
    final startMonth = cashflows.date.month;
    final startYear = cashflows.date.year;

    final pastDate = DateTime.now()
        .copyWith(month: DateTime.now().month - monthCount)
        .copyWith(day: 1, hour: 0, minute: 0, second: 0);

    final query =
        select(
            cashflows,
          ).addColumns([sumBalance, currency, startMonth, startYear])
          ..where(cashflows.category.equals(categoryId))
          ..where(cashflows.date.isBiggerOrEqualValue(pastDate))
          ..groupBy([startMonth, startYear, currency]);

    final List<TypedResult> rows = await query.get();

    final Map<DateTime, Balance> result = {};

    for (final row in rows) {
      final month = row.read(startMonth);
      final year = row.read(startYear);
      final totalSum = row.read(sumBalance) ?? 0;
      final cur = const CurrencyConverter().fromSql(row.read(currency)!);

      if (year != null && month != null) {
        final date = DateTime(year, month);
        final sum = Sum(totalSum, cur);
        if(result.containsKey(date)){
          result[date]!.addSum(sum);
        }else {
          result[date] = Balance([sum]);
        }
      }
    }

    // Дозаполняем нулями
    final now = DateTime.now();

    for (int i = 0; i < monthCount; i++) {
      final monthDate = DateTime(now.year, now.month - i, 1);
      result.putIfAbsent(monthDate, () => Balance());
    }

    return result;
  }

  Stream<List<CashflowEntity>> watchMonthCashFlow(
    DateTime date,
    Set<int> categoryIds,
  ) {
    final monthStart = DateTime(date.year, date.month);
    final monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return _watchCashFlow(monthStart, monthEnd, categoryIds);
  }

  Stream<List<CashflowEntity>> watchYearCashFlow(
    DateTime date,
    Set<int> categoryIds,
  ) {
    final yearStart = DateTime(date.year);
    final monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return _watchCashFlow(yearStart, monthEnd, categoryIds);
  }

  Stream<List<CashflowEntity>> _watchCashFlow(
    DateTime lower,
    DateTime higher,
    Set<int> categoryIds,
  ) {
    final sumBalance = cashflows.sum.sum().cast<int>();
    final currency = cashflows.currency.cast<String>();
    final categoryId = cashflows.category.cast<int>();

    final where = categoryIds.isEmpty
        ? cashflows.date.isBetweenValues(lower, higher)
        : cashflows.date.isBetweenValues(lower, higher) &
              (cashflows.category.isIn(categoryIds));

    final query = db.selectOnly(cashflows);
    query
      ..addColumns([categoryId, currency, sumBalance])
      ..where(where)
      ..groupBy([categoryId, currency]);

    return query.watch().map(
      (rows) => rows
          .map(
            (c) => CashflowEntity(
              categoryId: c.read(categoryId)!,
              sum: Sum(
                c.read(sumBalance)!,
                const CurrencyConverter().fromSql(c.read(currency)!),
              ),
            ),
          )
          .toList(),
    );
  }

  Future<int> insertCategory(CategoriesCompanion entity) =>
      into(categories).insert(entity);

  Future<int> updateFields(int categoryId, CategoriesCompanion entity) =>
      (update(categories)..where((t) => t.id.equals(categoryId))).write(entity);

  Future<int> markAsSynced(int categoryId, String cloudId) {
    return (update(categories)..where((t) => t.id.equals(categoryId))).write(
      CategoriesCompanion(cloudId: Value(cloudId), synced: const Value(true)),
    );
  }

  Future updateCategory(CategoryDB entity) =>
      update(categories).replace(entity);

  Future<void> batchInsert(List<CategoryDB> categoryList) {
    return batch((batch) {
      batch.insertAll(
        categories,
        categoryList
            .map(
              (p) => CategoriesCompanion.insert(
                id: Value(p.id),
                cloudId: p.cloudId,
                title: p.title,
                operationType: p.operationType,
                budgetType: p.budgetType,
                budget: p.budget,
              ),
            )
            .toList(),
      );
    });
  }
}
