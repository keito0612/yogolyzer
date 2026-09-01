// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginState()';
}


}

/// @nodoc
class $LoginStateCopyWith<$Res>  {
$LoginStateCopyWith(LoginState _, $Res Function(LoginState) __);
}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LoginStateIdle value)?  idle,TResult Function( LoginStateLoading value)?  loading,TResult Function( LoginStateSuccess value)?  success,TResult Function( LoginStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LoginStateIdle() when idle != null:
return idle(_that);case LoginStateLoading() when loading != null:
return loading(_that);case LoginStateSuccess() when success != null:
return success(_that);case LoginStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LoginStateIdle value)  idle,required TResult Function( LoginStateLoading value)  loading,required TResult Function( LoginStateSuccess value)  success,required TResult Function( LoginStateError value)  error,}){
final _that = this;
switch (_that) {
case LoginStateIdle():
return idle(_that);case LoginStateLoading():
return loading(_that);case LoginStateSuccess():
return success(_that);case LoginStateError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LoginStateIdle value)?  idle,TResult? Function( LoginStateLoading value)?  loading,TResult? Function( LoginStateSuccess value)?  success,TResult? Function( LoginStateError value)?  error,}){
final _that = this;
switch (_that) {
case LoginStateIdle() when idle != null:
return idle(_that);case LoginStateLoading() when loading != null:
return loading(_that);case LoginStateSuccess() when success != null:
return success(_that);case LoginStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function( AuthProvider provider)?  loading,TResult Function( String userId,  String email,  AuthProvider provider)?  success,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LoginStateIdle() when idle != null:
return idle();case LoginStateLoading() when loading != null:
return loading(_that.provider);case LoginStateSuccess() when success != null:
return success(_that.userId,_that.email,_that.provider);case LoginStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function( AuthProvider provider)  loading,required TResult Function( String userId,  String email,  AuthProvider provider)  success,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case LoginStateIdle():
return idle();case LoginStateLoading():
return loading(_that.provider);case LoginStateSuccess():
return success(_that.userId,_that.email,_that.provider);case LoginStateError():
return error(_that.message);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function( AuthProvider provider)?  loading,TResult? Function( String userId,  String email,  AuthProvider provider)?  success,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case LoginStateIdle() when idle != null:
return idle();case LoginStateLoading() when loading != null:
return loading(_that.provider);case LoginStateSuccess() when success != null:
return success(_that.userId,_that.email,_that.provider);case LoginStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class LoginStateIdle implements LoginState {
  const LoginStateIdle();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'LoginState.idle()';
}


}




/// @nodoc


class LoginStateLoading implements LoginState {
  const LoginStateLoading({required this.provider});
  

 final  AuthProvider provider;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateLoadingCopyWith<LoginStateLoading> get copyWith => _$LoginStateLoadingCopyWithImpl<LoginStateLoading>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateLoading&&(identical(other.provider, provider) || other.provider == provider));
}


@override
int get hashCode {
    return Object.hash(runtimeType,provider);
}

@override
String toString() {
    return 'LoginState.loading(provider: $provider)';
}


}

/// @nodoc
abstract mixin class $LoginStateLoadingCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginStateLoadingCopyWith(LoginStateLoading value, $Res Function(LoginStateLoading) _then) = _$LoginStateLoadingCopyWithImpl;
@useResult
$Res call({
 AuthProvider provider
});




}
/// @nodoc
class _$LoginStateLoadingCopyWithImpl<$Res>
    implements $LoginStateLoadingCopyWith<$Res> {
  _$LoginStateLoadingCopyWithImpl(this._self, this._then);

  final LoginStateLoading _self;
  final $Res Function(LoginStateLoading) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? provider = null,}) {
  return _then(LoginStateLoading(
provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProvider,
  ));
}


}

/// @nodoc


class LoginStateSuccess implements LoginState {
  const LoginStateSuccess({required this.userId, required this.email, required this.provider});
  

 final  String userId;
 final  String email;
 final  AuthProvider provider;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateSuccessCopyWith<LoginStateSuccess> get copyWith => _$LoginStateSuccessCopyWithImpl<LoginStateSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateSuccess&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.provider, provider) || other.provider == provider));
}


@override
int get hashCode {
    return Object.hash(runtimeType,userId,email,provider);
}

@override
String toString() {
    return 'LoginState.success(userId: $userId, email: $email, provider: $provider)';
}


}

/// @nodoc
abstract mixin class $LoginStateSuccessCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginStateSuccessCopyWith(LoginStateSuccess value, $Res Function(LoginStateSuccess) _then) = _$LoginStateSuccessCopyWithImpl;
@useResult
$Res call({
 String userId, String email, AuthProvider provider
});




}
/// @nodoc
class _$LoginStateSuccessCopyWithImpl<$Res>
    implements $LoginStateSuccessCopyWith<$Res> {
  _$LoginStateSuccessCopyWithImpl(this._self, this._then);

  final LoginStateSuccess _self;
  final $Res Function(LoginStateSuccess) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = null,Object? provider = null,}) {
  return _then(LoginStateSuccess(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,provider: null == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as AuthProvider,
  ));
}


}

/// @nodoc


class LoginStateError implements LoginState {
  const LoginStateError({required this.message});
  

 final  String message;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateErrorCopyWith<LoginStateError> get copyWith => _$LoginStateErrorCopyWithImpl<LoginStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'LoginState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $LoginStateErrorCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory $LoginStateErrorCopyWith(LoginStateError value, $Res Function(LoginStateError) _then) = _$LoginStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$LoginStateErrorCopyWithImpl<$Res>
    implements $LoginStateErrorCopyWith<$Res> {
  _$LoginStateErrorCopyWithImpl(this._self, this._then);

  final LoginStateError _self;
  final $Res Function(LoginStateError) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(LoginStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
