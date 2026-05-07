import 'package:freezed_annotation/freezed_annotation.dart';

part 'cloud_user.freezed.dart';

@freezed
abstract class CloudUser with _$CloudUser {
  const factory CloudUser({
    required String googleId,
    required String name,
    required String photo,
  }) = _CloudUser;
}