// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detergent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Detergent {

 String get id; String get name; String get brand; DetergentType get type; List<String> get targetStains; List<String> get targetMaterials; String? get cautions; String? get purchaseUrl;
/// Create a copy of Detergent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetergentCopyWith<Detergent> get copyWith => _$DetergentCopyWithImpl<Detergent>(this as Detergent, _$identity);

  /// Serializes this Detergent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Detergent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Detergent&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.type, _this.type) || other.type == _this.type)&&const DeepCollectionEquality().equals(other.targetStains, _this.targetStains)&&const DeepCollectionEquality().equals(other.targetMaterials, _this.targetMaterials)&&(identical(other.cautions, _this.cautions) || other.cautions == _this.cautions)&&(identical(other.purchaseUrl, _this.purchaseUrl) || other.purchaseUrl == _this.purchaseUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Detergent;
  return Object.hash(runtimeType,_this.id,_this.name,_this.brand,_this.type,const DeepCollectionEquality().hash(_this.targetStains),const DeepCollectionEquality().hash(_this.targetMaterials),_this.cautions,_this.purchaseUrl);
}

@override
String toString() {
  final _this = this as Detergent;
  return 'Detergent(id: ${_this.id}, name: ${_this.name}, brand: ${_this.brand}, type: ${_this.type}, targetStains: ${_this.targetStains}, targetMaterials: ${_this.targetMaterials}, cautions: ${_this.cautions}, purchaseUrl: ${_this.purchaseUrl})';
}


}

/// @nodoc
abstract mixin class $DetergentCopyWith<$Res>  {
  factory $DetergentCopyWith(Detergent value, $Res Function(Detergent) _then) = _$DetergentCopyWithImpl;
@useResult
$Res call({
 String id, String name, String brand, DetergentType type, List<String> targetStains, List<String> targetMaterials, String? cautions, String? purchaseUrl
});




}
/// @nodoc
class _$DetergentCopyWithImpl<$Res>
    implements $DetergentCopyWith<$Res> {
  _$DetergentCopyWithImpl(this._self, this._then);

  final Detergent _self;
  final $Res Function(Detergent) _then;

/// Create a copy of Detergent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? brand = null,Object? type = null,Object? targetStains = null,Object? targetMaterials = null,Object? cautions = freezed,Object? purchaseUrl = freezed,}) {
  return _then(Detergent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DetergentType,targetStains: null == targetStains ? _self.targetStains : targetStains // ignore: cast_nullable_to_non_nullable
as List<String>,targetMaterials: null == targetMaterials ? _self.targetMaterials : targetMaterials // ignore: cast_nullable_to_non_nullable
as List<String>,cautions: freezed == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
as String?,purchaseUrl: freezed == purchaseUrl ? _self.purchaseUrl : purchaseUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Detergent].
extension DetergentPatterns on Detergent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Detergent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Detergent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Detergent value)  $default,){
final _that = this;
switch (_that) {
case _Detergent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Detergent value)?  $default,){
final _that = this;
switch (_that) {
case _Detergent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String brand,  DetergentType type,  List<String> targetStains,  List<String> targetMaterials,  String? cautions,  String? purchaseUrl)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Detergent() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.type,_that.targetStains,_that.targetMaterials,_that.cautions,_that.purchaseUrl);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String brand,  DetergentType type,  List<String> targetStains,  List<String> targetMaterials,  String? cautions,  String? purchaseUrl)  $default,) {final _that = this;
switch (_that) {
case _Detergent():
return $default(_that.id,_that.name,_that.brand,_that.type,_that.targetStains,_that.targetMaterials,_that.cautions,_that.purchaseUrl);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String brand,  DetergentType type,  List<String> targetStains,  List<String> targetMaterials,  String? cautions,  String? purchaseUrl)?  $default,) {final _that = this;
switch (_that) {
case _Detergent() when $default != null:
return $default(_that.id,_that.name,_that.brand,_that.type,_that.targetStains,_that.targetMaterials,_that.cautions,_that.purchaseUrl);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Detergent implements Detergent {
  const _Detergent({required this.id, required this.name, required this.brand, required this.type, required  List<String> targetStains, required  List<String> targetMaterials, this.cautions, this.purchaseUrl}): _targetStains = targetStains,_targetMaterials = targetMaterials;
  factory _Detergent.fromJson(Map<String, dynamic> json) => _$DetergentFromJson(json);

@override final  String id;
@override final  String name;
@override final  String brand;
@override final  DetergentType type;
 final  List<String> _targetStains;
@override List<String> get targetStains {
  if (_targetStains is EqualUnmodifiableListView) return _targetStains;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetStains);
}

 final  List<String> _targetMaterials;
@override List<String> get targetMaterials {
  if (_targetMaterials is EqualUnmodifiableListView) return _targetMaterials;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_targetMaterials);
}

@override final  String? cautions;
@override final  String? purchaseUrl;

/// Create a copy of Detergent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetergentCopyWith<_Detergent> get copyWith => __$DetergentCopyWithImpl<_Detergent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetergentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Detergent&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.targetStains, _targetStains)&&const DeepCollectionEquality().equals(other.targetMaterials, _targetMaterials)&&(identical(other.cautions, cautions) || other.cautions == cautions)&&(identical(other.purchaseUrl, purchaseUrl) || other.purchaseUrl == purchaseUrl));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,brand,type,const DeepCollectionEquality().hash(_targetStains),const DeepCollectionEquality().hash(_targetMaterials),cautions,purchaseUrl);
}

@override
String toString() {
    return 'Detergent(id: $id, name: $name, brand: $brand, type: $type, targetStains: $targetStains, targetMaterials: $targetMaterials, cautions: $cautions, purchaseUrl: $purchaseUrl)';
}


}

/// @nodoc
abstract mixin class _$DetergentCopyWith<$Res> implements $DetergentCopyWith<$Res> {
  factory _$DetergentCopyWith(_Detergent value, $Res Function(_Detergent) _then) = __$DetergentCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String brand, DetergentType type, List<String> targetStains, List<String> targetMaterials, String? cautions, String? purchaseUrl
});




}
/// @nodoc
class __$DetergentCopyWithImpl<$Res>
    implements _$DetergentCopyWith<$Res> {
  __$DetergentCopyWithImpl(this._self, this._then);

  final _Detergent _self;
  final $Res Function(_Detergent) _then;

/// Create a copy of Detergent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? brand = null,Object? type = null,Object? targetStains = null,Object? targetMaterials = null,Object? cautions = freezed,Object? purchaseUrl = freezed,}) {
  return _then(_Detergent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as DetergentType,targetStains: null == targetStains ? _self._targetStains : targetStains // ignore: cast_nullable_to_non_nullable
as List<String>,targetMaterials: null == targetMaterials ? _self._targetMaterials : targetMaterials // ignore: cast_nullable_to_non_nullable
as List<String>,cautions: freezed == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
as String?,purchaseUrl: freezed == purchaseUrl ? _self.purchaseUrl : purchaseUrl // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
