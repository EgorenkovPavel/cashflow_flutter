
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid_value.dart';

import '../uuid_converter.dart';

part 'user_group.freezed.dart';
part 'user_group.g.dart';

@freezed
abstract class UserGroupResponce with _$UserGroupResponce {
  const factory UserGroupResponce({
    @UuidValueConverter() required UuidValue id,
    required String name,
  }) = _UserGroupResponce;

  factory UserGroupResponce.fromJson(Map<String, Object?> json) =>
      _$UserGroupResponceFromJson(json);
}
