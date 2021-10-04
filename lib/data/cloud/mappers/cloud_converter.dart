
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class CloudConverter<T>{
  const CloudConverter();

  T mapToDart(QueryDocumentSnapshot<Object?> doc);

  Map<String, dynamic> mapToCloud(T value);
}