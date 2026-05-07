import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_account.freezed.dart';

@freezed
abstract class CloudAccount with _$CloudAccount {
  const factory CloudAccount({
    required String id,
    required String title,
    required bool isDebt,
    required bool deleted,
    required String? userGoogleId,
  }) = _CloudAccount;
}
