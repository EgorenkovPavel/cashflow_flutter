// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operation_view.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OperationView {

 int get id; DateTime get date; bool get deleted; bool get synced; String get userPhotoUrl; String get userName; String get account;
/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OperationViewCopyWith<OperationView> get copyWith => _$OperationViewCopyWithImpl<OperationView>(this as OperationView, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OperationView&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.userPhotoUrl, userPhotoUrl) || other.userPhotoUrl == userPhotoUrl)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.account, account) || other.account == account));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,deleted,synced,userPhotoUrl,userName,account);

@override
String toString() {
  return 'OperationView(id: $id, date: $date, deleted: $deleted, synced: $synced, userPhotoUrl: $userPhotoUrl, userName: $userName, account: $account)';
}


}

/// @nodoc
abstract mixin class $OperationViewCopyWith<$Res>  {
  factory $OperationViewCopyWith(OperationView value, $Res Function(OperationView) _then) = _$OperationViewCopyWithImpl;
@useResult
$Res call({
 int id, DateTime date, bool deleted, bool synced, String userPhotoUrl, String userName, String account
});




}
/// @nodoc
class _$OperationViewCopyWithImpl<$Res>
    implements $OperationViewCopyWith<$Res> {
  _$OperationViewCopyWithImpl(this._self, this._then);

  final OperationView _self;
  final $Res Function(OperationView) _then;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? date = null,Object? deleted = null,Object? synced = null,Object? userPhotoUrl = null,Object? userName = null,Object? account = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,userPhotoUrl: null == userPhotoUrl ? _self.userPhotoUrl : userPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [OperationView].
extension OperationViewPatterns on OperationView {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( InputOperationView value)?  input,TResult Function( OutputOperationView value)?  output,TResult Function( TransferOperationView value)?  transfer,TResult Function( ExchangeOperationView value)?  exchange,required TResult orElse(),}){
final _that = this;
switch (_that) {
case InputOperationView() when input != null:
return input(_that);case OutputOperationView() when output != null:
return output(_that);case TransferOperationView() when transfer != null:
return transfer(_that);case ExchangeOperationView() when exchange != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( InputOperationView value)  input,required TResult Function( OutputOperationView value)  output,required TResult Function( TransferOperationView value)  transfer,required TResult Function( ExchangeOperationView value)  exchange,}){
final _that = this;
switch (_that) {
case InputOperationView():
return input(_that);case OutputOperationView():
return output(_that);case TransferOperationView():
return transfer(_that);case ExchangeOperationView():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( InputOperationView value)?  input,TResult? Function( OutputOperationView value)?  output,TResult? Function( TransferOperationView value)?  transfer,TResult? Function( ExchangeOperationView value)?  exchange,}){
final _that = this;
switch (_that) {
case InputOperationView() when input != null:
return input(_that);case OutputOperationView() when output != null:
return output(_that);case TransferOperationView() when transfer != null:
return transfer(_that);case ExchangeOperationView() when exchange != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String category,  Sum sum)?  input,TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String category,  Sum sum)?  output,TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String recAccount,  Sum sum)?  transfer,TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  Sum sendSum,  Sum receivedSum)?  exchange,required TResult orElse(),}) {final _that = this;
switch (_that) {
case InputOperationView() when input != null:
return input(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.category,_that.sum);case OutputOperationView() when output != null:
return output(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.category,_that.sum);case TransferOperationView() when transfer != null:
return transfer(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.recAccount,_that.sum);case ExchangeOperationView() when exchange != null:
return exchange(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.sendSum,_that.receivedSum);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String category,  Sum sum)  input,required TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String category,  Sum sum)  output,required TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String recAccount,  Sum sum)  transfer,required TResult Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  Sum sendSum,  Sum receivedSum)  exchange,}) {final _that = this;
switch (_that) {
case InputOperationView():
return input(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.category,_that.sum);case OutputOperationView():
return output(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.category,_that.sum);case TransferOperationView():
return transfer(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.recAccount,_that.sum);case ExchangeOperationView():
return exchange(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.sendSum,_that.receivedSum);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String category,  Sum sum)?  input,TResult? Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String category,  Sum sum)?  output,TResult? Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  String recAccount,  Sum sum)?  transfer,TResult? Function( int id,  DateTime date,  bool deleted,  bool synced,  String userPhotoUrl,  String userName,  String account,  Sum sendSum,  Sum receivedSum)?  exchange,}) {final _that = this;
switch (_that) {
case InputOperationView() when input != null:
return input(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.category,_that.sum);case OutputOperationView() when output != null:
return output(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.category,_that.sum);case TransferOperationView() when transfer != null:
return transfer(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.recAccount,_that.sum);case ExchangeOperationView() when exchange != null:
return exchange(_that.id,_that.date,_that.deleted,_that.synced,_that.userPhotoUrl,_that.userName,_that.account,_that.sendSum,_that.receivedSum);case _:
  return null;

}
}

}

/// @nodoc


class InputOperationView extends OperationView {
  const InputOperationView({required this.id, required this.date, required this.deleted, required this.synced, required this.userPhotoUrl, required this.userName, required this.account, required this.category, required this.sum}): super._();
  

@override final  int id;
@override final  DateTime date;
@override final  bool deleted;
@override final  bool synced;
@override final  String userPhotoUrl;
@override final  String userName;
@override final  String account;
 final  String category;
 final  Sum sum;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InputOperationViewCopyWith<InputOperationView> get copyWith => _$InputOperationViewCopyWithImpl<InputOperationView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is InputOperationView&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.userPhotoUrl, userPhotoUrl) || other.userPhotoUrl == userPhotoUrl)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,deleted,synced,userPhotoUrl,userName,account,category,sum);

@override
String toString() {
  return 'OperationView.input(id: $id, date: $date, deleted: $deleted, synced: $synced, userPhotoUrl: $userPhotoUrl, userName: $userName, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $InputOperationViewCopyWith<$Res> implements $OperationViewCopyWith<$Res> {
  factory $InputOperationViewCopyWith(InputOperationView value, $Res Function(InputOperationView) _then) = _$InputOperationViewCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime date, bool deleted, bool synced, String userPhotoUrl, String userName, String account, String category, Sum sum
});


$SumCopyWith<$Res> get sum;

}
/// @nodoc
class _$InputOperationViewCopyWithImpl<$Res>
    implements $InputOperationViewCopyWith<$Res> {
  _$InputOperationViewCopyWithImpl(this._self, this._then);

  final InputOperationView _self;
  final $Res Function(InputOperationView) _then;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? deleted = null,Object? synced = null,Object? userPhotoUrl = null,Object? userName = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(InputOperationView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,userPhotoUrl: null == userPhotoUrl ? _self.userPhotoUrl : userPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc


class OutputOperationView extends OperationView {
  const OutputOperationView({required this.id, required this.date, required this.deleted, required this.synced, required this.userPhotoUrl, required this.userName, required this.account, required this.category, required this.sum}): super._();
  

@override final  int id;
@override final  DateTime date;
@override final  bool deleted;
@override final  bool synced;
@override final  String userPhotoUrl;
@override final  String userName;
@override final  String account;
 final  String category;
 final  Sum sum;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OutputOperationViewCopyWith<OutputOperationView> get copyWith => _$OutputOperationViewCopyWithImpl<OutputOperationView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OutputOperationView&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.userPhotoUrl, userPhotoUrl) || other.userPhotoUrl == userPhotoUrl)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.account, account) || other.account == account)&&(identical(other.category, category) || other.category == category)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,deleted,synced,userPhotoUrl,userName,account,category,sum);

@override
String toString() {
  return 'OperationView.output(id: $id, date: $date, deleted: $deleted, synced: $synced, userPhotoUrl: $userPhotoUrl, userName: $userName, account: $account, category: $category, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $OutputOperationViewCopyWith<$Res> implements $OperationViewCopyWith<$Res> {
  factory $OutputOperationViewCopyWith(OutputOperationView value, $Res Function(OutputOperationView) _then) = _$OutputOperationViewCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime date, bool deleted, bool synced, String userPhotoUrl, String userName, String account, String category, Sum sum
});


$SumCopyWith<$Res> get sum;

}
/// @nodoc
class _$OutputOperationViewCopyWithImpl<$Res>
    implements $OutputOperationViewCopyWith<$Res> {
  _$OutputOperationViewCopyWithImpl(this._self, this._then);

  final OutputOperationView _self;
  final $Res Function(OutputOperationView) _then;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? deleted = null,Object? synced = null,Object? userPhotoUrl = null,Object? userName = null,Object? account = null,Object? category = null,Object? sum = null,}) {
  return _then(OutputOperationView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,userPhotoUrl: null == userPhotoUrl ? _self.userPhotoUrl : userPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc


class TransferOperationView extends OperationView {
  const TransferOperationView({required this.id, required this.date, required this.deleted, required this.synced, required this.userPhotoUrl, required this.userName, required this.account, required this.recAccount, required this.sum}): super._();
  

@override final  int id;
@override final  DateTime date;
@override final  bool deleted;
@override final  bool synced;
@override final  String userPhotoUrl;
@override final  String userName;
@override final  String account;
 final  String recAccount;
 final  Sum sum;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransferOperationViewCopyWith<TransferOperationView> get copyWith => _$TransferOperationViewCopyWithImpl<TransferOperationView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransferOperationView&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.userPhotoUrl, userPhotoUrl) || other.userPhotoUrl == userPhotoUrl)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.account, account) || other.account == account)&&(identical(other.recAccount, recAccount) || other.recAccount == recAccount)&&(identical(other.sum, sum) || other.sum == sum));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,deleted,synced,userPhotoUrl,userName,account,recAccount,sum);

@override
String toString() {
  return 'OperationView.transfer(id: $id, date: $date, deleted: $deleted, synced: $synced, userPhotoUrl: $userPhotoUrl, userName: $userName, account: $account, recAccount: $recAccount, sum: $sum)';
}


}

/// @nodoc
abstract mixin class $TransferOperationViewCopyWith<$Res> implements $OperationViewCopyWith<$Res> {
  factory $TransferOperationViewCopyWith(TransferOperationView value, $Res Function(TransferOperationView) _then) = _$TransferOperationViewCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime date, bool deleted, bool synced, String userPhotoUrl, String userName, String account, String recAccount, Sum sum
});


$SumCopyWith<$Res> get sum;

}
/// @nodoc
class _$TransferOperationViewCopyWithImpl<$Res>
    implements $TransferOperationViewCopyWith<$Res> {
  _$TransferOperationViewCopyWithImpl(this._self, this._then);

  final TransferOperationView _self;
  final $Res Function(TransferOperationView) _then;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? deleted = null,Object? synced = null,Object? userPhotoUrl = null,Object? userName = null,Object? account = null,Object? recAccount = null,Object? sum = null,}) {
  return _then(TransferOperationView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,userPhotoUrl: null == userPhotoUrl ? _self.userPhotoUrl : userPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,recAccount: null == recAccount ? _self.recAccount : recAccount // ignore: cast_nullable_to_non_nullable
as String,sum: null == sum ? _self.sum : sum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sum {
  
  return $SumCopyWith<$Res>(_self.sum, (value) {
    return _then(_self.copyWith(sum: value));
  });
}
}

/// @nodoc


class ExchangeOperationView extends OperationView {
  const ExchangeOperationView({required this.id, required this.date, required this.deleted, required this.synced, required this.userPhotoUrl, required this.userName, required this.account, required this.sendSum, required this.receivedSum}): super._();
  

@override final  int id;
@override final  DateTime date;
@override final  bool deleted;
@override final  bool synced;
@override final  String userPhotoUrl;
@override final  String userName;
@override final  String account;
 final  Sum sendSum;
 final  Sum receivedSum;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExchangeOperationViewCopyWith<ExchangeOperationView> get copyWith => _$ExchangeOperationViewCopyWithImpl<ExchangeOperationView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExchangeOperationView&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.deleted, deleted) || other.deleted == deleted)&&(identical(other.synced, synced) || other.synced == synced)&&(identical(other.userPhotoUrl, userPhotoUrl) || other.userPhotoUrl == userPhotoUrl)&&(identical(other.userName, userName) || other.userName == userName)&&(identical(other.account, account) || other.account == account)&&(identical(other.sendSum, sendSum) || other.sendSum == sendSum)&&(identical(other.receivedSum, receivedSum) || other.receivedSum == receivedSum));
}


@override
int get hashCode => Object.hash(runtimeType,id,date,deleted,synced,userPhotoUrl,userName,account,sendSum,receivedSum);

@override
String toString() {
  return 'OperationView.exchange(id: $id, date: $date, deleted: $deleted, synced: $synced, userPhotoUrl: $userPhotoUrl, userName: $userName, account: $account, sendSum: $sendSum, receivedSum: $receivedSum)';
}


}

/// @nodoc
abstract mixin class $ExchangeOperationViewCopyWith<$Res> implements $OperationViewCopyWith<$Res> {
  factory $ExchangeOperationViewCopyWith(ExchangeOperationView value, $Res Function(ExchangeOperationView) _then) = _$ExchangeOperationViewCopyWithImpl;
@override @useResult
$Res call({
 int id, DateTime date, bool deleted, bool synced, String userPhotoUrl, String userName, String account, Sum sendSum, Sum receivedSum
});


$SumCopyWith<$Res> get sendSum;$SumCopyWith<$Res> get receivedSum;

}
/// @nodoc
class _$ExchangeOperationViewCopyWithImpl<$Res>
    implements $ExchangeOperationViewCopyWith<$Res> {
  _$ExchangeOperationViewCopyWithImpl(this._self, this._then);

  final ExchangeOperationView _self;
  final $Res Function(ExchangeOperationView) _then;

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? date = null,Object? deleted = null,Object? synced = null,Object? userPhotoUrl = null,Object? userName = null,Object? account = null,Object? sendSum = null,Object? receivedSum = null,}) {
  return _then(ExchangeOperationView(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,deleted: null == deleted ? _self.deleted : deleted // ignore: cast_nullable_to_non_nullable
as bool,synced: null == synced ? _self.synced : synced // ignore: cast_nullable_to_non_nullable
as bool,userPhotoUrl: null == userPhotoUrl ? _self.userPhotoUrl : userPhotoUrl // ignore: cast_nullable_to_non_nullable
as String,userName: null == userName ? _self.userName : userName // ignore: cast_nullable_to_non_nullable
as String,account: null == account ? _self.account : account // ignore: cast_nullable_to_non_nullable
as String,sendSum: null == sendSum ? _self.sendSum : sendSum // ignore: cast_nullable_to_non_nullable
as Sum,receivedSum: null == receivedSum ? _self.receivedSum : receivedSum // ignore: cast_nullable_to_non_nullable
as Sum,
  ));
}

/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get sendSum {
  
  return $SumCopyWith<$Res>(_self.sendSum, (value) {
    return _then(_self.copyWith(sendSum: value));
  });
}/// Create a copy of OperationView
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SumCopyWith<$Res> get receivedSum {
  
  return $SumCopyWith<$Res>(_self.receivedSum, (value) {
    return _then(_self.copyWith(receivedSum: value));
  });
}
}

// dart format on
