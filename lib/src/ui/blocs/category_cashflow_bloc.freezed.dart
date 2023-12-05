// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_cashflow_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CategoryCashflowEvent {
  List<CategoryCashflow> get categories => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryCashflow> categories) change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryCashflow> categories)? change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryCashflow> categories)? change,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeCategoryCashflowEvent value) change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeCategoryCashflowEvent value)? change,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeCategoryCashflowEvent value)? change,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCashflowEventCopyWith<CategoryCashflowEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCashflowEventCopyWith<$Res> {
  factory $CategoryCashflowEventCopyWith(CategoryCashflowEvent value,
          $Res Function(CategoryCashflowEvent) then) =
      _$CategoryCashflowEventCopyWithImpl<$Res, CategoryCashflowEvent>;
  @useResult
  $Res call({List<CategoryCashflow> categories});
}

/// @nodoc
class _$CategoryCashflowEventCopyWithImpl<$Res,
        $Val extends CategoryCashflowEvent>
    implements $CategoryCashflowEventCopyWith<$Res> {
  _$CategoryCashflowEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashflow>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChangeCategoryCashflowEventImplCopyWith<$Res>
    implements $CategoryCashflowEventCopyWith<$Res> {
  factory _$$ChangeCategoryCashflowEventImplCopyWith(
          _$ChangeCategoryCashflowEventImpl value,
          $Res Function(_$ChangeCategoryCashflowEventImpl) then) =
      __$$ChangeCategoryCashflowEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryCashflow> categories});
}

/// @nodoc
class __$$ChangeCategoryCashflowEventImplCopyWithImpl<$Res>
    extends _$CategoryCashflowEventCopyWithImpl<$Res,
        _$ChangeCategoryCashflowEventImpl>
    implements _$$ChangeCategoryCashflowEventImplCopyWith<$Res> {
  __$$ChangeCategoryCashflowEventImplCopyWithImpl(
      _$ChangeCategoryCashflowEventImpl _value,
      $Res Function(_$ChangeCategoryCashflowEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$ChangeCategoryCashflowEventImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashflow>,
    ));
  }
}

/// @nodoc

class _$ChangeCategoryCashflowEventImpl
    implements _ChangeCategoryCashflowEvent {
  const _$ChangeCategoryCashflowEventImpl(
      {required final List<CategoryCashflow> categories})
      : _categories = categories;

  final List<CategoryCashflow> _categories;
  @override
  List<CategoryCashflow> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryCashflowEvent.change(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeCategoryCashflowEventImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeCategoryCashflowEventImplCopyWith<_$ChangeCategoryCashflowEventImpl>
      get copyWith => __$$ChangeCategoryCashflowEventImplCopyWithImpl<
          _$ChangeCategoryCashflowEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<CategoryCashflow> categories) change,
  }) {
    return change(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<CategoryCashflow> categories)? change,
  }) {
    return change?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<CategoryCashflow> categories)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeCategoryCashflowEvent value) change,
  }) {
    return change(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeCategoryCashflowEvent value)? change,
  }) {
    return change?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeCategoryCashflowEvent value)? change,
    required TResult orElse(),
  }) {
    if (change != null) {
      return change(this);
    }
    return orElse();
  }
}

abstract class _ChangeCategoryCashflowEvent implements CategoryCashflowEvent {
  const factory _ChangeCategoryCashflowEvent(
          {required final List<CategoryCashflow> categories}) =
      _$ChangeCategoryCashflowEventImpl;

  @override
  List<CategoryCashflow> get categories;
  @override
  @JsonKey(ignore: true)
  _$$ChangeCategoryCashflowEventImplCopyWith<_$ChangeCategoryCashflowEventImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CategoryCashflowState {
  List<CategoryCashflow> get categories => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CategoryCashflowStateCopyWith<CategoryCashflowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryCashflowStateCopyWith<$Res> {
  factory $CategoryCashflowStateCopyWith(CategoryCashflowState value,
          $Res Function(CategoryCashflowState) then) =
      _$CategoryCashflowStateCopyWithImpl<$Res, CategoryCashflowState>;
  @useResult
  $Res call({List<CategoryCashflow> categories});
}

/// @nodoc
class _$CategoryCashflowStateCopyWithImpl<$Res,
        $Val extends CategoryCashflowState>
    implements $CategoryCashflowStateCopyWith<$Res> {
  _$CategoryCashflowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_value.copyWith(
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashflow>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryCashflowStateImplCopyWith<$Res>
    implements $CategoryCashflowStateCopyWith<$Res> {
  factory _$$CategoryCashflowStateImplCopyWith(
          _$CategoryCashflowStateImpl value,
          $Res Function(_$CategoryCashflowStateImpl) then) =
      __$$CategoryCashflowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<CategoryCashflow> categories});
}

/// @nodoc
class __$$CategoryCashflowStateImplCopyWithImpl<$Res>
    extends _$CategoryCashflowStateCopyWithImpl<$Res,
        _$CategoryCashflowStateImpl>
    implements _$$CategoryCashflowStateImplCopyWith<$Res> {
  __$$CategoryCashflowStateImplCopyWithImpl(_$CategoryCashflowStateImpl _value,
      $Res Function(_$CategoryCashflowStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoryCashflowStateImpl(
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryCashflow>,
    ));
  }
}

/// @nodoc

class _$CategoryCashflowStateImpl implements _CategoryCashflowState {
  const _$CategoryCashflowStateImpl(
      {required final List<CategoryCashflow> categories})
      : _categories = categories;

  final List<CategoryCashflow> _categories;
  @override
  List<CategoryCashflow> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoryCashflowState(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryCashflowStateImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryCashflowStateImplCopyWith<_$CategoryCashflowStateImpl>
      get copyWith => __$$CategoryCashflowStateImplCopyWithImpl<
          _$CategoryCashflowStateImpl>(this, _$identity);
}

abstract class _CategoryCashflowState implements CategoryCashflowState {
  const factory _CategoryCashflowState(
          {required final List<CategoryCashflow> categories}) =
      _$CategoryCashflowStateImpl;

  @override
  List<CategoryCashflow> get categories;
  @override
  @JsonKey(ignore: true)
  _$$CategoryCashflowStateImplCopyWith<_$CategoryCashflowStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
