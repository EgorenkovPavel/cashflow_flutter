// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loading_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoadingState {
  int get accountCount => throw _privateConstructorUsedError;
  int get categoryCount => throw _privateConstructorUsedError;
  int get operationCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoadingStateCopyWith<LoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoadingStateCopyWith<$Res> {
  factory $LoadingStateCopyWith(
          LoadingState value, $Res Function(LoadingState) then) =
      _$LoadingStateCopyWithImpl<$Res, LoadingState>;
  @useResult
  $Res call({int accountCount, int categoryCount, int operationCount});
}

/// @nodoc
class _$LoadingStateCopyWithImpl<$Res, $Val extends LoadingState>
    implements $LoadingStateCopyWith<$Res> {
  _$LoadingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountCount = null,
    Object? categoryCount = null,
    Object? operationCount = null,
  }) {
    return _then(_value.copyWith(
      accountCount: null == accountCount
          ? _value.accountCount
          : accountCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryCount: null == categoryCount
          ? _value.categoryCount
          : categoryCount // ignore: cast_nullable_to_non_nullable
              as int,
      operationCount: null == operationCount
          ? _value.operationCount
          : operationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoadingStateCopyWith<$Res>
    implements $LoadingStateCopyWith<$Res> {
  factory _$$_LoadingStateCopyWith(
          _$_LoadingState value, $Res Function(_$_LoadingState) then) =
      __$$_LoadingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int accountCount, int categoryCount, int operationCount});
}

/// @nodoc
class __$$_LoadingStateCopyWithImpl<$Res>
    extends _$LoadingStateCopyWithImpl<$Res, _$_LoadingState>
    implements _$$_LoadingStateCopyWith<$Res> {
  __$$_LoadingStateCopyWithImpl(
      _$_LoadingState _value, $Res Function(_$_LoadingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountCount = null,
    Object? categoryCount = null,
    Object? operationCount = null,
  }) {
    return _then(_$_LoadingState(
      accountCount: null == accountCount
          ? _value.accountCount
          : accountCount // ignore: cast_nullable_to_non_nullable
              as int,
      categoryCount: null == categoryCount
          ? _value.categoryCount
          : categoryCount // ignore: cast_nullable_to_non_nullable
              as int,
      operationCount: null == operationCount
          ? _value.operationCount
          : operationCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_LoadingState implements _LoadingState {
  const _$_LoadingState(
      {required this.accountCount,
      required this.categoryCount,
      required this.operationCount});

  @override
  final int accountCount;
  @override
  final int categoryCount;
  @override
  final int operationCount;

  @override
  String toString() {
    return 'LoadingState(accountCount: $accountCount, categoryCount: $categoryCount, operationCount: $operationCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoadingState &&
            (identical(other.accountCount, accountCount) ||
                other.accountCount == accountCount) &&
            (identical(other.categoryCount, categoryCount) ||
                other.categoryCount == categoryCount) &&
            (identical(other.operationCount, operationCount) ||
                other.operationCount == operationCount));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accountCount, categoryCount, operationCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoadingStateCopyWith<_$_LoadingState> get copyWith =>
      __$$_LoadingStateCopyWithImpl<_$_LoadingState>(this, _$identity);
}

abstract class _LoadingState implements LoadingState {
  const factory _LoadingState(
      {required final int accountCount,
      required final int categoryCount,
      required final int operationCount}) = _$_LoadingState;

  @override
  int get accountCount;
  @override
  int get categoryCount;
  @override
  int get operationCount;
  @override
  @JsonKey(ignore: true)
  _$$_LoadingStateCopyWith<_$_LoadingState> get copyWith =>
      throw _privateConstructorUsedError;
}
