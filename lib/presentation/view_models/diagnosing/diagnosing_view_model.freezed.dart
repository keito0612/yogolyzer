// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosing_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DiagnosingState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DiagnosingState()';
}


}

/// @nodoc
class $DiagnosingStateCopyWith<$Res>  {
$DiagnosingStateCopyWith(DiagnosingState _, $Res Function(DiagnosingState) __);
}


/// Adds pattern-matching-related methods to [DiagnosingState].
extension DiagnosingStatePatterns on DiagnosingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiagnosingStateDiagnosing value)?  diagnosing,TResult Function( DiagnosingStateCompleted value)?  completed,TResult Function( DiagnosingStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiagnosingStateDiagnosing() when diagnosing != null:
return diagnosing(_that);case DiagnosingStateCompleted() when completed != null:
return completed(_that);case DiagnosingStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiagnosingStateDiagnosing value)  diagnosing,required TResult Function( DiagnosingStateCompleted value)  completed,required TResult Function( DiagnosingStateError value)  error,}){
final _that = this;
switch (_that) {
case DiagnosingStateDiagnosing():
return diagnosing(_that);case DiagnosingStateCompleted():
return completed(_that);case DiagnosingStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiagnosingStateDiagnosing value)?  diagnosing,TResult? Function( DiagnosingStateCompleted value)?  completed,TResult? Function( DiagnosingStateError value)?  error,}){
final _that = this;
switch (_that) {
case DiagnosingStateDiagnosing() when diagnosing != null:
return diagnosing(_that);case DiagnosingStateCompleted() when completed != null:
return completed(_that);case DiagnosingStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String imagePath,  String location,  String material)?  diagnosing,TResult Function( String diagnosisId)?  completed,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiagnosingStateDiagnosing() when diagnosing != null:
return diagnosing(_that.imagePath,_that.location,_that.material);case DiagnosingStateCompleted() when completed != null:
return completed(_that.diagnosisId);case DiagnosingStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String imagePath,  String location,  String material)  diagnosing,required TResult Function( String diagnosisId)  completed,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DiagnosingStateDiagnosing():
return diagnosing(_that.imagePath,_that.location,_that.material);case DiagnosingStateCompleted():
return completed(_that.diagnosisId);case DiagnosingStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String imagePath,  String location,  String material)?  diagnosing,TResult? Function( String diagnosisId)?  completed,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DiagnosingStateDiagnosing() when diagnosing != null:
return diagnosing(_that.imagePath,_that.location,_that.material);case DiagnosingStateCompleted() when completed != null:
return completed(_that.diagnosisId);case DiagnosingStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DiagnosingStateDiagnosing implements DiagnosingState {
  const DiagnosingStateDiagnosing({required this.imagePath, required this.location, required this.material});
  

 final  String imagePath;
 final  String location;
 final  String material;

/// Create a copy of DiagnosingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosingStateDiagnosingCopyWith<DiagnosingStateDiagnosing> get copyWith => _$DiagnosingStateDiagnosingCopyWithImpl<DiagnosingStateDiagnosing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosingStateDiagnosing&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.location, location) || other.location == location)&&(identical(other.material, material) || other.material == material));
}


@override
int get hashCode {
    return Object.hash(runtimeType,imagePath,location,material);
}

@override
String toString() {
    return 'DiagnosingState.diagnosing(imagePath: $imagePath, location: $location, material: $material)';
}


}

/// @nodoc
abstract mixin class $DiagnosingStateDiagnosingCopyWith<$Res> implements $DiagnosingStateCopyWith<$Res> {
  factory $DiagnosingStateDiagnosingCopyWith(DiagnosingStateDiagnosing value, $Res Function(DiagnosingStateDiagnosing) _then) = _$DiagnosingStateDiagnosingCopyWithImpl;
@useResult
$Res call({
 String imagePath, String location, String material
});




}
/// @nodoc
class _$DiagnosingStateDiagnosingCopyWithImpl<$Res>
    implements $DiagnosingStateDiagnosingCopyWith<$Res> {
  _$DiagnosingStateDiagnosingCopyWithImpl(this._self, this._then);

  final DiagnosingStateDiagnosing _self;
  final $Res Function(DiagnosingStateDiagnosing) _then;

/// Create a copy of DiagnosingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? location = null,Object? material = null,}) {
  return _then(DiagnosingStateDiagnosing(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DiagnosingStateCompleted implements DiagnosingState {
  const DiagnosingStateCompleted({required this.diagnosisId});
  

 final  String diagnosisId;

/// Create a copy of DiagnosingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosingStateCompletedCopyWith<DiagnosingStateCompleted> get copyWith => _$DiagnosingStateCompletedCopyWithImpl<DiagnosingStateCompleted>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosingStateCompleted&&(identical(other.diagnosisId, diagnosisId) || other.diagnosisId == diagnosisId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,diagnosisId);
}

@override
String toString() {
    return 'DiagnosingState.completed(diagnosisId: $diagnosisId)';
}


}

/// @nodoc
abstract mixin class $DiagnosingStateCompletedCopyWith<$Res> implements $DiagnosingStateCopyWith<$Res> {
  factory $DiagnosingStateCompletedCopyWith(DiagnosingStateCompleted value, $Res Function(DiagnosingStateCompleted) _then) = _$DiagnosingStateCompletedCopyWithImpl;
@useResult
$Res call({
 String diagnosisId
});




}
/// @nodoc
class _$DiagnosingStateCompletedCopyWithImpl<$Res>
    implements $DiagnosingStateCompletedCopyWith<$Res> {
  _$DiagnosingStateCompletedCopyWithImpl(this._self, this._then);

  final DiagnosingStateCompleted _self;
  final $Res Function(DiagnosingStateCompleted) _then;

/// Create a copy of DiagnosingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? diagnosisId = null,}) {
  return _then(DiagnosingStateCompleted(
diagnosisId: null == diagnosisId ? _self.diagnosisId : diagnosisId // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class DiagnosingStateError implements DiagnosingState {
  const DiagnosingStateError({required this.message});
  

 final  String message;

/// Create a copy of DiagnosingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosingStateErrorCopyWith<DiagnosingStateError> get copyWith => _$DiagnosingStateErrorCopyWithImpl<DiagnosingStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosingStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'DiagnosingState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DiagnosingStateErrorCopyWith<$Res> implements $DiagnosingStateCopyWith<$Res> {
  factory $DiagnosingStateErrorCopyWith(DiagnosingStateError value, $Res Function(DiagnosingStateError) _then) = _$DiagnosingStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DiagnosingStateErrorCopyWithImpl<$Res>
    implements $DiagnosingStateErrorCopyWith<$Res> {
  _$DiagnosingStateErrorCopyWithImpl(this._self, this._then);

  final DiagnosingStateError _self;
  final $Res Function(DiagnosingStateError) _then;

/// Create a copy of DiagnosingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DiagnosingStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
