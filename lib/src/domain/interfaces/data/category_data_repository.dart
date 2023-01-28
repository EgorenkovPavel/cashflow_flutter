import '../../models.dart';

abstract class CategoryDataRepository {
  Stream<List<Category>> watchAll();

  Future<List<Category>> getAll();

  Stream<List<CategoryCashflow>> watchCashflowByType(
      DateTime date,
      OperationType type,
      );

  Future<List<CategoryCashflow>> getCashflowByType(
      DateTime date,
      OperationType type,
      );

  Future<List<CategoryMonthCashflow>> getCashflowByYear(int year);

  Stream<List<SumOnDate>> watchCashflowByCategoryByMonth(int id);

  Stream<List<SumOnDate>> watchCashflowByCategoryByYear(int id);

  Future<Category> getById(int id);

  Stream<Category> watchById(int id);

  Stream<List<Category>> watchAllByType(OperationType type);

  Future<List<Category>> getAllByType(OperationType type);

  Future<int> insert(Category entity);

  Future<void> update(Category entity);
}