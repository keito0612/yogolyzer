// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_detail_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HistoryDetailState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HistoryDetailState()';
}


}

/// @nodoc
class $HistoryDetailStateCopyWith<$Res>  {
$HistoryDetailStateCopyWith(HistoryDetailState _, $Res Function(HistoryDetailState) __);
}


/// Adds pattern-matching-related methods to [HistoryDetailState].
extension HistoryDetailStatePatterns on HistoryDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HistoryDetailStateLoading value)?  loading,TResult Function( HistoryDetailStateLoaded value)?  loaded,TResult Function( HistoryDetailStateDeleting value)?  deleting,TResult Function( HistoryDetailStateDeleted value)?  deleted,TResult Function( HistoryDetailStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HistoryDetailStateLoading() when loading != null:
return loading(_that);case HistoryDetailStateLoaded() when loaded != null:
return loaded(_that);case HistoryDetailStateDeleting() when deleting != null:
return deleting(_that);case HistoryDetailStateDeleted() when deleted != null:
return deleted(_that);case HistoryDetailStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HistoryDetailStateLoading value)  loading,required TResult Function( HistoryDetailStateLoaded value)  loaded,required TResult Function( HistoryDetailStateDeleting value)  deleting,required TResult Function( HistoryDetailStateDeleted value)  deleted,required TResult Function( HistoryDetailStateError value)  error,}){
final _that = this;
switch (_that) {
case HistoryDetailStateLoading():
return loading(_that);case HistoryDetailStateLoaded():
return loaded(_that);case HistoryDetailStateDeleting():
return deleting(_that);case HistoryDetailStateDeleted():
return deleted(_that);case HistoryDetailStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HistoryDetailStateLoading value)?  loading,TResult? Function( HistoryDetailStateLoaded value)?  loaded,TResult? Function( HistoryDetailStateDeleting value)?  deleting,TResult? Function( HistoryDetailStateDeleted value)?  deleted,TResult? Function( HistoryDetailStateError value)?  error,}){
final _that = this;
switch (_that) {
case HistoryDetailStateLoading() when loading != null:
return loading(_that);case HistoryDetailStateLoaded() when loaded != null:
return loaded(_that);case HistoryDetailStateDeleting() when deleting != null:
return deleting(_that);case HistoryDetailStateDeleted() when deleted != null:
return deleted(_that);case HistoryDetailStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( DiagnosisResult result)?  loaded,TResult Function( DiagnosisResult result)?  deleting,TResult Function()?  deleted,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HistoryDetailStateLoading() when loading != null:
return loading();case HistoryDetailStateLoaded() when loaded != null:
return loaded(_that.result);case HistoryDetailStateDeleting() when deleting != null:
return deleting(_that.result);case HistoryDetailStateDeleted() when deleted != null:
return deleted();case HistoryDetailStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( DiagnosisResult result)  loaded,required TResult Function( DiagnosisResult result)  deleting,required TResult Function()  deleted,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case HistoryDetailStateLoading():
return loading();case HistoryDetailStateLoaded():
return loaded(_that.result);case HistoryDetailStateDeleting():
return deleting(_that.result);case HistoryDetailStateDeleted():
return deleted();case HistoryDetailStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( DiagnosisResult result)?  loaded,TResult? Function( DiagnosisResult result)?  deleting,TResult? Function()?  deleted,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case HistoryDetailStateLoading() when loading != null:
return loading();case HistoryDetailStateLoaded() when loaded != null:
return loaded(_that.result);case HistoryDetailStateDeleting() when deleting != null:
return deleting(_that.result);case HistoryDetailStateDeleted() when deleted != null:
return deleted();case HistoryDetailStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class HistoryDetailStateLoading implements HistoryDetailState {
  const HistoryDetailStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDetailStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HistoryDetailState.loading()';
}


}




/// @nodoc


class HistoryDetailStateLoaded implements HistoryDetailState {
  const HistoryDetailStateLoaded({required this.result});
  

 final  DiagnosisResult result;

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDetailStateLoadedCopyWith<HistoryDetailStateLoaded> get copyWith => _$HistoryDetailStateLoadedCopyWithImpl<HistoryDetailStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDetailStateLoaded&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,result);
}

@override
String toString() {
    return 'HistoryDetailState.loaded(result: $result)';
}


}

/// @nodoc
abstract mixin class $HistoryDetailStateLoadedCopyWith<$Res> implements $HistoryDetailStateCopyWith<$Res> {
  factory $HistoryDetailStateLoadedCopyWith(HistoryDetailStateLoaded value, $Res Function(HistoryDetailStateLoaded) _then) = _$HistoryDetailStateLoadedCopyWithImpl;
@useResult
$Res call({
 DiagnosisResult result
});


$DiagnosisResultCopyWith<$Res> get result;

}
/// @nodoc
class _$HistoryDetailStateLoadedCopyWithImpl<$Res>
    implements $HistoryDetailStateLoadedCopyWith<$Res> {
  _$HistoryDetailStateLoadedCopyWithImpl(this._self, this._then);

  final HistoryDetailStateLoaded _self;
  final $Res Function(HistoryDetailStateLoaded) _then;

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(HistoryDetailStateLoaded(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DiagnosisResult,
  ));
}

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiagnosisResultCopyWith<$Res> get result {
  
  return $DiagnosisResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class HistoryDetailStateDeleting implements HistoryDetailState {
  const HistoryDetailStateDeleting({required this.result});
  

 final  DiagnosisResult result;

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDetailStateDeletingCopyWith<HistoryDetailStateDeleting> get copyWith => _$HistoryDetailStateDeletingCopyWithImpl<HistoryDetailStateDeleting>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDetailStateDeleting&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,result);
}

@override
String toString() {
    return 'HistoryDetailState.deleting(result: $result)';
}


}

/// @nodoc
abstract mixin class $HistoryDetailStateDeletingCopyWith<$Res> implements $HistoryDetailStateCopyWith<$Res> {
  factory $HistoryDetailStateDeletingCopyWith(HistoryDetailStateDeleting value, $Res Function(HistoryDetailStateDeleting) _then) = _$HistoryDetailStateDeletingCopyWithImpl;
@useResult
$Res call({
 DiagnosisResult result
});


$DiagnosisResultCopyWith<$Res> get result;

}
/// @nodoc
class _$HistoryDetailStateDeletingCopyWithImpl<$Res>
    implements $HistoryDetailStateDeletingCopyWith<$Res> {
  _$HistoryDetailStateDeletingCopyWithImpl(this._self, this._then);

  final HistoryDetailStateDeleting _self;
  final $Res Function(HistoryDetailStateDeleting) _then;

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(HistoryDetailStateDeleting(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DiagnosisResult,
  ));
}

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiagnosisResultCopyWith<$Res> get result {
  
  return $DiagnosisResultCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

/// @nodoc


class HistoryDetailStateDeleted implements HistoryDetailState {
  const HistoryDetailStateDeleted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDetailStateDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'HistoryDetailState.deleted()';
}


}




/// @nodoc


class HistoryDetailStateError implements HistoryDetailState {
  const HistoryDetailStateError({required this.message});
  

 final  String message;

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HistoryDetailStateErrorCopyWith<HistoryDetailStateError> get copyWith => _$HistoryDetailStateErrorCopyWithImpl<HistoryDetailStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is HistoryDetailStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'HistoryDetailState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $HistoryDetailStateErrorCopyWith<$Res> implements $HistoryDetailStateCopyWith<$Res> {
  factory $HistoryDetailStateErrorCopyWith(HistoryDetailStateError value, $Res Function(HistoryDetailStateError) _then) = _$HistoryDetailStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HistoryDetailStateErrorCopyWithImpl<$Res>
    implements $HistoryDetailStateErrorCopyWith<$Res> {
  _$HistoryDetailStateErrorCopyWithImpl(this._self, this._then);

  final HistoryDetailStateError _self;
  final $Res Function(HistoryDetailStateError) _then;

/// Create a copy of HistoryDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HistoryDetailStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
