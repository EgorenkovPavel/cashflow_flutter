// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
BaseAccountResponse _$BaseAccountResponseFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'account':
          return AccountResponse.fromJson(
            json
          );
                case 'debt':
          return DebtResponse.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'BaseAccountResponse',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$BaseAccountResponse {

@UuidValueConverter() UuidValue get id; String get title;@UuidValueConverter() UuidValue get userId;
/// Create a copy of BaseAccountResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BaseAccountResponseCopyWith<BaseAccountResponse> get copyWith => _$BaseAccountResponseCopyWithImpl<BaseAccountResponse>(this as BaseAccountResponse, _$identity);

  /// Serializes this BaseAccountResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BaseAccountResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,userId);

@override
String toString() {
  return 'BaseAccountResponse(id: $id, title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $BaseAccountResponseCopyWith<$Res>  {
  factory $BaseAccountResponseCopyWith(BaseAccountResponse value, $Res Function(BaseAccountResponse) _then) = _$BaseAccountResponseCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, String title,@UuidValueConverter() UuidValue userId
});




}
/// @nodoc
class _$BaseAccountResponseCopyWithImpl<$Res>
    implements $BaseAccountResponseCopyWith<$Res> {
  _$BaseAccountResponseCopyWithImpl(this._self, this._then);

  final BaseAccountResponse _self;
  final $Res Function(BaseAccountResponse) _then;

/// Create a copy of BaseAccountResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? title = null,Object? userId = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}

}


/// Adds pattern-matching-related methods to [BaseAccountResponse].
extension BaseAccountResponsePatterns on BaseAccountResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AccountResponse value)?  account,TResult Function( DebtResponse value)?  debt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AccountResponse() when account != null:
return account(_that);case DebtResponse() when debt != null:
return debt(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AccountResponse value)  account,required TResult Function( DebtResponse value)  debt,}){
final _that = this;
switch (_that) {
case AccountResponse():
return account(_that);case DebtResponse():
return debt(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AccountResponse value)?  account,TResult? Function( DebtResponse value)?  debt,}){
final _that = this;
switch (_that) {
case AccountResponse() when account != null:
return account(_that);case DebtResponse() when debt != null:
return debt(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function(@UuidValueConverter()  UuidValue id,  String title, @UuidValueConverter()  UuidValue userId)?  account,TResult Function(@UuidValueConverter()  UuidValue id,  String title, @UuidValueConverter()  UuidValue userId)?  debt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AccountResponse() when account != null:
return account(_that.id,_that.title,_that.userId);case DebtResponse() when debt != null:
return debt(_that.id,_that.title,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function(@UuidValueConverter()  UuidValue id,  String title, @UuidValueConverter()  UuidValue userId)  account,required TResult Function(@UuidValueConverter()  UuidValue id,  String title, @UuidValueConverter()  UuidValue userId)  debt,}) {final _that = this;
switch (_that) {
case AccountResponse():
return account(_that.id,_that.title,_that.userId);case DebtResponse():
return debt(_that.id,_that.title,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function(@UuidValueConverter()  UuidValue id,  String title, @UuidValueConverter()  UuidValue userId)?  account,TResult? Function(@UuidValueConverter()  UuidValue id,  String title, @UuidValueConverter()  UuidValue userId)?  debt,}) {final _that = this;
switch (_that) {
case AccountResponse() when account != null:
return account(_that.id,_that.title,_that.userId);case DebtResponse() when debt != null:
return debt(_that.id,_that.title,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class AccountResponse implements BaseAccountResponse {
  const AccountResponse({@UuidValueConverter() required this.id, required this.title, @UuidValueConverter() required this.userId, final  String? $type}): $type = $type ?? 'account';
  factory AccountResponse.fromJson(Map<String, dynamic> json) => _$AccountResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String title;
@override@UuidValueConverter() final  UuidValue userId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BaseAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountResponseCopyWith<AccountResponse> get copyWith => _$AccountResponseCopyWithImpl<AccountResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,userId);

@override
String toString() {
  return 'BaseAccountResponse.account(id: $id, title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $AccountResponseCopyWith<$Res> implements $BaseAccountResponseCopyWith<$Res> {
  factory $AccountResponseCopyWith(AccountResponse value, $Res Function(AccountResponse) _then) = _$AccountResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String title,@UuidValueConverter() UuidValue userId
});




}
/// @nodoc
class _$AccountResponseCopyWithImpl<$Res>
    implements $AccountResponseCopyWith<$Res> {
  _$AccountResponseCopyWithImpl(this._self, this._then);

  final AccountResponse _self;
  final $Res Function(AccountResponse) _then;

/// Create a copy of BaseAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? userId = null,}) {
  return _then(AccountResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc
@JsonSerializable()

class DebtResponse implements BaseAccountResponse {
  const DebtResponse({@UuidValueConverter() required this.id, required this.title, @UuidValueConverter() required this.userId, final  String? $type}): $type = $type ?? 'debt';
  factory DebtResponse.fromJson(Map<String, dynamic> json) => _$DebtResponseFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String title;
@override@UuidValueConverter() final  UuidValue userId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of BaseAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DebtResponseCopyWith<DebtResponse> get copyWith => _$DebtResponseCopyWithImpl<DebtResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DebtResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DebtResponse&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,title,userId);

@override
String toString() {
  return 'BaseAccountResponse.debt(id: $id, title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $DebtResponseCopyWith<$Res> implements $BaseAccountResponseCopyWith<$Res> {
  factory $DebtResponseCopyWith(DebtResponse value, $Res Function(DebtResponse) _then) = _$DebtResponseCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String title,@UuidValueConverter() UuidValue userId
});




}
/// @nodoc
class _$DebtResponseCopyWithImpl<$Res>
    implements $DebtResponseCopyWith<$Res> {
  _$DebtResponseCopyWithImpl(this._self, this._then);

  final DebtResponse _self;
  final $Res Function(DebtResponse) _then;

/// Create a copy of BaseAccountResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? title = null,Object? userId = null,}) {
  return _then(DebtResponse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

CreateBaseAccountRequest _$CreateBaseAccountRequestFromJson(
  Map<String, dynamic> json
) {
        switch (json['runtimeType']) {
                  case 'account':
          return CreateAccountRequest.fromJson(
            json
          );
                case 'debt':
          return CreateDebtRequest.fromJson(
            json
          );
        
          default:
            throw CheckedFromJsonException(
  json,
  'runtimeType',
  'CreateBaseAccountRequest',
  'Invalid union type "${json['runtimeType']}"!'
);
        }
      
}

/// @nodoc
mixin _$CreateBaseAccountRequest {

 String get title;@UuidValueConverter() UuidValue get userId;
/// Create a copy of CreateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateBaseAccountRequestCopyWith<CreateBaseAccountRequest> get copyWith => _$CreateBaseAccountRequestCopyWithImpl<CreateBaseAccountRequest>(this as CreateBaseAccountRequest, _$identity);

  /// Serializes this CreateBaseAccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateBaseAccountRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,userId);

@override
String toString() {
  return 'CreateBaseAccountRequest(title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CreateBaseAccountRequestCopyWith<$Res>  {
  factory $CreateBaseAccountRequestCopyWith(CreateBaseAccountRequest value, $Res Function(CreateBaseAccountRequest) _then) = _$CreateBaseAccountRequestCopyWithImpl;
@useResult
$Res call({
 String title,@UuidValueConverter() UuidValue userId
});




}
/// @nodoc
class _$CreateBaseAccountRequestCopyWithImpl<$Res>
    implements $CreateBaseAccountRequestCopyWith<$Res> {
  _$CreateBaseAccountRequestCopyWithImpl(this._self, this._then);

  final CreateBaseAccountRequest _self;
  final $Res Function(CreateBaseAccountRequest) _then;

/// Create a copy of CreateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = null,Object? userId = null,}) {
  return _then(_self.copyWith(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}

}


/// Adds pattern-matching-related methods to [CreateBaseAccountRequest].
extension CreateBaseAccountRequestPatterns on CreateBaseAccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CreateAccountRequest value)?  account,TResult Function( CreateDebtRequest value)?  debt,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CreateAccountRequest() when account != null:
return account(_that);case CreateDebtRequest() when debt != null:
return debt(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CreateAccountRequest value)  account,required TResult Function( CreateDebtRequest value)  debt,}){
final _that = this;
switch (_that) {
case CreateAccountRequest():
return account(_that);case CreateDebtRequest():
return debt(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CreateAccountRequest value)?  account,TResult? Function( CreateDebtRequest value)?  debt,}){
final _that = this;
switch (_that) {
case CreateAccountRequest() when account != null:
return account(_that);case CreateDebtRequest() when debt != null:
return debt(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String title, @UuidValueConverter()  UuidValue userId)?  account,TResult Function( String title, @UuidValueConverter()  UuidValue userId)?  debt,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CreateAccountRequest() when account != null:
return account(_that.title,_that.userId);case CreateDebtRequest() when debt != null:
return debt(_that.title,_that.userId);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String title, @UuidValueConverter()  UuidValue userId)  account,required TResult Function( String title, @UuidValueConverter()  UuidValue userId)  debt,}) {final _that = this;
switch (_that) {
case CreateAccountRequest():
return account(_that.title,_that.userId);case CreateDebtRequest():
return debt(_that.title,_that.userId);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String title, @UuidValueConverter()  UuidValue userId)?  account,TResult? Function( String title, @UuidValueConverter()  UuidValue userId)?  debt,}) {final _that = this;
switch (_that) {
case CreateAccountRequest() when account != null:
return account(_that.title,_that.userId);case CreateDebtRequest() when debt != null:
return debt(_that.title,_that.userId);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class CreateAccountRequest implements CreateBaseAccountRequest {
  const CreateAccountRequest({required this.title, @UuidValueConverter() required this.userId, final  String? $type}): $type = $type ?? 'account';
  factory CreateAccountRequest.fromJson(Map<String, dynamic> json) => _$CreateAccountRequestFromJson(json);

@override final  String title;
@override@UuidValueConverter() final  UuidValue userId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateAccountRequestCopyWith<CreateAccountRequest> get copyWith => _$CreateAccountRequestCopyWithImpl<CreateAccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateAccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateAccountRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,userId);

@override
String toString() {
  return 'CreateBaseAccountRequest.account(title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CreateAccountRequestCopyWith<$Res> implements $CreateBaseAccountRequestCopyWith<$Res> {
  factory $CreateAccountRequestCopyWith(CreateAccountRequest value, $Res Function(CreateAccountRequest) _then) = _$CreateAccountRequestCopyWithImpl;
@override @useResult
$Res call({
 String title,@UuidValueConverter() UuidValue userId
});




}
/// @nodoc
class _$CreateAccountRequestCopyWithImpl<$Res>
    implements $CreateAccountRequestCopyWith<$Res> {
  _$CreateAccountRequestCopyWithImpl(this._self, this._then);

  final CreateAccountRequest _self;
  final $Res Function(CreateAccountRequest) _then;

/// Create a copy of CreateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? userId = null,}) {
  return _then(CreateAccountRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}

/// @nodoc
@JsonSerializable()

class CreateDebtRequest implements CreateBaseAccountRequest {
  const CreateDebtRequest({required this.title, @UuidValueConverter() required this.userId, final  String? $type}): $type = $type ?? 'debt';
  factory CreateDebtRequest.fromJson(Map<String, dynamic> json) => _$CreateDebtRequestFromJson(json);

@override final  String title;
@override@UuidValueConverter() final  UuidValue userId;

@JsonKey(name: 'runtimeType')
final String $type;


/// Create a copy of CreateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreateDebtRequestCopyWith<CreateDebtRequest> get copyWith => _$CreateDebtRequestCopyWithImpl<CreateDebtRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreateDebtRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreateDebtRequest&&(identical(other.title, title) || other.title == title)&&(identical(other.userId, userId) || other.userId == userId));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,userId);

@override
String toString() {
  return 'CreateBaseAccountRequest.debt(title: $title, userId: $userId)';
}


}

/// @nodoc
abstract mixin class $CreateDebtRequestCopyWith<$Res> implements $CreateBaseAccountRequestCopyWith<$Res> {
  factory $CreateDebtRequestCopyWith(CreateDebtRequest value, $Res Function(CreateDebtRequest) _then) = _$CreateDebtRequestCopyWithImpl;
@override @useResult
$Res call({
 String title,@UuidValueConverter() UuidValue userId
});




}
/// @nodoc
class _$CreateDebtRequestCopyWithImpl<$Res>
    implements $CreateDebtRequestCopyWith<$Res> {
  _$CreateDebtRequestCopyWithImpl(this._self, this._then);

  final CreateDebtRequest _self;
  final $Res Function(CreateDebtRequest) _then;

/// Create a copy of CreateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = null,Object? userId = null,}) {
  return _then(CreateDebtRequest(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as UuidValue,
  ));
}


}


/// @nodoc
mixin _$UpdateBaseAccountRequest {

@UuidValueConverter() UuidValue get id; String get name;
/// Create a copy of UpdateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdateBaseAccountRequestCopyWith<UpdateBaseAccountRequest> get copyWith => _$UpdateBaseAccountRequestCopyWithImpl<UpdateBaseAccountRequest>(this as UpdateBaseAccountRequest, _$identity);

  /// Serializes this UpdateBaseAccountRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdateBaseAccountRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UpdateBaseAccountRequest(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $UpdateBaseAccountRequestCopyWith<$Res>  {
  factory $UpdateBaseAccountRequestCopyWith(UpdateBaseAccountRequest value, $Res Function(UpdateBaseAccountRequest) _then) = _$UpdateBaseAccountRequestCopyWithImpl;
@useResult
$Res call({
@UuidValueConverter() UuidValue id, String name
});




}
/// @nodoc
class _$UpdateBaseAccountRequestCopyWithImpl<$Res>
    implements $UpdateBaseAccountRequestCopyWith<$Res> {
  _$UpdateBaseAccountRequestCopyWithImpl(this._self, this._then);

  final UpdateBaseAccountRequest _self;
  final $Res Function(UpdateBaseAccountRequest) _then;

/// Create a copy of UpdateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdateBaseAccountRequest].
extension UpdateBaseAccountRequestPatterns on UpdateBaseAccountRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdateBaseAccountRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdateBaseAccountRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdateBaseAccountRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdateBaseAccountRequest():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdateBaseAccountRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdateBaseAccountRequest() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@UuidValueConverter()  UuidValue id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdateBaseAccountRequest() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@UuidValueConverter()  UuidValue id,  String name)  $default,) {final _that = this;
switch (_that) {
case _UpdateBaseAccountRequest():
return $default(_that.id,_that.name);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@UuidValueConverter()  UuidValue id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _UpdateBaseAccountRequest() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdateBaseAccountRequest extends UpdateBaseAccountRequest {
  const _UpdateBaseAccountRequest({@UuidValueConverter() required this.id, required this.name}): super._();
  factory _UpdateBaseAccountRequest.fromJson(Map<String, dynamic> json) => _$UpdateBaseAccountRequestFromJson(json);

@override@UuidValueConverter() final  UuidValue id;
@override final  String name;

/// Create a copy of UpdateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdateBaseAccountRequestCopyWith<_UpdateBaseAccountRequest> get copyWith => __$UpdateBaseAccountRequestCopyWithImpl<_UpdateBaseAccountRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdateBaseAccountRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdateBaseAccountRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'UpdateBaseAccountRequest(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$UpdateBaseAccountRequestCopyWith<$Res> implements $UpdateBaseAccountRequestCopyWith<$Res> {
  factory _$UpdateBaseAccountRequestCopyWith(_UpdateBaseAccountRequest value, $Res Function(_UpdateBaseAccountRequest) _then) = __$UpdateBaseAccountRequestCopyWithImpl;
@override @useResult
$Res call({
@UuidValueConverter() UuidValue id, String name
});




}
/// @nodoc
class __$UpdateBaseAccountRequestCopyWithImpl<$Res>
    implements _$UpdateBaseAccountRequestCopyWith<$Res> {
  __$UpdateBaseAccountRequestCopyWithImpl(this._self, this._then);

  final _UpdateBaseAccountRequest _self;
  final $Res Function(_UpdateBaseAccountRequest) _then;

/// Create a copy of UpdateBaseAccountRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_UpdateBaseAccountRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as UuidValue,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
