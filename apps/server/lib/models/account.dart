import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  Account({
    required this.id,
    required this.name,
    required this.userId,
    required this.isDebt,
    required this.groupId,
  });

  final String id;
  final String name;
  final bool isDebt;
  final String userId;
  final String groupId;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
