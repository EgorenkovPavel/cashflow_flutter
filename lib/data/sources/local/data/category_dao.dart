import 'package:drift/drift.dart';
import 'package:money_tracker/data/sources/local/db_converters/operation_type_converter.dart';
import 'package:money_tracker/data/sources/local/data/database.dart';
import 'package:money_tracker/domain/models.dart';

part 'category_dao.g.dart';

class CategoryCashflowEntity {
  CategoryDB category;
  int monthCashflow;
  int yearCashflow;

  CategoryCashflowEntity({
    required this.category,
    required this.monthCashflow,
    required this.yearCashflow,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryCashflowEntity &&
          runtimeType == other.runtimeType &&
          category == other.category;

  @override
  int get hashCode => category.hashCode;
}

class CategoryBudgetEntity {
  CategoryDB category;
  int budget;

  CategoryBudgetEntity(this.category, this.budget);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryBudgetEntity &&
          runtimeType == other.runtimeType &&
          category == other.category;

  @override
  int get hashCode => category.hashCode;
}

class CategoryMonthCashflowEntity {
  final CategoryDB category;
  final int month;
  final int cashflow;

  CategoryMonthCashflowEntity({
    required this.month,
    required this.category,
    required this.cashflow,
  });
}

@DriftAccessor(tables: [Categories, Cashflows])
class CategoryDao extends DatabaseAccessor<Database> with _$CategoryDaoMixin {
  // Called by the AppDatabase class
  CategoryDao(Database db) : super(db);

  Stream<List<CategoryDB>> watchAllCategories() => (select(categories)
        ..orderBy(
          [
            (t) => OrderingTerm(expression: t.title),
          ],
        ))
      .watch();

  Future<List<CategoryDB>> getAllCategories() => (select(categories)
        ..orderBy(
          [
            (t) => OrderingTerm(expression: t.title),
          ],
        ))
      .get();

  Future<List<CategoryDB>> getAllCategoriesWithEmptyCloudId() =>
      (select(categories)
            ..orderBy(
              [
                (t) => OrderingTerm(expression: t.title),
              ],
            )
            ..where((tbl) => tbl.cloudId.equals('')))
          .get();

  Future<CategoryDB> getCategoryById(int id) => (select(categories)
        ..where(
          (c) => c.id.equals(id),
        ))
      .getSingle();

  Future<CategoryDB?> getCategoryByCloudId(String cloudId) =>
      (select(categories)
            ..where(
              (c) => c.cloudId.equals(cloudId),
            ))
          .getSingleOrNull();

  Future<List<CategoryDB>> getAllNotSynced() =>
      (select(categories)..where((tbl) => tbl.synced.equals(false))).get();

  Stream<CategoryDB> watchNotSynced() =>
      (select(categories)..where((tbl) => tbl.synced.equals(false)))
          .watchSingle();

  Stream<CategoryDB> watchCategoryById(int id) => (select(categories)
        ..where(
          (c) => c.id.equals(id),
        ))
      .watchSingle();

  Stream<List<CategoryDB>> watchAllCategoriesByType(OperationType type) =>
      (select(categories)
            ..where(
              (cat) => cat.operationType.equals(
                const OperationTypeConverter().mapToSql(type),
              ),
            )
            ..orderBy(
              [
                (t) => OrderingTerm(expression: t.title),
              ],
            ))
          .watch();

  Future<List<CategoryDB>> getAllCategoriesByType(OperationType type) =>
      (select(categories)
            ..where(
              (cat) => cat.operationType.equals(
                const OperationTypeConverter().mapToSql(type),
              ),
            )
            ..orderBy(
              [
                (t) => OrderingTerm(expression: t.title),
              ],
            ))
          .get();

  Stream<List<CategoryCashflowEntity>> watchAllCategoryCashflowBudget(
      DateTime date) {
    var yearStart = DateTime(date.year);
    var monthStart = DateTime(date.year, date.month);
    var monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelect(
      'SELECT *, '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "monthCashflow", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "yearCashflow" '
      'FROM categories c '
      'ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd),
        Variable.withDateTime(yearStart),
        Variable.withDateTime(monthEnd),
      ],
      readsFrom: {categories, cashflows},
    ).watch().map(
          (rows) => rows
              .map(
                (row) => CategoryCashflowEntity(
                  category: CategoryDB.fromData(row.data),
                  monthCashflow: row.read<int?>('monthCashflow') ?? 0,
                  yearCashflow: row.read<int?>('yearCashflow') ?? 0,
                ),
              )
              .toList(),
        );
  }

  Stream<List<CategoryCashflowEntity>> watchCategoryCashflowByType(
      DateTime date, OperationType type) {
    var yearStart = DateTime(date.year);
    var monthStart = DateTime(date.year, date.month);
    var monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelect(
      'SELECT *, '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "monthCashflow", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "yearCashflow" '
      'FROM categories c '
      'WHERE operation_type = ? '
      'ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd),
        Variable.withDateTime(yearStart),
        Variable.withDateTime(monthEnd),
        Variable.withInt(const OperationTypeConverter().mapToSql(type)!),
      ],
      readsFrom: {categories, cashflows},
    ).watch().map(
          (rows) => rows
              .map(
                (row) => CategoryCashflowEntity(
                  category: CategoryDB.fromData(row.data),
                  monthCashflow: row.read<int?>('monthCashflow') ?? 0,
                  yearCashflow: row.read<int?>('yearCashflow') ?? 0,
                ),
              )
              .toList(),
        );
  }

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id) {
    final sum = cashflows.sum.sum();
    final month = cashflows.date.month;
    final year = cashflows.date.year;

    final query = (select(cashflows)..where((tbl) => tbl.category.equals(id)))
        .addColumns([sum, month, year]);
    query.groupBy([month, year]);

    return query.watch().map((rows) => rows
        .map((row) => SumOnDate(
            date:
                DateTime(row.read<int?>(year) ?? 0, row.read<int?>(month) ?? 0),
            sum: row.read<int?>(sum) ?? 0))
        .toList());
  }

  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id) {
    final sum = cashflows.sum.sum();
    final year = cashflows.date.year;

    final query = (select(cashflows)..where((tbl) => tbl.category.equals(id)))
        .addColumns([sum, year]);
    query.groupBy([year]);

    return query.watch().map((rows) => rows
        .map((row) => SumOnDate(
            date: DateTime(row.read<int?>(year) ?? 0),
            sum: row.read<int?>(sum) ?? 0))
        .toList());
  }

  Future<List<CategoryMonthCashflowEntity>> getCashflowByYear(int year) {
    var yearStart = DateTime(year);
    var yearEnd = DateTime(year + 1);

    return customSelect(
      'SELECT *, '
      'FROM categories c '
          'LEFT JOIN '
        '(SELECT category as category, strftime("%m", date) as month, SUM(sum) as sum FROM cashflow WHERE date BETWEEN ? AND ?) AS "cashflow" '
          'ON c.id = cashflow.category',
        variables: [
        Variable.withDateTime(yearStart),
        Variable.withDateTime(yearEnd),
      ],
      readsFrom: {categories, cashflows},
    ).get().then(
          (rows) => rows
              .map(
                (row) => CategoryMonthCashflowEntity(
                  category: CategoryDB.fromData(row.data),
                  month: row.read<int?>('month') ?? 0,
                  cashflow: row.read<int?>('sum') ?? 0,
                ),
              )
              .toList(),
        );
  }

  Future<List<CategoryCashflowEntity>> getCategoryCashflowByType(
      DateTime date, OperationType type) {
    var yearStart = DateTime(date.year);
    var monthStart = DateTime(date.year, date.month);
    var monthEnd = date.month < 12
        ? DateTime(date.year, date.month + 1)
        : DateTime(date.year + 1, 1);

    return customSelect(
      'SELECT *, '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "monthCashflow", '
      '(SELECT SUM(sum) as sum FROM cashflow WHERE category = c.id AND date BETWEEN ? AND ?) AS "yearCashflow" '
      'FROM categories c '
      'WHERE operation_type = ? '
      'ORDER BY title;',
      variables: [
        Variable.withDateTime(monthStart),
        Variable.withDateTime(monthEnd),
        Variable.withDateTime(yearStart),
        Variable.withDateTime(monthEnd),
        Variable.withInt(const OperationTypeConverter().mapToSql(type)!),
      ],
      readsFrom: {categories, cashflows},
    ).get().then(
          (rows) => rows
              .map(
                (row) => CategoryCashflowEntity(
                  category: CategoryDB.fromData(row.data),
                  monthCashflow: row.read<int?>('monthCashflow') ?? 0,
                  yearCashflow: row.read<int?>('yearCashflow') ?? 0,
                ),
              )
              .toList(),
        );
  }

  Stream<List<CategoryBudgetEntity>> watchCategoryBudgetByType(
      OperationType type) {
    return customSelect(
      'SELECT *, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date DESC LIMIT 1) AS "budget" '
      'FROM categories c '
      'WHERE operation_type = ? '
      'ORDER BY title;',
      variables: [
        Variable.withDateTime(DateTime.now()),
        Variable.withInt(const OperationTypeConverter().mapToSql(type)!),
      ],
      readsFrom: {categories},
    ).watch().map(
          (rows) => rows
              .map(
                (row) => CategoryBudgetEntity(
                  CategoryDB.fromData(row.data),
                  row.read<int>('budget'),
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
      CategoriesCompanion(
        cloudId: Value(cloudId),
        synced: const Value(true),
      ),
    );
  }

  Future updateCategory(CategoryDB entity) =>
      update(categories).replace(entity);

  Stream<int> watchBudget(DateTime date) {
    return customSelect(
      'SELECT c.operation_type, '
      '(SELECT sum as sum FROM budgets WHERE category = c.id AND date <= ? ORDER BY date LIMIT 1) AS "budget" '
      'FROM categories c;',
      variables: [
        Variable.withDateTime(date),
      ],
      readsFrom: {categories},
    ).watch().map(
          (rows) => rows
              .map(
                (row) => const OperationTypeConverter().mapToDart(
                          row.read<int>('operation_type'),
                        ) ==
                        OperationType.INPUT
                    ? row.read<int>('budget')
                    : -(row.read<int>('budget')),
              )
              .fold(0, (a, b) => a + b),
        );
  }

  Future<void> batchInsert(List<CategoryDB> _categories) {
    return batch(
      (batch) {
        batch.insertAll(
          categories,
          _categories
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
      },
    );
  }
}
