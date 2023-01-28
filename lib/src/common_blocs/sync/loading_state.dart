import 'package:freezed_annotation/freezed_annotation.dart';

part 'loading_state.freezed.dart';

@freezed
class LoadingState with _$LoadingState {
  const factory LoadingState({
    required int accountCount,
    required int categoryCount,
    required int operationCount,
  }) = _LoadingState;
}
