import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_account.freezed.dart';

@freezed
class CloudAccount with _$CloudAccount {
  const factory CloudAccount({
    required String id,
    required String title,
    required bool isDebt,
    required bool deleted,
  }) = _CloudAccount;
}
