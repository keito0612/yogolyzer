// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'select_material_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectMaterialState {

/// 撮影した画像のパス
 String get imagePath;/// 選択された場所名
 String get locationName;/// 選択された場所タイプ
 LocationType? get locationType;/// 利用可能な素材リスト
 List<MaterialType> get availableMaterials;/// 選択された素材のインデックス（-1で未選択）
 int get selectedIndex;/// 診断ボタンが有効か
 bool get isReadyToDiagnose;
/// Create a copy of SelectMaterialState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectMaterialStateCopyWith<SelectMaterialState> get copyWith => _$SelectMaterialStateCopyWithImpl<SelectMaterialState>(this as SelectMaterialState, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as SelectMaterialState;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectMaterialState&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.locationName, _this.locationName) || other.locationName == _this.locationName)&&(identical(other.locationType, _this.locationType) || other.locationType == _this.locationType)&&const DeepCollectionEquality().equals(other.availableMaterials, _this.availableMaterials)&&(identical(other.selectedIndex, _this.selectedIndex) || other.selectedIndex == _this.selectedIndex)&&(identical(other.isReadyToDiagnose, _this.isReadyToDiagnose) || other.isReadyToDiagnose == _this.isReadyToDiagnose));
}


@override
int get hashCode {
  final _this = this as SelectMaterialState;
  return Object.hash(runtimeType,_this.imagePath,_this.locationName,_this.locationType,const DeepCollectionEquality().hash(_this.availableMaterials),_this.selectedIndex,_this.isReadyToDiagnose);
}

@override
String toString() {
  final _this = this as SelectMaterialState;
  return 'SelectMaterialState(imagePath: ${_this.imagePath}, locationName: ${_this.locationName}, locationType: ${_this.locationType}, availableMaterials: ${_this.availableMaterials}, selectedIndex: ${_this.selectedIndex}, isReadyToDiagnose: ${_this.isReadyToDiagnose})';
}


}

/// @nodoc
abstract mixin class $SelectMaterialStateCopyWith<$Res>  {
  factory $SelectMaterialStateCopyWith(SelectMaterialState value, $Res Function(SelectMaterialState) _then) = _$SelectMaterialStateCopyWithImpl;
@useResult
$Res call({
 String imagePath, String locationName, LocationType? locationType, List<MaterialType> availableMaterials, int selectedIndex, bool isReadyToDiagnose
});




}
/// @nodoc
class _$SelectMaterialStateCopyWithImpl<$Res>
    implements $SelectMaterialStateCopyWith<$Res> {
  _$SelectMaterialStateCopyWithImpl(this._self, this._then);

  final SelectMaterialState _self;
  final $Res Function(SelectMaterialState) _then;

/// Create a copy of SelectMaterialState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? imagePath = null,Object? locationName = null,Object? locationType = freezed,Object? availableMaterials = null,Object? selectedIndex = null,Object? isReadyToDiagnose = null,}) {
  return _then(SelectMaterialState(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,locationType: freezed == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as LocationType?,availableMaterials: null == availableMaterials ? _self.availableMaterials : availableMaterials // ignore: cast_nullable_to_non_nullable
as List<MaterialType>,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,isReadyToDiagnose: null == isReadyToDiagnose ? _self.isReadyToDiagnose : isReadyToDiagnose // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SelectMaterialState].
extension SelectMaterialStatePatterns on SelectMaterialState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectMaterialState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectMaterialState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectMaterialState value)  $default,){
final _that = this;
switch (_that) {
case _SelectMaterialState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectMaterialState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectMaterialState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String imagePath,  String locationName,  LocationType? locationType,  List<MaterialType> availableMaterials,  int selectedIndex,  bool isReadyToDiagnose)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectMaterialState() when $default != null:
return $default(_that.imagePath,_that.locationName,_that.locationType,_that.availableMaterials,_that.selectedIndex,_that.isReadyToDiagnose);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String imagePath,  String locationName,  LocationType? locationType,  List<MaterialType> availableMaterials,  int selectedIndex,  bool isReadyToDiagnose)  $default,) {final _that = this;
switch (_that) {
case _SelectMaterialState():
return $default(_that.imagePath,_that.locationName,_that.locationType,_that.availableMaterials,_that.selectedIndex,_that.isReadyToDiagnose);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String imagePath,  String locationName,  LocationType? locationType,  List<MaterialType> availableMaterials,  int selectedIndex,  bool isReadyToDiagnose)?  $default,) {final _that = this;
switch (_that) {
case _SelectMaterialState() when $default != null:
return $default(_that.imagePath,_that.locationName,_that.locationType,_that.availableMaterials,_that.selectedIndex,_that.isReadyToDiagnose);case _:
  return null;

}
}

}

/// @nodoc


class _SelectMaterialState implements SelectMaterialState {
  const _SelectMaterialState({required this.imagePath, required this.locationName, this.locationType,  List<MaterialType> availableMaterials = const [], this.selectedIndex = -1, this.isReadyToDiagnose = false}): _availableMaterials = availableMaterials;
  

/// 撮影した画像のパス
@override final  String imagePath;
/// 選択された場所名
@override final  String locationName;
/// 選択された場所タイプ
@override final  LocationType? locationType;
/// 利用可能な素材リスト
 final  List<MaterialType> _availableMaterials;
/// 利用可能な素材リスト
@override@JsonKey() List<MaterialType> get availableMaterials {
  if (_availableMaterials is EqualUnmodifiableListView) return _availableMaterials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_availableMaterials);
}

/// 選択された素材のインデックス（-1で未選択）
@override@JsonKey() final  int selectedIndex;
/// 診断ボタンが有効か
@override@JsonKey() final  bool isReadyToDiagnose;

/// Create a copy of SelectMaterialState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectMaterialStateCopyWith<_SelectMaterialState> get copyWith => __$SelectMaterialStateCopyWithImpl<_SelectMaterialState>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectMaterialState&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.locationName, locationName) || other.locationName == locationName)&&(identical(other.locationType, locationType) || other.locationType == locationType)&&const DeepCollectionEquality().equals(other.availableMaterials, _availableMaterials)&&(identical(other.selectedIndex, selectedIndex) || other.selectedIndex == selectedIndex)&&(identical(other.isReadyToDiagnose, isReadyToDiagnose) || other.isReadyToDiagnose == isReadyToDiagnose));
}


@override
int get hashCode {
    return Object.hash(runtimeType,imagePath,locationName,locationType,const DeepCollectionEquality().hash(_availableMaterials),selectedIndex,isReadyToDiagnose);
}

@override
String toString() {
    return 'SelectMaterialState(imagePath: $imagePath, locationName: $locationName, locationType: $locationType, availableMaterials: $availableMaterials, selectedIndex: $selectedIndex, isReadyToDiagnose: $isReadyToDiagnose)';
}


}

/// @nodoc
abstract mixin class _$SelectMaterialStateCopyWith<$Res> implements $SelectMaterialStateCopyWith<$Res> {
  factory _$SelectMaterialStateCopyWith(_SelectMaterialState value, $Res Function(_SelectMaterialState) _then) = __$SelectMaterialStateCopyWithImpl;
@override @useResult
$Res call({
 String imagePath, String locationName, LocationType? locationType, List<MaterialType> availableMaterials, int selectedIndex, bool isReadyToDiagnose
});




}
/// @nodoc
class __$SelectMaterialStateCopyWithImpl<$Res>
    implements _$SelectMaterialStateCopyWith<$Res> {
  __$SelectMaterialStateCopyWithImpl(this._self, this._then);

  final _SelectMaterialState _self;
  final $Res Function(_SelectMaterialState) _then;

/// Create a copy of SelectMaterialState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? imagePath = null,Object? locationName = null,Object? locationType = freezed,Object? availableMaterials = null,Object? selectedIndex = null,Object? isReadyToDiagnose = null,}) {
  return _then(_SelectMaterialState(
imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,locationName: null == locationName ? _self.locationName : locationName // ignore: cast_nullable_to_non_nullable
as String,locationType: freezed == locationType ? _self.locationType : locationType // ignore: cast_nullable_to_non_nullable
as LocationType?,availableMaterials: null == availableMaterials ? _self._availableMaterials : availableMaterials // ignore: cast_nullable_to_non_nullable
as List<MaterialType>,selectedIndex: null == selectedIndex ? _self.selectedIndex : selectedIndex // ignore: cast_nullable_to_non_nullable
as int,isReadyToDiagnose: null == isReadyToDiagnose ? _self.isReadyToDiagnose : isReadyToDiagnose // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
