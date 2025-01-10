
import 'package:spring/models/currency.dart';

typedef UserGroupId = int;

class UserGroup{
  final UserGroupId id;
  final String name;
  final Currency currency;

  UserGroup({required this.currency, required this.id, required this.name});
}