import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    @Default(0) int id,
    required String googleId,
    required String name,
    required String photo,
  }) = _User;

}
