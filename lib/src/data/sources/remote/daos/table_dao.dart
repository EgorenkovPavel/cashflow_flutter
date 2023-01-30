import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/src/utils/exceptions.dart';

import '../mappers/cloud_converter.dart';
import '../models/cloud_models.dart';

abstract class TableDAO<T> {
  final CollectionReference<Map<String, dynamic>> _collection;

  final CloudConverter<T> _mapper;

  final String _key_updated;

  const TableDAO({
    required collection,
    required mapper,
    required key_updated,
  })  : _collection = collection,
        _mapper = mapper,
        _key_updated = key_updated;

  /// Throws [NetworkException]
  Future<String> add(T entity) async {
    var doc = await _collection.add(_mapper.mapToCloud(entity));

    return doc.id;
  }

  /// Throws [NetworkException]
  Future<void> delete(String cloudId) async {
    await _collection.doc(cloudId).update(_mapper.deletionMark());
  }

  /// Throws [NetworkException]
  Future<Iterable<T>> getAll(DateTime dateSince) async {
    var docs = await _collection
        .where(_key_updated, isGreaterThanOrEqualTo: dateSince)
        .get();

    return docs.docs.map<T>((doc) => _mapper.mapToDart(doc));
  }

  /// Throws [NetworkException]
  Future<void> refreshEntitySyncDate(String entityId) async {
    await _collection.doc(entityId).update({_key_updated: DateTime.now()});
  }

  /// Throws [NetworkException]
  Future<void> update(T entity) async {
    await _collection.doc(getId(entity)).update(_mapper.mapToCloud(entity));
  }

  /// Throws [NetworkException]
  Future<void> deleteAll() async {
    var queryOperation;

    queryOperation = await _collection.get();

    await Future.forEach<T>(queryOperation, (element) async {
      await delete(getId(element));
    });
  }

  String getId(T entity);
}

class AccountsDAO extends TableDAO<CloudAccount> {
  const AccountsDAO({
    required CollectionReference<Map<String, dynamic>>? collection,
    required CloudConverter<CloudAccount> mapper,
    required String key_updated,
  }) : super(
          collection: collection,
          mapper: mapper,
          key_updated: key_updated,
        );

  @override
  String getId(CloudAccount entity) => entity.id;
}

class CategoriesDAO extends TableDAO<CloudCategory> {
  const CategoriesDAO({
    required CollectionReference<Map<String, dynamic>>? collection,
    required CloudConverter<CloudCategory> mapper,
    required String key_updated,
  }) : super(
          collection: collection,
          mapper: mapper,
          key_updated: key_updated,
        );

  @override
  String getId(CloudCategory entity) => entity.id;
}

class OperationDAO extends TableDAO<CloudOperation> {
  const OperationDAO({
    required CollectionReference<Map<String, dynamic>>? collection,
    required CloudConverter<CloudOperation> mapper,
    required String key_updated,
  }) : super(
          collection: collection,
          mapper: mapper,
          key_updated: key_updated,
        );

  @override
  String getId(CloudOperation entity) => entity.id;
}
