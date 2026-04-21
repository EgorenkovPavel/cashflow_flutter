
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid_value.dart';

import '../uuid_converter.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class UserResponce with _$UserResponce {
  const factory UserResponce({
    @UuidValueConverter() required UuidValue id,
    required String googleId,
    required String name,
    required String photo,
    @UuidValueConverter() required UuidValue userGroup,
  }) = _UserResponce;

  factory UserResponce.fromJson(Map<String, Object?> json) =>
      _$UserResponceFromJson(json);
}
