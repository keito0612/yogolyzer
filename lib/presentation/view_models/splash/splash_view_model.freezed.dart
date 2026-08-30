// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashStateLoading value)?  loading,TResult Function( SplashStateNavigateToOnboarding value)?  navigateToOnboarding,TResult Function( SplashStateNavigateToHome value)?  navigateToHome,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashStateLoading() when loading != null:
return loading(_that);case SplashStateNavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case SplashStateNavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashStateLoading value)  loading,required TResult Function( SplashStateNavigateToOnboarding value)  navigateToOnboarding,required TResult Function( SplashStateNavigateToHome value)  navigateToHome,}){
final _that = this;
switch (_that) {
case SplashStateLoading():
return loading(_that);case SplashStateNavigateToOnboarding():
return navigateToOnboarding(_that);case SplashStateNavigateToHome():
return navigateToHome(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashStateLoading value)?  loading,TResult? Function( SplashStateNavigateToOnboarding value)?  navigateToOnboarding,TResult? Function( SplashStateNavigateToHome value)?  navigateToHome,}){
final _that = this;
switch (_that) {
case SplashStateLoading() when loading != null:
return loading(_that);case SplashStateNavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding(_that);case SplashStateNavigateToHome() when navigateToHome != null:
return navigateToHome(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function()?  navigateToOnboarding,TResult Function()?  navigateToHome,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashStateLoading() when loading != null:
return loading();case SplashStateNavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case SplashStateNavigateToHome() when navigateToHome != null:
return navigateToHome();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function()  navigateToOnboarding,required TResult Function()  navigateToHome,}) {final _that = this;
switch (_that) {
case SplashStateLoading():
return loading();case SplashStateNavigateToOnboarding():
return navigateToOnboarding();case SplashStateNavigateToHome():
return navigateToHome();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function()?  navigateToOnboarding,TResult? Function()?  navigateToHome,}) {final _that = this;
switch (_that) {
case SplashStateLoading() when loading != null:
return loading();case SplashStateNavigateToOnboarding() when navigateToOnboarding != null:
return navigateToOnboarding();case SplashStateNavigateToHome() when navigateToHome != null:
return navigateToHome();case _:
  return null;

}
}

}

/// @nodoc


class SplashStateLoading implements SplashState {
  const SplashStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState.loading()';
}


}




/// @nodoc


class SplashStateNavigateToOnboarding implements SplashState {
  const SplashStateNavigateToOnboarding();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashStateNavigateToOnboarding);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState.navigateToOnboarding()';
}


}




/// @nodoc


class SplashStateNavigateToHome implements SplashState {
  const SplashStateNavigateToHome();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashStateNavigateToHome);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'SplashState.navigateToHome()';
}


}




// dart format on
