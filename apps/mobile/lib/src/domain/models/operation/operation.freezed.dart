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
/// @nodoc
mixin _$Operation {

 int get id; String get cloudId; bool get synced; bool get deleted; DateTime get date;
/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationCopyWith<Operation> get copyWith => _$OperationCopyWithImpl<Operation>(this as Operation, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Operation&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,synced,deleted,date);

@override
String toString() {
  return 'Operation(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date)';
}


}

/// @nodoc
abstract mixin class $OperationCopyWith<$Res>  {
  factory $OperationCopyWith(Operation value, $Res Function(Operation) _then) = _$OperationCopyWithImpl;
@useResult
$Res call({
 int id, String cloudId, bool synced, bool deleted, DateTime date
});




}
/// @nodoc
class _$OperationCopyWithImpl<$Res>
    implements $OperationCopyWith<$Res> {
  _$OperationCopyWithImpl(this._self, this._then);

  final Operation _self;
  final $Res Function(Operation) _then;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cloudId = null,Object? synced = null,Object? deleted = null,Object? date = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [Operation].
extension OperationPatterns on Operation {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InputOperation value)?  input,TResult Function( OutputOperation value)?  output,TResult Function( TransferOperation value)?  transfer,TResult Function( ExchangeOperation value)?  exchange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InputOperation() when input != null:
return input(_that);case OutputOperation() when output != null:
return output(_that);case TransferOperation() when transfer != null:
return transfer(_that);case ExchangeOperation() when exchange != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InputOperation value)  input,required TResult Function( OutputOperation value)  output,required TResult Function( TransferOperation value)  transfer,required TResult Function( ExchangeOperation value)  exchange,}){
final _that = this;
switch (_that) {
case InputOperation():
return input(_that);case OutputOperation():
return output(_that);case TransferOperation():
return transfer(_that);case ExchangeOperation():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InputOperation value)?  input,TResult? Function( OutputOperation value)?  output,TResult? Function( TransferOperation value)?  transfer,TResult? Function( ExchangeOperation value)?  exchange,}){
final _that = this;
switch (_that) {
case InputOperation() when input != null:
return input(_that);case OutputOperation() when output != null:
return output(_that);case TransferOperation() when transfer != null:
return transfer(_that);case ExchangeOperation() when exchange != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  int category,  Money sum)?  input,TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  int category,  Money sum)?  output,TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int accountSend,  int accountReceived,  Money sum)?  transfer,TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  Money sumSend,  Money sumReceived)?  exchange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InputOperation() when input != null:
return input(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputOperation() when output != null:
return output(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferOperation() when transfer != null:
return transfer(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.accountSend,_that.accountReceived,_that.sum);case ExchangeOperation() when exchange != null:
return exchange(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.sumSend,_that.sumReceived);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  int category,  Money sum)  input,required TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  int category,  Money sum)  output,required TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int accountSend,  int accountReceived,  Money sum)  transfer,required TResult Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  Money sumSend,  Money sumReceived)  exchange,}) {final _that = this;
switch (_that) {
case InputOperation():
return input(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputOperation():
return output(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferOperation():
return transfer(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.accountSend,_that.accountReceived,_that.sum);case ExchangeOperation():
return exchange(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.sumSend,_that.sumReceived);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  int category,  Money sum)?  input,TResult? Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  int category,  Money sum)?  output,TResult? Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int accountSend,  int accountReceived,  Money sum)?  transfer,TResult? Function( int id,  String cloudId,  bool synced,  bool deleted,  DateTime date,  int account,  Money sumSend,  Money sumReceived)?  exchange,}) {final _that = this;
switch (_that) {
case InputOperation() when input != null:
return input(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case OutputOperation() when output != null:
return output(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.category,_that.sum);case TransferOperation() when transfer != null:
return transfer(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.accountSend,_that.accountReceived,_that.sum);case ExchangeOperation() when exchange != null:
return exchange(_that.id,_that.cloudId,_that.synced,_that.deleted,_that.date,_that.account,_that.sumSend,_that.sumReceived);case _:
  return null;

}
}

}

/// @nodoc


class InputOperation extends Operation {
  const InputOperation({this.id = 0, this.cloudId = '', this.synced = false, this.deleted = false, required this.date, required this.account, required this.category, required this.sum}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override@JsonKey() final  bool synced;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
 final  int account;
 final  int category;
 final  Money sum;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputOperationCopyWith<InputOperation> get copyWith => _$InputOperationCopyWithImpl<InputOperation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,synced,deleted,date,account,category,sum);

@override
String toString() {
  return 'Operation.input(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $InputOperationCopyWith<$Res> implements $OperationCopyWith<$Res> {
  factory $InputOperationCopyWith(InputOperation value, $Res Function(InputOperation) _then) = _$InputOperationCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, bool synced, bool deleted, DateTime date, int account, int category, Money sum
});


$MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$InputOperationCopyWithImpl<$Res>
    implements $InputOperationCopyWith<$Res> {
  _$InputOperationCopyWithImpl(this._self, this._then);

  final InputOperation _self;
  final $Res Function(InputOperation) _then;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? synced = null,Object? deleted = null,Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(InputOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of Operation
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


class OutputOperation extends Operation {
  const OutputOperation({this.id = 0, this.cloudId = '', this.synced = false, this.deleted = false, required this.date, required this.account, required this.category, required this.sum}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override@JsonKey() final  bool synced;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
 final  int account;
 final  int category;
 final  Money sum;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputOperationCopyWith<OutputOperation> get copyWith => _$OutputOperationCopyWithImpl<OutputOperation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,synced,deleted,date,account,category,sum);

@override
String toString() {
  return 'Operation.output(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $OutputOperationCopyWith<$Res> implements $OperationCopyWith<$Res> {
  factory $OutputOperationCopyWith(OutputOperation value, $Res Function(OutputOperation) _then) = _$OutputOperationCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, bool synced, bool deleted, DateTime date, int account, int category, Money sum
});


$MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$OutputOperationCopyWithImpl<$Res>
    implements $OutputOperationCopyWith<$Res> {
  _$OutputOperationCopyWithImpl(this._self, this._then);

  final OutputOperation _self;
  final $Res Function(OutputOperation) _then;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? synced = null,Object? deleted = null,Object? date = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(OutputOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as int,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of Operation
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


class TransferOperation extends Operation {
  const TransferOperation({this.id = 0, this.cloudId = '', this.synced = false, this.deleted = false, required this.date, required this.accountSend, required this.accountReceived, required this.sum}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override@JsonKey() final  bool synced;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
 final  int accountSend;
 final  int accountReceived;
 final  Money sum;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferOperationCopyWith<TransferOperation> get copyWith => _$TransferOperationCopyWithImpl<TransferOperation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.accountSend, accountSend) || other.accountSend == accountSend)&&(identical(other.accountReceived, accountReceived) || other.accountReceived == accountReceived)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,synced,deleted,date,accountSend,accountReceived,sum);

@override
String toString() {
  return 'Operation.transfer(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, accountSend: $accountSend, accountReceived: $accountReceived, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $TransferOperationCopyWith<$Res> implements $OperationCopyWith<$Res> {
  factory $TransferOperationCopyWith(TransferOperation value, $Res Function(TransferOperation) _then) = _$TransferOperationCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, bool synced, bool deleted, DateTime date, int accountSend, int accountReceived, Money sum
});


$MoneyCopyWith<$Res> get sum;

}
/// @nodoc
class _$TransferOperationCopyWithImpl<$Res>
    implements $TransferOperationCopyWith<$Res> {
  _$TransferOperationCopyWithImpl(this._self, this._then);

  final TransferOperation _self;
  final $Res Function(TransferOperation) _then;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? synced = null,Object? deleted = null,Object? date = null,Object? accountSend = null,Object? accountReceived = null,Object? sum = null,}) {
  return _then(TransferOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,accountSend: null == accountSend ? _self.accountSend : accountSend // ignore: cast_nullable_to_non_nullable
as int,accountReceived: null == accountReceived ? _self.accountReceived : accountReceived // ignore: cast_nullable_to_non_nullable
as int,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of Operation
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


class ExchangeOperation extends Operation {
  const ExchangeOperation({this.id = 0, this.cloudId = '', this.synced = false, this.deleted = false, required this.date, required this.account, required this.sumSend, required this.sumReceived}): super._();
  

@override@JsonKey() final  int id;
@override@JsonKey() final  String cloudId;
@override@JsonKey() final  bool synced;
@override@JsonKey() final  bool deleted;
@override final  DateTime date;
 final  int account;
 final  Money sumSend;
 final  Money sumReceived;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeOperationCopyWith<ExchangeOperation> get copyWith => _$ExchangeOperationCopyWithImpl<ExchangeOperation>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeOperation&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.date, date) || other.date == date)&&(identical(other.account, account) || other.account == account)&&(identical(other.sumSend, sumSend) || other.sumSend == sumSend)&&(identical(other.sumReceived, sumReceived) || other.sumReceived == sumReceived));
}


@override
int get hashCode => Object.hash(runtimeType,id,cloudId,synced,deleted,date,account,sumSend,sumReceived);

@override
String toString() {
  return 'Operation.exchange(id: $id, cloudId: $cloudId, synced: $synced, deleted: $deleted, date: $date, account: $account, sumSend: $sumSend, sumReceived: $sumReceived)';
}


}

/// @nodoc
abstract mixin class $ExchangeOperationCopyWith<$Res> implements $OperationCopyWith<$Res> {
  factory $ExchangeOperationCopyWith(ExchangeOperation value, $Res Function(ExchangeOperation) _then) = _$ExchangeOperationCopyWithImpl;
@override @useResult
$Res call({
 int id, String cloudId, bool synced, bool deleted, DateTime date, int account, Money sumSend, Money sumReceived
});


$MoneyCopyWith<$Res> get sumSend;$MoneyCopyWith<$Res> get sumReceived;

}
/// @nodoc
class _$ExchangeOperationCopyWithImpl<$Res>
    implements $ExchangeOperationCopyWith<$Res> {
  _$ExchangeOperationCopyWithImpl(this._self, this._then);

  final ExchangeOperation _self;
  final $Res Function(ExchangeOperation) _then;

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = null,Object? synced = null,Object? deleted = null,Object? date = null,Object? account = null,Object? sumSend = null,Object? sumReceived = null,}) {
  return _then(ExchangeOperation(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,cloudId: null == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as int,sumSend: null == sumSend ? _self.sumSend : sumSend // ignore: cast_nullable_to_non_nullable
as Money,sumReceived: null == sumReceived ? _self.sumReceived : sumReceived // ignore: cast_nullable_to_non_nullable
as Money,
  ));
}

/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sumSend {
  
  return $MoneyCopyWith<$Res>(_self.sumSend, (value) {
    return _then(_self.copyWith(sumSend: value));
  });
}/// Create a copy of Operation
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MoneyCopyWith<$Res> get sumReceived {
  
  return $MoneyCopyWith<$Res>(_self.sumReceived, (value) {
    return _then(_self.copyWith(sumReceived: value));
  });
}
}

// dart format on
