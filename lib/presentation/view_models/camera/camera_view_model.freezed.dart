// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'camera_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CameraState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CameraState()';
}


}

/// @nodoc
class $CameraStateCopyWith<$Res>  {
$CameraStateCopyWith(CameraState _, $Res Function(CameraState) __);
}


/// Adds pattern-matching-related methods to [CameraState].
extension CameraStatePatterns on CameraState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CameraStateInitializing value)?  initializing,TResult Function( CameraStateReady value)?  ready,TResult Function( CameraStateCaptured value)?  captured,TResult Function( CameraStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CameraStateInitializing() when initializing != null:
return initializing(_that);case CameraStateReady() when ready != null:
return ready(_that);case CameraStateCaptured() when captured != null:
return captured(_that);case CameraStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CameraStateInitializing value)  initializing,required TResult Function( CameraStateReady value)  ready,required TResult Function( CameraStateCaptured value)  captured,required TResult Function( CameraStateError value)  error,}){
final _that = this;
switch (_that) {
case CameraStateInitializing():
return initializing(_that);case CameraStateReady():
return ready(_that);case CameraStateCaptured():
return captured(_that);case CameraStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CameraStateInitializing value)?  initializing,TResult? Function( CameraStateReady value)?  ready,TResult? Function( CameraStateCaptured value)?  captured,TResult? Function( CameraStateError value)?  error,}){
final _that = this;
switch (_that) {
case CameraStateInitializing() when initializing != null:
return initializing(_that);case CameraStateReady() when ready != null:
return ready(_that);case CameraStateCaptured() when captured != null:
return captured(_that);case CameraStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializing,TResult Function( CameraController controller,  bool isFlashOn)?  ready,TResult Function( String imagePath)?  captured,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CameraStateInitializing() when initializing != null:
return initializing();case CameraStateReady() when ready != null:
return ready(_that.controller,_that.isFlashOn);case CameraStateCaptured() when captured != null:
return captured(_that.imagePath);case CameraStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializing,required TResult Function( CameraController controller,  bool isFlashOn)  ready,required TResult Function( String imagePath)  captured,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case CameraStateInitializing():
return initializing();case CameraStateReady():
return ready(_that.controller,_that.isFlashOn);case CameraStateCaptured():
return captured(_that.imagePath);case CameraStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializing,TResult? Function( CameraController controller,  bool isFlashOn)?  ready,TResult? Function( String imagePath)?  captured,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case CameraStateInitializing() when initializing != null:
return initializing();case CameraStateReady() when ready != null:
return ready(_that.controller,_that.isFlashOn);case CameraStateCaptured() when captured != null:
return captured(_that.imagePath);case CameraStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class CameraStateInitializing implements CameraState {
  const CameraStateInitializing();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraStateInitializing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'CameraState.initializing()';
}


}




/// @nodoc


class CameraStateReady implements CameraState {
  const CameraStateReady({required this.controller, this.isFlashOn = false});
  

 final  CameraController controller;
@JsonKey() final  bool isFlashOn;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateReadyCopyWith<CameraStateReady> get copyWith => _$CameraStateReadyCopyWithImpl<CameraStateReady>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraStateReady&&(identical(other.controller, controller) || other.controller == controller)&&(identical(other.isFlashOn, isFlashOn) || other.isFlashOn == isFlashOn));
}


@override
int get hashCode {
    return Object.hash(runtimeType,controller,isFlashOn);
}

@override
String toString() {
    return 'CameraState.ready(controller: $controller, isFlashOn: $isFlashOn)';
}


}

/// @nodoc
abstract mixin class $CameraStateReadyCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraStateReadyCopyWith(CameraStateReady value, $Res Function(CameraStateReady) _then) = _$CameraStateReadyCopyWithImpl;
@useResult
$Res call({
 CameraController controller, bool isFlashOn
});




}
/// @nodoc
class _$CameraStateReadyCopyWithImpl<$Res>
    implements $CameraStateReadyCopyWith<$Res> {
  _$CameraStateReadyCopyWithImpl(this._self, this._then);

  final CameraStateReady _self;
  final $Res Function(CameraStateReady) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? controller = null,Object? isFlashOn = null,}) {
  return _then(CameraStateReady(
controller: null == controller ? _self.controller : controller // ignore: cast_nullable_to_non_nullable
as CameraController,isFlashOn: null == isFlashOn ? _self.isFlashOn : isFlashOn // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CameraStateCaptured implements CameraState {
  const CameraStateCaptured({required this.imagePath});
  

 final  String imagePath;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateCapturedCopyWith<CameraStateCaptured> get copyWith => _$CameraStateCapturedCopyWithImpl<CameraStateCaptured>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraStateCaptured&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath));
}


@override
int get hashCode {
    return Object.hash(runtimeType,imagePath);
}

@override
String toString() {
    return 'CameraState.captured(imagePath: $imagePath)';
}


}

/// @nodoc
abstract mixin class $CameraStateCapturedCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraStateCapturedCopyWith(CameraStateCaptured value, $Res Function(CameraStateCaptured) _then) = _$CameraStateCapturedCopyWithImpl;
@useResult
$Res call({
 String imagePath
});




}
/// @nodoc
class _$CameraStateCapturedCopyWithImpl<$Res>
    implements $CameraStateCapturedCopyWith<$Res> {
  _$CameraStateCapturedCopyWithImpl(this._self, this._then);

  final CameraStateCaptured _self;
  final $Res Function(CameraStateCaptured) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,}) {
  return _then(CameraStateCaptured(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class CameraStateError implements CameraState {
  const CameraStateError({required this.message});
  

 final  String message;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CameraStateErrorCopyWith<CameraStateError> get copyWith => _$CameraStateErrorCopyWithImpl<CameraStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is CameraStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'CameraState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $CameraStateErrorCopyWith<$Res> implements $CameraStateCopyWith<$Res> {
  factory $CameraStateErrorCopyWith(CameraStateError value, $Res Function(CameraStateError) _then) = _$CameraStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$CameraStateErrorCopyWithImpl<$Res>
    implements $CameraStateErrorCopyWith<$Res> {
  _$CameraStateErrorCopyWithImpl(this._self, this._then);

  final CameraStateError _self;
  final $Res Function(CameraStateError) _then;

/// Create a copy of CameraState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(CameraStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
