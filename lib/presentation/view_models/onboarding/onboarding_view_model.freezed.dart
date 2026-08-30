// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'onboarding_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OnboardingState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingState()';
}


}

/// @nodoc
class $OnboardingStateCopyWith<$Res>  {
$OnboardingStateCopyWith(OnboardingState _, $Res Function(OnboardingState) __);
}


/// Adds pattern-matching-related methods to [OnboardingState].
extension OnboardingStatePatterns on OnboardingState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnboardingStateViewing value)?  viewing,TResult Function( OnboardingStateCompleted value)?  completed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnboardingStateViewing() when viewing != null:
return viewing(_that);case OnboardingStateCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnboardingStateViewing value)  viewing,required TResult Function( OnboardingStateCompleted value)  completed,}){
final _that = this;
switch (_that) {
case OnboardingStateViewing():
return viewing(_that);case OnboardingStateCompleted():
return completed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnboardingStateViewing value)?  viewing,TResult? Function( OnboardingStateCompleted value)?  completed,}){
final _that = this;
switch (_that) {
case OnboardingStateViewing() when viewing != null:
return viewing(_that);case OnboardingStateCompleted() when completed != null:
return completed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int currentPage)?  viewing,TResult Function()?  completed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnboardingStateViewing() when viewing != null:
return viewing(_that.currentPage);case OnboardingStateCompleted() when completed != null:
return completed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int currentPage)  viewing,required TResult Function()  completed,}) {final _that = this;
switch (_that) {
case OnboardingStateViewing():
return viewing(_that.currentPage);case OnboardingStateCompleted():
return completed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int currentPage)?  viewing,TResult? Function()?  completed,}) {final _that = this;
switch (_that) {
case OnboardingStateViewing() when viewing != null:
return viewing(_that.currentPage);case OnboardingStateCompleted() when completed != null:
return completed();case _:
  return null;

}
}

}

/// @nodoc


class OnboardingStateViewing implements OnboardingState {
  const OnboardingStateViewing({required this.currentPage});
  

 final  int currentPage;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnboardingStateViewingCopyWith<OnboardingStateViewing> get copyWith => _$OnboardingStateViewingCopyWithImpl<OnboardingStateViewing>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingStateViewing&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage));
}


@override
int get hashCode {
    return Object.hash(runtimeType,currentPage);
}

@override
String toString() {
    return 'OnboardingState.viewing(currentPage: $currentPage)';
}


}

/// @nodoc
abstract mixin class $OnboardingStateViewingCopyWith<$Res> implements $OnboardingStateCopyWith<$Res> {
  factory $OnboardingStateViewingCopyWith(OnboardingStateViewing value, $Res Function(OnboardingStateViewing) _then) = _$OnboardingStateViewingCopyWithImpl;
@useResult
$Res call({
 int currentPage
});




}
/// @nodoc
class _$OnboardingStateViewingCopyWithImpl<$Res>
    implements $OnboardingStateViewingCopyWith<$Res> {
  _$OnboardingStateViewingCopyWithImpl(this._self, this._then);

  final OnboardingStateViewing _self;
  final $Res Function(OnboardingStateViewing) _then;

/// Create a copy of OnboardingState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? currentPage = null,}) {
  return _then(OnboardingStateViewing(
currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnboardingStateCompleted implements OnboardingState {
  const OnboardingStateCompleted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is OnboardingStateCompleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'OnboardingState.completed()';
}


}




// dart format on
