import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:result/result.dart';

import 'mappers/cloud_converter.dart';
import 'models/account.dart';
import 'models/category.dart';
import 'models/cloud_entity.dart';
import 'models/operation.dart';
import 'models/user.dart';

abstract class TableDAO<T extends CloudEntity> {
  final CollectionReference<Map<String, dynamic>> _collection;
  final CloudConverter<T> _mapper;

  const TableDAO({
    required collection,
    required mapper,
  })  : _collection = collection,
        _mapper = mapper;

  Future<Result<String>> add(T entity) async {
    try {
      var doc = await _collection.add(_mapper.mapToCloud(entity));

      return Result.success(doc.id);
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }

  Future<Result<void>> delete(String cloudId) async {
    try {
      return Result.success(
          await _collection.doc(cloudId).update(_mapper.deletionMark()));
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }

  Future<Result<Iterable<T>>> getAll(DateTime dateSince) async {
    try {
      var docs = await _collection
          .where(_mapper.keyUpdated, isGreaterThanOrEqualTo: dateSince)
          .get();

      return Result.success(
          docs.docs.map<T>((doc) => _mapper.mapToDart(doc.id, doc.data())));
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }

  Future<Result<void>> refreshEntitySyncDate(String entityId) async {
    try {
      return Result.success(await _collection
          .doc(entityId)
          .update({_mapper.keyUpdated: DateTime.now()}));
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }

  Future<Result<void>> update(T entity) async {
    try {
      return Result.success(
          await _collection.doc(entity.id).update(_mapper.mapToCloud(entity)));
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }

  Future<Result<void>> deleteAll() async {
    try {
      var queryOperation;

      queryOperation = await _collection.get();

      return Result.success(
          await Future.forEach<T>(queryOperation, (element) async {
        await delete(element.id);
      }));
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }
}

class AccountsDAO extends TableDAO<Account> {
  const AccountsDAO({super.collection, super.mapper});
}

class CategoriesDAO extends TableDAO<Category> {
  const CategoriesDAO({super.collection, super.mapper});
}

class OperationDAO extends TableDAO<Operation> {
  const OperationDAO({super.collection, super.mapper});
}

class UserDao {
  final CollectionReference<Map<String, dynamic>> _collection;

  final CloudConverter<User> _mapper;

  UserDao(this._collection, this._mapper);

  Future<Result<void>> add(User user) async {
    try {
      return Result.success(
          await _collection.doc(user.id).set(_mapper.mapToCloud(user)));
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }

  Future<Result<List<User>>> getAll() async {
    try {
      var doc = await _collection.get();

      return Result.success(doc.docs
          .map((doc) => _mapper.mapToDart(doc.id, doc.data()))
          .toList());
    } catch (e, s) {
      return Result.failure(Exception('$e + $s'));
    }
  }
}
