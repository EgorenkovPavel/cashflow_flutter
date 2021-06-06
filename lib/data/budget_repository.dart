import 'package:money_tracker/data/database/database.dart';
import 'package:money_tracker/data/mappers/budget_mapper.dart';
import 'package:money_tracker/domain/models.dart';

class BudgetRepository {
  final Database db;

  BudgetRepository(this.db);

  final List<Budget> Function(List<BudgetItem>) _mapBudgetList =
      (list) => const BudgetMapper().mapListToDart(list);

  final Budget Function(BudgetItem) _mapBudget =
      (list) => const BudgetMapper().mapToDart(list);

  final BudgetDB Function(Budget) _mapBudgetDB = (item) => BudgetDB(
      year: item.year,
      month: item.month,
      category: item.category.id,
      budgetType: item.type,
      sum: item.sum);

  Future<Budget> get(
      int categoryId, BudgetType type, int month, int year) async =>
      _mapBudget(await db.budgetDao.getBudget(categoryId, type, month, year));

  //
  // Stream<List<BalanceOnDate>> watchMonthBudget() =>
  //     db.budgetDao.watchMonthBudget();
  //
  Stream<List<Budget>> watchByCategory(int categoryId) =>
      db.budgetDao.watchBudgetByCategory(categoryId).map(_mapBudgetList);

  Stream<List<Budget>> watchByType(BudgetType type) =>
      db.budgetDao.watchBudgetByType(type).map(_mapBudgetList);

  //
  // Stream<List<BudgetData>> watchBudget(DateTime date) =>
  //     db.budgetDao.watchBudget(date);
  //
  Future<void> insert(Budget entity) =>
      db.budgetDao.insertBudget(_mapBudgetDB(entity));

  Future<void> update(Budget entity) =>
      db.budgetDao.updateBudget(_mapBudgetDB(entity));

  Future<void> delete(Budget entity) =>
      db.budgetDao.deleteBudget(_mapBudgetDB(entity));
}
