// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
OperationResponse _$OperationResponseFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'input':
          return InputOperationResponse.fromJson(
            json
          );
                case 'output':
          return OutputOperationResponse.fromJson(
            json
          );
                case 'transfer':
          return TransferOperationResponse.fromJson(
            json
          );
                case 'exchange':
          return ExchangeOperationResponse.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'OperationResponse',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$OperationResponse {

@UuidValueConverter() UuidValue get id; bool get deleted; DateTime get date;@UuidValueConverter() UuidValue get account; Money get sum;
/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationResponseCopyWith<OperationResponse> get copyWith => _$OperationResponseCopyWithImpl<OperationResponse>(this as OperationResponse, _$identity);

  /// Serializes this OperationResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,sum);

@override
String toString() {
  return 'OperationResponse(id: $id, deleted: $deleted, date: $date, account: $account, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $OperationResponseCopyWith<$Res>  {
  factory $OperationResponseCopyWith(OperationResponse value, $Res Function(OperationResponse) _then) = _$OperationResponseCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account, Money sum
});


$MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$OperationResponseCopyWithImpl<$Res>
    implements $OperationResponseCopyWith<$Res> {
  _$OperationResponseCopyWithImpl(this._self, this._then);

  final OperationResponse _self;
  final $Res Function(OperationResponse) _then;

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? sum = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}


/// Adds pattern-matching-related methods to [OperationResponse].
extension OperationResponsePatterns on OperationResponse {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InputOperationResponse value)?  input,TResult Function( OutputOperationResponse value)?  output,TResult Function( TransferOperationResponse value)?  transfer,TResult Function( ExchangeOperationResponse value)?  exchange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InputOperationResponse() when input != null:
return input(_that);case OutputOperationResponse() when output != null:
return output(_that);case TransferOperationResponse() when transfer != null:
return transfer(_that);case ExchangeOperationResponse() when exchange != null:
return exchange(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InputOperationResponse value)  input,required TResult Function( OutputOperationResponse value)  output,required TResult Function( TransferOperationResponse value)  transfer,required TResult Function( ExchangeOperationResponse value)  exchange,}){
final _that = this;
switch (_that) {
case InputOperationResponse():
return input(_that);case OutputOperationResponse():
return output(_that);case TransferOperationResponse():
return transfer(_that);case ExchangeOperationResponse():
return exchange(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InputOperationResponse value)?  input,TResult? Function( OutputOperationResponse value)?  output,TResult? Function( TransferOperationResponse value)?  transfer,TResult? Function( ExchangeOperationResponse value)?  exchange,}){
final _that = this;
switch (_that) {
case InputOperationResponse() when input != null:
return input(_that);case OutputOperationResponse() when output != null:
return output(_that);case TransferOperationResponse() when transfer != null:
return transfer(_that);case ExchangeOperationResponse() when exchange != null:
return exchange(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  input,TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  output,TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)?  transfer,TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)?  exchange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InputOperationResponse() when input != null:
return input(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputOperationResponse() when output != null:
return output(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferOperationResponse() when transfer != null:
return transfer(_that.id,_that.deleted,_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeOperationResponse() when exchange != null:
return exchange(_that.id,_that.deleted,_that.date,_that.account,_that.sum,_that.recSum);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)  input,required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)  output,required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)  transfer,required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)  exchange,}) {final _that = this;
switch (_that) {
case InputOperationResponse():
return input(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputOperationResponse():
return output(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferOperationResponse():
return transfer(_that.id,_that.deleted,_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeOperationResponse():
return exchange(_that.id,_that.deleted,_that.date,_that.account,_that.sum,_that.recSum);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  input,TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  output,TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)?  transfer,TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)?  exchange,}) {final _that = this;
switch (_that) {
case InputOperationResponse() when input != null:
return input(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputOperationResponse() when output != null:
return output(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferOperationResponse() when transfer != null:
return transfer(_that.id,_that.deleted,_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeOperationResponse() when exchange != null:
return exchange(_that.id,_that.deleted,_that.date,_that.account,_that.sum,_that.recSum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class InputOperationResponse extends OperationResponse {
  const InputOperationResponse({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.category, required this.sum, final  String? $type}): $type = $type ?? 'input',super._();
  factory InputOperationResponse.fromJson(Map<String, dynamic> json) => _$InputOperationResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue category;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputOperationResponseCopyWith<InputOperationResponse> get copyWith => _$InputOperationResponseCopyWithImpl<InputOperationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputOperationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputOperationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,category,sum);

@override
String toString() {
  return 'OperationResponse.input(id: $id, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $InputOperationResponseCopyWith<$Res> implements $OperationResponseCopyWith<$Res> {
  factory $InputOperationResponseCopyWith(InputOperationResponse value, $Res Function(InputOperationResponse) _then) = _$InputOperationResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue category, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$InputOperationResponseCopyWithImpl<$Res>
    implements $InputOperationResponseCopyWith<$Res> {
  _$InputOperationResponseCopyWithImpl(this._self, this._then);

  final InputOperationResponse _self;
  final $Res Function(InputOperationResponse) _then;

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(InputOperationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class OutputOperationResponse extends OperationResponse {
  const OutputOperationResponse({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.category, required this.sum, final  String? $type}): $type = $type ?? 'output',super._();
  factory OutputOperationResponse.fromJson(Map<String, dynamic> json) => _$OutputOperationResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue category;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputOperationResponseCopyWith<OutputOperationResponse> get copyWith => _$OutputOperationResponseCopyWithImpl<OutputOperationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutputOperationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputOperationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,category,sum);

@override
String toString() {
  return 'OperationResponse.output(id: $id, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $OutputOperationResponseCopyWith<$Res> implements $OperationResponseCopyWith<$Res> {
  factory $OutputOperationResponseCopyWith(OutputOperationResponse value, $Res Function(OutputOperationResponse) _then) = _$OutputOperationResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue category, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$OutputOperationResponseCopyWithImpl<$Res>
    implements $OutputOperationResponseCopyWith<$Res> {
  _$OutputOperationResponseCopyWithImpl(this._self, this._then);

  final OutputOperationResponse _self;
  final $Res Function(OutputOperationResponse) _then;

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(OutputOperationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class TransferOperationResponse extends OperationResponse {
  const TransferOperationResponse({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.recAccount, required this.sum, final  String? $type}): $type = $type ?? 'transfer',super._();
  factory TransferOperationResponse.fromJson(Map<String, dynamic> json) => _$TransferOperationResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue recAccount;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferOperationResponseCopyWith<TransferOperationResponse> get copyWith => _$TransferOperationResponseCopyWithImpl<TransferOperationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferOperationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferOperationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,recAccount,sum);

@override
String toString() {
  return 'OperationResponse.transfer(id: $id, deleted: $deleted, date: $date, account: $account, recAccount: $recAccount, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $TransferOperationResponseCopyWith<$Res> implements $OperationResponseCopyWith<$Res> {
  factory $TransferOperationResponseCopyWith(TransferOperationResponse value, $Res Function(TransferOperationResponse) _then) = _$TransferOperationResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue recAccount, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$TransferOperationResponseCopyWithImpl<$Res>
    implements $TransferOperationResponseCopyWith<$Res> {
  _$TransferOperationResponseCopyWithImpl(this._self, this._then);

  final TransferOperationResponse _self;
  final $Res Function(TransferOperationResponse) _then;

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? recAccount = null,Object? sum = null,}) {
  return _then(TransferOperationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,recAccount: null == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ExchangeOperationResponse extends OperationResponse {
  const ExchangeOperationResponse({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, required this.sum, required this.recSum, final  String? $type}): $type = $type ?? 'exchange',super._();
  factory ExchangeOperationResponse.fromJson(Map<String, dynamic> json) => _$ExchangeOperationResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@override final  Money sum;
 final  Money recSum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeOperationResponseCopyWith<ExchangeOperationResponse> get copyWith => _$ExchangeOperationResponseCopyWithImpl<ExchangeOperationResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeOperationResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeOperationResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.recSum, recSum) || other.recSum == recSum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,sum,recSum);

@override
String toString() {
  return 'OperationResponse.exchange(id: $id, deleted: $deleted, date: $date, account: $account, sum: $sum, recSum: $recSum)';
}


}

/// @nodoc
abstract mixin class $ExchangeOperationResponseCopyWith<$Res> implements $OperationResponseCopyWith<$Res> {
  factory $ExchangeOperationResponseCopyWith(ExchangeOperationResponse value, $Res Function(ExchangeOperationResponse) _then) = _$ExchangeOperationResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account, Money sum, Money recSum
});


@override $MoneyCopyWith<$Res> get sum;$MoneyCopyWith<$Res> get recSum;

}
/// @nodoc
class _$ExchangeOperationResponseCopyWithImpl<$Res>
    implements $ExchangeOperationResponseCopyWith<$Res> {
  _$ExchangeOperationResponseCopyWithImpl(this._self, this._then);

  final ExchangeOperationResponse _self;
  final $Res Function(ExchangeOperationResponse) _then;

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? sum = null,Object? recSum = null,}) {
  return _then(ExchangeOperationResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,recSum: null == recSum ? _self.recSum : recSum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of OperationResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get recSum {
  
  return $MoneyCopyWith<$Res>(_self.recSum, (value) {
    return _then(_self.copyWith(recSum: value));
  });
}
}

CreateOperationRequest _$CreateOperationRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'input':
          return InputCreateOperationRequest.fromJson(
            json
          );
                case 'output':
          return OutputCreateOperationRequest.fromJson(
            json
          );
                case 'transfer':
          return TransferCreateOperationRequest.fromJson(
            json
          );
                case 'exchange':
          return ExchangeCreateOperationRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CreateOperationRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CreateOperationRequest {

 DateTime get date;@UuidValueConverter() UuidValue get account; Money get sum;
/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateOperationRequestCopyWith<CreateOperationRequest> get copyWith => _$CreateOperationRequestCopyWithImpl<CreateOperationRequest>(this as CreateOperationRequest, _$identity);

  /// Serializes this CreateOperationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateOperationRequest&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,account,sum);

@override
String toString() {
  return 'CreateOperationRequest(date: $date, account: $account, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $CreateOperationRequestCopyWith<$Res>  {
  factory $CreateOperationRequestCopyWith(CreateOperationRequest value, $Res Function(CreateOperationRequest) _then) = _$CreateOperationRequestCopyWithImpl;
@useResult
$Res call({
 DateTime date,@UuidValueConverter() UuidValue account, Money sum
});


$MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$CreateOperationRequestCopyWithImpl<$Res>
    implements $CreateOperationRequestCopyWith<$Res> {
  _$CreateOperationRequestCopyWithImpl(this._self, this._then);

  final CreateOperationRequest _self;
  final $Res Function(CreateOperationRequest) _then;

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? account = null,Object? sum = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}


/// Adds pattern-matching-related methods to [CreateOperationRequest].
extension CreateOperationRequestPatterns on CreateOperationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InputCreateOperationRequest value)?  input,TResult Function( OutputCreateOperationRequest value)?  output,TResult Function( TransferCreateOperationRequest value)?  transfer,TResult Function( ExchangeCreateOperationRequest value)?  exchange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InputCreateOperationRequest() when input != null:
return input(_that);case OutputCreateOperationRequest() when output != null:
return output(_that);case TransferCreateOperationRequest() when transfer != null:
return transfer(_that);case ExchangeCreateOperationRequest() when exchange != null:
return exchange(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InputCreateOperationRequest value)  input,required TResult Function( OutputCreateOperationRequest value)  output,required TResult Function( TransferCreateOperationRequest value)  transfer,required TResult Function( ExchangeCreateOperationRequest value)  exchange,}){
final _that = this;
switch (_that) {
case InputCreateOperationRequest():
return input(_that);case OutputCreateOperationRequest():
return output(_that);case TransferCreateOperationRequest():
return transfer(_that);case ExchangeCreateOperationRequest():
return exchange(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InputCreateOperationRequest value)?  input,TResult? Function( OutputCreateOperationRequest value)?  output,TResult? Function( TransferCreateOperationRequest value)?  transfer,TResult? Function( ExchangeCreateOperationRequest value)?  exchange,}){
final _that = this;
switch (_that) {
case InputCreateOperationRequest() when input != null:
return input(_that);case OutputCreateOperationRequest() when output != null:
return output(_that);case TransferCreateOperationRequest() when transfer != null:
return transfer(_that);case ExchangeCreateOperationRequest() when exchange != null:
return exchange(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  input,TResult Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  output,TResult Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)?  transfer,TResult Function( DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)?  exchange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InputCreateOperationRequest() when input != null:
return input(_that.date,_that.account,_that.category,_that.sum);case OutputCreateOperationRequest() when output != null:
return output(_that.date,_that.account,_that.category,_that.sum);case TransferCreateOperationRequest() when transfer != null:
return transfer(_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeCreateOperationRequest() when exchange != null:
return exchange(_that.date,_that.account,_that.sum,_that.recSum);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)  input,required TResult Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)  output,required TResult Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)  transfer,required TResult Function( DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)  exchange,}) {final _that = this;
switch (_that) {
case InputCreateOperationRequest():
return input(_that.date,_that.account,_that.category,_that.sum);case OutputCreateOperationRequest():
return output(_that.date,_that.account,_that.category,_that.sum);case TransferCreateOperationRequest():
return transfer(_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeCreateOperationRequest():
return exchange(_that.date,_that.account,_that.sum,_that.recSum);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  input,TResult? Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  output,TResult? Function( DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)?  transfer,TResult? Function( DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)?  exchange,}) {final _that = this;
switch (_that) {
case InputCreateOperationRequest() when input != null:
return input(_that.date,_that.account,_that.category,_that.sum);case OutputCreateOperationRequest() when output != null:
return output(_that.date,_that.account,_that.category,_that.sum);case TransferCreateOperationRequest() when transfer != null:
return transfer(_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeCreateOperationRequest() when exchange != null:
return exchange(_that.date,_that.account,_that.sum,_that.recSum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class InputCreateOperationRequest implements CreateOperationRequest {
  const InputCreateOperationRequest({required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.category, required this.sum, final  String? $type}): $type = $type ?? 'input';
  factory InputCreateOperationRequest.fromJson(Map<String, dynamic> json) => _$InputCreateOperationRequestFromJson(json);

@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue category;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputCreateOperationRequestCopyWith<InputCreateOperationRequest> get copyWith => _$InputCreateOperationRequestCopyWithImpl<InputCreateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputCreateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputCreateOperationRequest&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,account,category,sum);

@override
String toString() {
  return 'CreateOperationRequest.input(date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $InputCreateOperationRequestCopyWith<$Res> implements $CreateOperationRequestCopyWith<$Res> {
  factory $InputCreateOperationRequestCopyWith(InputCreateOperationRequest value, $Res Function(InputCreateOperationRequest) _then) = _$InputCreateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue category, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$InputCreateOperationRequestCopyWithImpl<$Res>
    implements $InputCreateOperationRequestCopyWith<$Res> {
  _$InputCreateOperationRequestCopyWithImpl(this._self, this._then);

  final InputCreateOperationRequest _self;
  final $Res Function(InputCreateOperationRequest) _then;

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(InputCreateOperationRequest(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class OutputCreateOperationRequest implements CreateOperationRequest {
  const OutputCreateOperationRequest({required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.category, required this.sum, final  String? $type}): $type = $type ?? 'output';
  factory OutputCreateOperationRequest.fromJson(Map<String, dynamic> json) => _$OutputCreateOperationRequestFromJson(json);

@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue category;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputCreateOperationRequestCopyWith<OutputCreateOperationRequest> get copyWith => _$OutputCreateOperationRequestCopyWithImpl<OutputCreateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutputCreateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputCreateOperationRequest&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,account,category,sum);

@override
String toString() {
  return 'CreateOperationRequest.output(date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $OutputCreateOperationRequestCopyWith<$Res> implements $CreateOperationRequestCopyWith<$Res> {
  factory $OutputCreateOperationRequestCopyWith(OutputCreateOperationRequest value, $Res Function(OutputCreateOperationRequest) _then) = _$OutputCreateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue category, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$OutputCreateOperationRequestCopyWithImpl<$Res>
    implements $OutputCreateOperationRequestCopyWith<$Res> {
  _$OutputCreateOperationRequestCopyWithImpl(this._self, this._then);

  final OutputCreateOperationRequest _self;
  final $Res Function(OutputCreateOperationRequest) _then;

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(OutputCreateOperationRequest(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class TransferCreateOperationRequest implements CreateOperationRequest {
  const TransferCreateOperationRequest({required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.recAccount, required this.sum, final  String? $type}): $type = $type ?? 'transfer';
  factory TransferCreateOperationRequest.fromJson(Map<String, dynamic> json) => _$TransferCreateOperationRequestFromJson(json);

@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue recAccount;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferCreateOperationRequestCopyWith<TransferCreateOperationRequest> get copyWith => _$TransferCreateOperationRequestCopyWithImpl<TransferCreateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferCreateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferCreateOperationRequest&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,account,recAccount,sum);

@override
String toString() {
  return 'CreateOperationRequest.transfer(date: $date, account: $account, recAccount: $recAccount, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $TransferCreateOperationRequestCopyWith<$Res> implements $CreateOperationRequestCopyWith<$Res> {
  factory $TransferCreateOperationRequestCopyWith(TransferCreateOperationRequest value, $Res Function(TransferCreateOperationRequest) _then) = _$TransferCreateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue recAccount, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$TransferCreateOperationRequestCopyWithImpl<$Res>
    implements $TransferCreateOperationRequestCopyWith<$Res> {
  _$TransferCreateOperationRequestCopyWithImpl(this._self, this._then);

  final TransferCreateOperationRequest _self;
  final $Res Function(TransferCreateOperationRequest) _then;

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? account = null,Object? recAccount = null,Object? sum = null,}) {
  return _then(TransferCreateOperationRequest(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,recAccount: null == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ExchangeCreateOperationRequest implements CreateOperationRequest {
  const ExchangeCreateOperationRequest({required this.date, @UuidValueConverter() required this.account, required this.sum, required this.recSum, final  String? $type}): $type = $type ?? 'exchange';
  factory ExchangeCreateOperationRequest.fromJson(Map<String, dynamic> json) => _$ExchangeCreateOperationRequestFromJson(json);

@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@override final  Money sum;
 final  Money recSum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeCreateOperationRequestCopyWith<ExchangeCreateOperationRequest> get copyWith => _$ExchangeCreateOperationRequestCopyWithImpl<ExchangeCreateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeCreateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeCreateOperationRequest&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.recSum, recSum) || other.recSum == recSum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,account,sum,recSum);

@override
String toString() {
  return 'CreateOperationRequest.exchange(date: $date, account: $account, sum: $sum, recSum: $recSum)';
}


}

/// @nodoc
abstract mixin class $ExchangeCreateOperationRequestCopyWith<$Res> implements $CreateOperationRequestCopyWith<$Res> {
  factory $ExchangeCreateOperationRequestCopyWith(ExchangeCreateOperationRequest value, $Res Function(ExchangeCreateOperationRequest) _then) = _$ExchangeCreateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
 DateTime date,@UuidValueConverter() UuidValue account, Money sum, Money recSum
});


@override $MoneyCopyWith<$Res> get sum;$MoneyCopyWith<$Res> get recSum;

}
/// @nodoc
class _$ExchangeCreateOperationRequestCopyWithImpl<$Res>
    implements $ExchangeCreateOperationRequestCopyWith<$Res> {
  _$ExchangeCreateOperationRequestCopyWithImpl(this._self, this._then);

  final ExchangeCreateOperationRequest _self;
  final $Res Function(ExchangeCreateOperationRequest) _then;

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? account = null,Object? sum = null,Object? recSum = null,}) {
  return _then(ExchangeCreateOperationRequest(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,recSum: null == recSum ? _self.recSum : recSum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of CreateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get recSum {
  
  return $MoneyCopyWith<$Res>(_self.recSum, (value) {
    return _then(_self.copyWith(recSum: value));
  });
}
}

UpdateOperationRequest _$UpdateOperationRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'input':
          return InputUpdateOperationRequest.fromJson(
            json
          );
                case 'output':
          return OutputUpdateOperationRequest.fromJson(
            json
          );
                case 'transfer':
          return TransferUpdateOperationRequest.fromJson(
            json
          );
                case 'exchange':
          return ExchangeUpdateOperationRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'UpdateOperationRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$UpdateOperationRequest {

@UuidValueConverter() UuidValue get id; bool get deleted; DateTime get date;@UuidValueConverter() UuidValue get account; Money get sum;
/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateOperationRequestCopyWith<UpdateOperationRequest> get copyWith => _$UpdateOperationRequestCopyWithImpl<UpdateOperationRequest>(this as UpdateOperationRequest, _$identity);

  /// Serializes this UpdateOperationRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateOperationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,sum);

@override
String toString() {
  return 'UpdateOperationRequest(id: $id, deleted: $deleted, date: $date, account: $account, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $UpdateOperationRequestCopyWith<$Res>  {
  factory $UpdateOperationRequestCopyWith(UpdateOperationRequest value, $Res Function(UpdateOperationRequest) _then) = _$UpdateOperationRequestCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account, Money sum
});


$MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$UpdateOperationRequestCopyWithImpl<$Res>
    implements $UpdateOperationRequestCopyWith<$Res> {
  _$UpdateOperationRequestCopyWithImpl(this._self, this._then);

  final UpdateOperationRequest _self;
  final $Res Function(UpdateOperationRequest) _then;

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? sum = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}
/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}


/// Adds pattern-matching-related methods to [UpdateOperationRequest].
extension UpdateOperationRequestPatterns on UpdateOperationRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InputUpdateOperationRequest value)?  input,TResult Function( OutputUpdateOperationRequest value)?  output,TResult Function( TransferUpdateOperationRequest value)?  transfer,TResult Function( ExchangeUpdateOperationRequest value)?  exchange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InputUpdateOperationRequest() when input != null:
return input(_that);case OutputUpdateOperationRequest() when output != null:
return output(_that);case TransferUpdateOperationRequest() when transfer != null:
return transfer(_that);case ExchangeUpdateOperationRequest() when exchange != null:
return exchange(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InputUpdateOperationRequest value)  input,required TResult Function( OutputUpdateOperationRequest value)  output,required TResult Function( TransferUpdateOperationRequest value)  transfer,required TResult Function( ExchangeUpdateOperationRequest value)  exchange,}){
final _that = this;
switch (_that) {
case InputUpdateOperationRequest():
return input(_that);case OutputUpdateOperationRequest():
return output(_that);case TransferUpdateOperationRequest():
return transfer(_that);case ExchangeUpdateOperationRequest():
return exchange(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InputUpdateOperationRequest value)?  input,TResult? Function( OutputUpdateOperationRequest value)?  output,TResult? Function( TransferUpdateOperationRequest value)?  transfer,TResult? Function( ExchangeUpdateOperationRequest value)?  exchange,}){
final _that = this;
switch (_that) {
case InputUpdateOperationRequest() when input != null:
return input(_that);case OutputUpdateOperationRequest() when output != null:
return output(_that);case TransferUpdateOperationRequest() when transfer != null:
return transfer(_that);case ExchangeUpdateOperationRequest() when exchange != null:
return exchange(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  input,TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  output,TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)?  transfer,TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)?  exchange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InputUpdateOperationRequest() when input != null:
return input(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputUpdateOperationRequest() when output != null:
return output(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferUpdateOperationRequest() when transfer != null:
return transfer(_that.id,_that.deleted,_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeUpdateOperationRequest() when exchange != null:
return exchange(_that.id,_that.deleted,_that.date,_that.account,_that.sum,_that.recSum);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)  input,required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)  output,required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)  transfer,required TResult Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)  exchange,}) {final _that = this;
switch (_that) {
case InputUpdateOperationRequest():
return input(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputUpdateOperationRequest():
return output(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferUpdateOperationRequest():
return transfer(_that.id,_that.deleted,_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeUpdateOperationRequest():
return exchange(_that.id,_that.deleted,_that.date,_that.account,_that.sum,_that.recSum);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  input,TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue category,  Money sum)?  output,TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account, @UuidValueConverter()  UuidValue recAccount,  Money sum)?  transfer,TResult? Function(@UuidValueConverter()  UuidValue id,  bool deleted,  DateTime date, @UuidValueConverter()  UuidValue account,  Money sum,  Money recSum)?  exchange,}) {final _that = this;
switch (_that) {
case InputUpdateOperationRequest() when input != null:
return input(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputUpdateOperationRequest() when output != null:
return output(_that.id,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferUpdateOperationRequest() when transfer != null:
return transfer(_that.id,_that.deleted,_that.date,_that.account,_that.recAccount,_that.sum);case ExchangeUpdateOperationRequest() when exchange != null:
return exchange(_that.id,_that.deleted,_that.date,_that.account,_that.sum,_that.recSum);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class InputUpdateOperationRequest extends UpdateOperationRequest {
  const InputUpdateOperationRequest({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.category, required this.sum, final  String? $type}): $type = $type ?? 'input',super._();
  factory InputUpdateOperationRequest.fromJson(Map<String, dynamic> json) => _$InputUpdateOperationRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue category;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputUpdateOperationRequestCopyWith<InputUpdateOperationRequest> get copyWith => _$InputUpdateOperationRequestCopyWithImpl<InputUpdateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$InputUpdateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputUpdateOperationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,category,sum);

@override
String toString() {
  return 'UpdateOperationRequest.input(id: $id, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $InputUpdateOperationRequestCopyWith<$Res> implements $UpdateOperationRequestCopyWith<$Res> {
  factory $InputUpdateOperationRequestCopyWith(InputUpdateOperationRequest value, $Res Function(InputUpdateOperationRequest) _then) = _$InputUpdateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue category, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$InputUpdateOperationRequestCopyWithImpl<$Res>
    implements $InputUpdateOperationRequestCopyWith<$Res> {
  _$InputUpdateOperationRequestCopyWithImpl(this._self, this._then);

  final InputUpdateOperationRequest _self;
  final $Res Function(InputUpdateOperationRequest) _then;

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(InputUpdateOperationRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class OutputUpdateOperationRequest extends UpdateOperationRequest {
  const OutputUpdateOperationRequest({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.category, required this.sum, final  String? $type}): $type = $type ?? 'output',super._();
  factory OutputUpdateOperationRequest.fromJson(Map<String, dynamic> json) => _$OutputUpdateOperationRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue category;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputUpdateOperationRequestCopyWith<OutputUpdateOperationRequest> get copyWith => _$OutputUpdateOperationRequestCopyWithImpl<OutputUpdateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OutputUpdateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputUpdateOperationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,category,sum);

@override
String toString() {
  return 'UpdateOperationRequest.output(id: $id, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $OutputUpdateOperationRequestCopyWith<$Res> implements $UpdateOperationRequestCopyWith<$Res> {
  factory $OutputUpdateOperationRequestCopyWith(OutputUpdateOperationRequest value, $Res Function(OutputUpdateOperationRequest) _then) = _$OutputUpdateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue category, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$OutputUpdateOperationRequestCopyWithImpl<$Res>
    implements $OutputUpdateOperationRequestCopyWith<$Res> {
  _$OutputUpdateOperationRequestCopyWithImpl(this._self, this._then);

  final OutputUpdateOperationRequest _self;
  final $Res Function(OutputUpdateOperationRequest) _then;

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(OutputUpdateOperationRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class TransferUpdateOperationRequest extends UpdateOperationRequest {
  const TransferUpdateOperationRequest({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, @UuidValueConverter() required this.recAccount, required this.sum, final  String? $type}): $type = $type ?? 'transfer',super._();
  factory TransferUpdateOperationRequest.fromJson(Map<String, dynamic> json) => _$TransferUpdateOperationRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@UuidValueConverter() final  UuidValue recAccount;
@override final  Money sum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferUpdateOperationRequestCopyWith<TransferUpdateOperationRequest> get copyWith => _$TransferUpdateOperationRequestCopyWithImpl<TransferUpdateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransferUpdateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferUpdateOperationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount)&&(identical(other.sum, sum) || other.sum == sum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,recAccount,sum);

@override
String toString() {
  return 'UpdateOperationRequest.transfer(id: $id, deleted: $deleted, date: $date, account: $account, recAccount: $recAccount, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $TransferUpdateOperationRequestCopyWith<$Res> implements $UpdateOperationRequestCopyWith<$Res> {
  factory $TransferUpdateOperationRequestCopyWith(TransferUpdateOperationRequest value, $Res Function(TransferUpdateOperationRequest) _then) = _$TransferUpdateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account,@UuidValueConverter() UuidValue recAccount, Money sum
});


@override $MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$TransferUpdateOperationRequestCopyWithImpl<$Res>
    implements $TransferUpdateOperationRequestCopyWith<$Res> {
  _$TransferUpdateOperationRequestCopyWithImpl(this._self, this._then);

  final TransferUpdateOperationRequest _self;
  final $Res Function(TransferUpdateOperationRequest) _then;

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? recAccount = null,Object? sum = null,}) {
  return _then(TransferUpdateOperationRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,recAccount: null == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc
@JsonSerializable()

class ExchangeUpdateOperationRequest extends UpdateOperationRequest {
  const ExchangeUpdateOperationRequest({@UuidValueConverter() required this.id, this.deleted = false, required this.date, @UuidValueConverter() required this.account, required this.sum, required this.recSum, final  String? $type}): $type = $type ?? 'exchange',super._();
  factory ExchangeUpdateOperationRequest.fromJson(Map<String, dynamic> json) => _$ExchangeUpdateOperationRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
@override@UuidValueConverter() final  UuidValue account;
@override final  Money sum;
 final  Money recSum;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeUpdateOperationRequestCopyWith<ExchangeUpdateOperationRequest> get copyWith => _$ExchangeUpdateOperationRequestCopyWithImpl<ExchangeUpdateOperationRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExchangeUpdateOperationRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeUpdateOperationRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sum, sum) || other.sum == sum)&&(identical(other.recSum, recSum) || other.recSum == recSum));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,deleted,date,account,sum,recSum);

@override
String toString() {
  return 'UpdateOperationRequest.exchange(id: $id, deleted: $deleted, date: $date, account: $account, sum: $sum, recSum: $recSum)';
}


}

/// @nodoc
abstract mixin class $ExchangeUpdateOperationRequestCopyWith<$Res> implements $UpdateOperationRequestCopyWith<$Res> {
  factory $ExchangeUpdateOperationRequestCopyWith(ExchangeUpdateOperationRequest value, $Res Function(ExchangeUpdateOperationRequest) _then) = _$ExchangeUpdateOperationRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, bool deleted, DateTime date,@UuidValueConverter() UuidValue account, Money sum, Money recSum
});


@override $MoneyCopyWith<$Res> get sum;$MoneyCopyWith<$Res> get recSum;

}
/// @nodoc
class _$ExchangeUpdateOperationRequestCopyWithImpl<$Res>
    implements $ExchangeUpdateOperationRequestCopyWith<$Res> {
  _$ExchangeUpdateOperationRequestCopyWithImpl(this._self, this._then);

  final ExchangeUpdateOperationRequest _self;
  final $Res Function(ExchangeUpdateOperationRequest) _then;

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? deleted = null,Object? date = null,Object? account = null,Object? sum = null,Object? recSum = null,}) {
  return _then(ExchangeUpdateOperationRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as UuidValue,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,recSum: null == recSum ? _self.recSum : recSum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sum {
  
  return $MoneyCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}/// Create a copy of UpdateOperationRequest
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get recSum {
  
  return $MoneyCopyWith<$Res>(_self.recSum, (value) {
    return _then(_self.copyWith(recSum: value));
  });
}
}

// dart format on
