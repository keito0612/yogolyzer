// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_location_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectLocationState {

/// 撮影した画像のパス
 String get imagePath;/// 選択された場所のインデックス（-1で未選択）
 int get selectedIndex;/// 「その他」の場合の入力テキスト
 String get customLocationText;/// 次の画面に進む準備ができているか
 bool get isReadyToNext;
/// Create a copy of SelectLocationState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectLocationStateCopyWith<SelectLocationState> get copyWith => _$SelectLocationStateCopyWithImpl<SelectLocationState>(this as SelectLocationState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SelectLocationState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectLocationState&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.selectedIndex, _this.selectedIndex) || other.selectedIndex == _this.selectedIndex)&&(identical(other.customLocationText, _this.customLocationText) || other.customLocationText == _this.customLocationText)&&(identical(other.isReadyToNext, _this.isReadyToNext) || other.isReadyToNext == _this.isReadyToNext));
}


@override
int get hashCode {
  final _this = this as SelectLocationState;
  return Object.hash(runtimeType,_this.imagePath,_this.selectedIndex,_this.customLocationText,_this.isReadyToNext);
}

@override
String toString() {
  final _this = this as SelectLocationState;
  return 'SelectLocationState(imagePath: ${_this.imagePath}, selectedIndex: ${_this.selectedIndex}, customLocationText: ${_this.customLocationText}, isReadyToNext: ${_this.isReadyToNext})';
}


}

/// @nodoc
abstract mixin class $SelectLocationStateCopyWith<$Res>  {
  factory $SelectLocationStateCopyWith(SelectLocationState value, $Res Function(SelectLocationState) _then) = _$SelectLocationStateCopyWithImpl;
@useResult
$Res call({
 String imagePath, int selectedIndex, String customLocationText, bool isReadyToNext
});




}
/// @nodoc
class _$SelectLocationStateCopyWithImpl<$Res>
    implements $SelectLocationStateCopyWith<$Res> {
  _$SelectLocationStateCopyWithImpl(this._self, this._then);

  final SelectLocationState _self;
  final $Res Function(SelectLocationState) _then;

/// Create a copy of SelectLocationState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = null,Object? selectedIndex = null,Object? customLocationText = null,Object? isReadyToNext = null,}) {
  return _then(SelectLocationState(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,customLocationText: null == customLocationText ? _self.customLocationText : customLocationText // ignore: cast_nullable_to_non_nullable
as String,isReadyToNext: null == isReadyToNext ? _self.isReadyToNext : isReadyToNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectLocationState].
extension SelectLocationStatePatterns on SelectLocationState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectLocationState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectLocationState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectLocationState value)  $default,){
final _that = this;
switch (_that) {
case _SelectLocationState():
return $default(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectLocationState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectLocationState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePath,  int selectedIndex,  String customLocationText,  bool isReadyToNext)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectLocationState() when $default != null:
return $default(_that.imagePath,_that.selectedIndex,_that.customLocationText,_that.isReadyToNext);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePath,  int selectedIndex,  String customLocationText,  bool isReadyToNext)  $default,) {final _that = this;
switch (_that) {
case _SelectLocationState():
return $default(_that.imagePath,_that.selectedIndex,_that.customLocationText,_that.isReadyToNext);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePath,  int selectedIndex,  String customLocationText,  bool isReadyToNext)?  $default,) {final _that = this;
switch (_that) {
case _SelectLocationState() when $default != null:
return $default(_that.imagePath,_that.selectedIndex,_that.customLocationText,_that.isReadyToNext);case _:
  return null;

}
}

}

/// @nodoc


class _SelectLocationState implements SelectLocationState {
  const _SelectLocationState({required this.imagePath, this.selectedIndex = -1, this.customLocationText = '', this.isReadyToNext = false});
  

/// 撮影した画像のパス
@override final  String imagePath;
/// 選択された場所のインデックス（-1で未選択）
@override@JsonKey() final  int selectedIndex;
/// 「その他」の場合の入力テキスト
@override@JsonKey() final  String customLocationText;
/// 次の画面に進む準備ができているか
@override@JsonKey() final  bool isReadyToNext;

/// Create a copy of SelectLocationState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectLocationStateCopyWith<_SelectLocationState> get copyWith => __$SelectLocationStateCopyWithImpl<_SelectLocationState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectLocationState&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.customLocationText, customLocationText) || other.customLocationText == customLocationText)&&(identical(other.isReadyToNext, isReadyToNext) || other.isReadyToNext == isReadyToNext));
}


@override
int get hashCode {
    return Object.hash(runtimeType,imagePath,selectedIndex,customLocationText,isReadyToNext);
}

@override
String toString() {
    return 'SelectLocationState(imagePath: $imagePath, selectedIndex: $selectedIndex, customLocationText: $customLocationText, isReadyToNext: $isReadyToNext)';
}


}

/// @nodoc
abstract mixin class _$SelectLocationStateCopyWith<$Res> implements $SelectLocationStateCopyWith<$Res> {
  factory _$SelectLocationStateCopyWith(_SelectLocationState value, $Res Function(_SelectLocationState) _then) = __$SelectLocationStateCopyWithImpl;
@override @useResult
$Res call({
 String imagePath, int selectedIndex, String customLocationText, bool isReadyToNext
});




}
/// @nodoc
class __$SelectLocationStateCopyWithImpl<$Res>
    implements _$SelectLocationStateCopyWith<$Res> {
  __$SelectLocationStateCopyWithImpl(this._self, this._then);

  final _SelectLocationState _self;
  final $Res Function(_SelectLocationState) _then;

/// Create a copy of SelectLocationState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? selectedIndex = null,Object? customLocationText = null,Object? isReadyToNext = null,}) {
  return _then(_SelectLocationState(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,customLocationText: null == customLocationText ? _self.customLocationText : customLocationText // ignore: cast_nullable_to_non_nullable
as String,isReadyToNext: null == isReadyToNext ? _self.isReadyToNext : isReadyToNext // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
