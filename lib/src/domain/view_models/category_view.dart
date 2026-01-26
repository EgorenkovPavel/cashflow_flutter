import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_view.freezed.dart';

@freezed
abstract class CategoryView with _$CategoryView {
  const factory CategoryView(
      {required int id, required String title}) = _CategoryView;
}
