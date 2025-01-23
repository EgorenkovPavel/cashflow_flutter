import 'currency.dart';

typedef UserGroupId = int;

class UserGroup {
  final UserGroupId id;
  final String name;
  final Currency currency;

  UserGroup({
    required this.currency,
    required this.id,
    required this.name,
  });

  factory UserGroup.fromJson(Map<String, dynamic> data) => UserGroup(
    id: data['id'],
    name: data['name'],
    currency: Currency.byName(data['currency']),
  );
}
