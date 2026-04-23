import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_view.freezed.dart';

@freezed
abstract class AccountView with _$AccountView {
  const factory AccountView({required int id, required String title}) =
      _AccountView;
}
