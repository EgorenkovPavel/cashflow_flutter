
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:money_tracker/data/cloud/cloud_converter.dart';

class CloudAccount{

  final String? id;
  final String title;

  CloudAccount({required this.id, required this.title});

}

class CloudAccountConverter extends CloudConverter<CloudAccount>{

  static const String _KEY_TITLE = 'title';
  static const String _KEY_USERS = 'users';

  final String userId;

  const CloudAccountConverter({required this.userId});

  @override
  Map<String, dynamic> mapToCloud(CloudAccount value) {
    return {
      _KEY_TITLE: value.title,
      _KEY_USERS: [userId],
    };
  }

  @override
  CloudAccount mapToDart(QueryDocumentSnapshot<Object?> doc) {
    return CloudAccount(
      id: doc.id,
      title: doc.get(_KEY_TITLE),
    );
  }

}
