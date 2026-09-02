// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Diagnosis {

 String get id; String? get cloudId; String get imagePath; String get location; String get material; String get stainType; double get confidence; List<RecommendedDetergent> get recommendedDetergents; DiyRecipe? get diyRecipe; List<String> get cleaningSteps; List<String> get cautions; bool get isSynced; DateTime get createdAt;
/// Create a copy of Diagnosis
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosisCopyWith<Diagnosis> get copyWith => _$DiagnosisCopyWithImpl<Diagnosis>(this as Diagnosis, _$identity);

  /// Serializes this Diagnosis to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Diagnosis;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Diagnosis&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.cloudId, _this.cloudId) || other.cloudId == _this.cloudId)&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.stainType, _this.stainType) || other.stainType == _this.stainType)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&const DeepCollectionEquality().equals(other.recommendedDetergents, _this.recommendedDetergents)&&(identical(other.diyRecipe, _this.diyRecipe) || other.diyRecipe == _this.diyRecipe)&&const DeepCollectionEquality().equals(other.cleaningSteps, _this.cleaningSteps)&&const DeepCollectionEquality().equals(other.cautions, _this.cautions)&&(identical(other.isSynced, _this.isSynced) || other.isSynced == _this.isSynced)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Diagnosis;
  return Object.hash(runtimeType,_this.id,_this.cloudId,_this.imagePath,_this.location,_this.material,_this.stainType,_this.confidence,const DeepCollectionEquality().hash(_this.recommendedDetergents),_this.diyRecipe,const DeepCollectionEquality().hash(_this.cleaningSteps),const DeepCollectionEquality().hash(_this.cautions),_this.isSynced,_this.createdAt);
}

@override
String toString() {
  final _this = this as Diagnosis;
  return 'Diagnosis(id: ${_this.id}, cloudId: ${_this.cloudId}, imagePath: ${_this.imagePath}, location: ${_this.location}, material: ${_this.material}, stainType: ${_this.stainType}, confidence: ${_this.confidence}, recommendedDetergents: ${_this.recommendedDetergents}, diyRecipe: ${_this.diyRecipe}, cleaningSteps: ${_this.cleaningSteps}, cautions: ${_this.cautions}, isSynced: ${_this.isSynced}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $DiagnosisCopyWith<$Res>  {
  factory $DiagnosisCopyWith(Diagnosis value, $Res Function(Diagnosis) _then) = _$DiagnosisCopyWithImpl;
@useResult
$Res call({
 String id, String? cloudId, String imagePath, String location, String material, String stainType, double confidence, List<RecommendedDetergent> recommendedDetergents, DiyRecipe? diyRecipe, List<String> cleaningSteps, List<String> cautions, bool isSynced, DateTime createdAt
});


$DiyRecipeCopyWith<$Res>? get diyRecipe;

}
/// @nodoc
class _$DiagnosisCopyWithImpl<$Res>
    implements $DiagnosisCopyWith<$Res> {
  _$DiagnosisCopyWithImpl(this._self, this._then);

  final Diagnosis _self;
  final $Res Function(Diagnosis) _then;

/// Create a copy of Diagnosis
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? cloudId = freezed,Object? imagePath = null,Object? location = null,Object? material = null,Object? stainType = null,Object? confidence = null,Object? recommendedDetergents = null,Object? diyRecipe = freezed,Object? cleaningSteps = null,Object? cautions = null,Object? isSynced = null,Object? createdAt = null,}) {
  return _then(Diagnosis(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cloudId: freezed == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String?,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,stainType: null == stainType ? _self.stainType : stainType // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,recommendedDetergents: null == recommendedDetergents ? _self.recommendedDetergents : recommendedDetergents // ignore: cast_nullable_to_non_nullable
as List<RecommendedDetergent>,diyRecipe: freezed == diyRecipe ? _self.diyRecipe : diyRecipe // ignore: cast_nullable_to_non_nullable
as DiyRecipe?,cleaningSteps: null == cleaningSteps ? _self.cleaningSteps : cleaningSteps // ignore: cast_nullable_to_non_nullable
as List<String>,cautions: null == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
as List<String>,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of Diagnosis
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiyRecipeCopyWith<$Res>? get diyRecipe {
    if (_self.diyRecipe == null) {
    return null;
  }

  return $DiyRecipeCopyWith<$Res>(_self.diyRecipe!, (value) {
    return _then(_self.copyWith(diyRecipe: value));
  });
}
}


/// Adds pattern-matching-related methods to [Diagnosis].
extension DiagnosisPatterns on Diagnosis {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Diagnosis value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Diagnosis() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Diagnosis value)  $default,){
final _that = this;
switch (_that) {
case _Diagnosis():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Diagnosis value)?  $default,){
final _that = this;
switch (_that) {
case _Diagnosis() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? cloudId,  String imagePath,  String location,  String material,  String stainType,  double confidence,  List<RecommendedDetergent> recommendedDetergents,  DiyRecipe? diyRecipe,  List<String> cleaningSteps,  List<String> cautions,  bool isSynced,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Diagnosis() when $default != null:
return $default(_that.id,_that.cloudId,_that.imagePath,_that.location,_that.material,_that.stainType,_that.confidence,_that.recommendedDetergents,_that.diyRecipe,_that.cleaningSteps,_that.cautions,_that.isSynced,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? cloudId,  String imagePath,  String location,  String material,  String stainType,  double confidence,  List<RecommendedDetergent> recommendedDetergents,  DiyRecipe? diyRecipe,  List<String> cleaningSteps,  List<String> cautions,  bool isSynced,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _Diagnosis():
return $default(_that.id,_that.cloudId,_that.imagePath,_that.location,_that.material,_that.stainType,_that.confidence,_that.recommendedDetergents,_that.diyRecipe,_that.cleaningSteps,_that.cautions,_that.isSynced,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? cloudId,  String imagePath,  String location,  String material,  String stainType,  double confidence,  List<RecommendedDetergent> recommendedDetergents,  DiyRecipe? diyRecipe,  List<String> cleaningSteps,  List<String> cautions,  bool isSynced,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _Diagnosis() when $default != null:
return $default(_that.id,_that.cloudId,_that.imagePath,_that.location,_that.material,_that.stainType,_that.confidence,_that.recommendedDetergents,_that.diyRecipe,_that.cleaningSteps,_that.cautions,_that.isSynced,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Diagnosis implements Diagnosis {
  const _Diagnosis({required this.id, this.cloudId, required this.imagePath, required this.location, required this.material, required this.stainType, required this.confidence, required  List<RecommendedDetergent> recommendedDetergents, this.diyRecipe, required  List<String> cleaningSteps, required  List<String> cautions, this.isSynced = false, required this.createdAt}): _recommendedDetergents = recommendedDetergents,_cleaningSteps = cleaningSteps,_cautions = cautions;
  factory _Diagnosis.fromJson(Map<String, dynamic> json) => _$DiagnosisFromJson(json);

@override final  String id;
@override final  String? cloudId;
@override final  String imagePath;
@override final  String location;
@override final  String material;
@override final  String stainType;
@override final  double confidence;
 final  List<RecommendedDetergent> _recommendedDetergents;
@override List<RecommendedDetergent> get recommendedDetergents {
  if (_recommendedDetergents is EqualUnmodifiableListView) return _recommendedDetergents;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_recommendedDetergents);
}

@override final  DiyRecipe? diyRecipe;
 final  List<String> _cleaningSteps;
@override List<String> get cleaningSteps {
  if (_cleaningSteps is EqualUnmodifiableListView) return _cleaningSteps;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cleaningSteps);
}

 final  List<String> _cautions;
@override List<String> get cautions {
  if (_cautions is EqualUnmodifiableListView) return _cautions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cautions);
}

@override@JsonKey() final  bool isSynced;
@override final  DateTime createdAt;

/// Create a copy of Diagnosis
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiagnosisCopyWith<_Diagnosis> get copyWith => __$DiagnosisCopyWithImpl<_Diagnosis>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiagnosisToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Diagnosis&&(identical(other.id, id) || other.id == id)&&(identical(other.cloudId, cloudId) || other.cloudId == cloudId)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.location, location) || other.location == location)&&(identical(other.material, material) || other.material == material)&&(identical(other.stainType, stainType) || other.stainType == stainType)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.recommendedDetergents, _recommendedDetergents)&&(identical(other.diyRecipe, diyRecipe) || other.diyRecipe == diyRecipe)&&const DeepCollectionEquality().equals(other.cleaningSteps, _cleaningSteps)&&const DeepCollectionEquality().equals(other.cautions, _cautions)&&(identical(other.isSynced, isSynced) || other.isSynced == isSynced)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,cloudId,imagePath,location,material,stainType,confidence,const DeepCollectionEquality().hash(_recommendedDetergents),diyRecipe,const DeepCollectionEquality().hash(_cleaningSteps),const DeepCollectionEquality().hash(_cautions),isSynced,createdAt);
}

@override
String toString() {
    return 'Diagnosis(id: $id, cloudId: $cloudId, imagePath: $imagePath, location: $location, material: $material, stainType: $stainType, confidence: $confidence, recommendedDetergents: $recommendedDetergents, diyRecipe: $diyRecipe, cleaningSteps: $cleaningSteps, cautions: $cautions, isSynced: $isSynced, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DiagnosisCopyWith<$Res> implements $DiagnosisCopyWith<$Res> {
  factory _$DiagnosisCopyWith(_Diagnosis value, $Res Function(_Diagnosis) _then) = __$DiagnosisCopyWithImpl;
@override @useResult
$Res call({
 String id, String? cloudId, String imagePath, String location, String material, String stainType, double confidence, List<RecommendedDetergent> recommendedDetergents, DiyRecipe? diyRecipe, List<String> cleaningSteps, List<String> cautions, bool isSynced, DateTime createdAt
});


@override $DiyRecipeCopyWith<$Res>? get diyRecipe;

}
/// @nodoc
class __$DiagnosisCopyWithImpl<$Res>
    implements _$DiagnosisCopyWith<$Res> {
  __$DiagnosisCopyWithImpl(this._self, this._then);

  final _Diagnosis _self;
  final $Res Function(_Diagnosis) _then;

/// Create a copy of Diagnosis
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? cloudId = freezed,Object? imagePath = null,Object? location = null,Object? material = null,Object? stainType = null,Object? confidence = null,Object? recommendedDetergents = null,Object? diyRecipe = freezed,Object? cleaningSteps = null,Object? cautions = null,Object? isSynced = null,Object? createdAt = null,}) {
  return _then(_Diagnosis(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,cloudId: freezed == cloudId ? _self.cloudId : cloudId // ignore: cast_nullable_to_non_nullable
as String?,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,stainType: null == stainType ? _self.stainType : stainType // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,recommendedDetergents: null == recommendedDetergents ? _self._recommendedDetergents : recommendedDetergents // ignore: cast_nullable_to_non_nullable
as List<RecommendedDetergent>,diyRecipe: freezed == diyRecipe ? _self.diyRecipe : diyRecipe // ignore: cast_nullable_to_non_nullable
as DiyRecipe?,cleaningSteps: null == cleaningSteps ? _self._cleaningSteps : cleaningSteps // ignore: cast_nullable_to_non_nullable
as List<String>,cautions: null == cautions ? _self._cautions : cautions // ignore: cast_nullable_to_non_nullable
as List<String>,isSynced: null == isSynced ? _self.isSynced : isSynced // ignore: cast_nullable_to_non_nullable
as bool,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of Diagnosis
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DiyRecipeCopyWith<$Res>? get diyRecipe {
    if (_self.diyRecipe == null) {
    return null;
  }

  return $DiyRecipeCopyWith<$Res>(_self.diyRecipe!, (value) {
    return _then(_self.copyWith(diyRecipe: value));
  });
}
}


/// @nodoc
mixin _$RecommendedDetergent {

 String get name; String get brand; String get reason;
/// Create a copy of RecommendedDetergent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecommendedDetergentCopyWith<RecommendedDetergent> get copyWith => _$RecommendedDetergentCopyWithImpl<RecommendedDetergent>(this as RecommendedDetergent, _$identity);

  /// Serializes this RecommendedDetergent to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as RecommendedDetergent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RecommendedDetergent&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as RecommendedDetergent;
  return Object.hash(runtimeType,_this.name,_this.brand,_this.reason);
}

@override
String toString() {
  final _this = this as RecommendedDetergent;
  return 'RecommendedDetergent(name: ${_this.name}, brand: ${_this.brand}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $RecommendedDetergentCopyWith<$Res>  {
  factory $RecommendedDetergentCopyWith(RecommendedDetergent value, $Res Function(RecommendedDetergent) _then) = _$RecommendedDetergentCopyWithImpl;
@useResult
$Res call({
 String name, String brand, String reason
});




}
/// @nodoc
class _$RecommendedDetergentCopyWithImpl<$Res>
    implements $RecommendedDetergentCopyWith<$Res> {
  _$RecommendedDetergentCopyWithImpl(this._self, this._then);

  final RecommendedDetergent _self;
  final $Res Function(RecommendedDetergent) _then;

/// Create a copy of RecommendedDetergent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? brand = null,Object? reason = null,}) {
  return _then(RecommendedDetergent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [RecommendedDetergent].
extension RecommendedDetergentPatterns on RecommendedDetergent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RecommendedDetergent value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RecommendedDetergent() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RecommendedDetergent value)  $default,){
final _that = this;
switch (_that) {
case _RecommendedDetergent():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RecommendedDetergent value)?  $default,){
final _that = this;
switch (_that) {
case _RecommendedDetergent() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String brand,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RecommendedDetergent() when $default != null:
return $default(_that.name,_that.brand,_that.reason);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  String brand,  String reason)  $default,) {final _that = this;
switch (_that) {
case _RecommendedDetergent():
return $default(_that.name,_that.brand,_that.reason);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  String brand,  String reason)?  $default,) {final _that = this;
switch (_that) {
case _RecommendedDetergent() when $default != null:
return $default(_that.name,_that.brand,_that.reason);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RecommendedDetergent implements RecommendedDetergent {
  const _RecommendedDetergent({required this.name, required this.brand, required this.reason});
  factory _RecommendedDetergent.fromJson(Map<String, dynamic> json) => _$RecommendedDetergentFromJson(json);

@override final  String name;
@override final  String brand;
@override final  String reason;

/// Create a copy of RecommendedDetergent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecommendedDetergentCopyWith<_RecommendedDetergent> get copyWith => __$RecommendedDetergentCopyWithImpl<_RecommendedDetergent>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecommendedDetergentToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _RecommendedDetergent&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.reason, reason) || other.reason == reason));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,brand,reason);
}

@override
String toString() {
    return 'RecommendedDetergent(name: $name, brand: $brand, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$RecommendedDetergentCopyWith<$Res> implements $RecommendedDetergentCopyWith<$Res> {
  factory _$RecommendedDetergentCopyWith(_RecommendedDetergent value, $Res Function(_RecommendedDetergent) _then) = __$RecommendedDetergentCopyWithImpl;
@override @useResult
$Res call({
 String name, String brand, String reason
});




}
/// @nodoc
class __$RecommendedDetergentCopyWithImpl<$Res>
    implements _$RecommendedDetergentCopyWith<$Res> {
  __$RecommendedDetergentCopyWithImpl(this._self, this._then);

  final _RecommendedDetergent _self;
  final $Res Function(_RecommendedDetergent) _then;

/// Create a copy of RecommendedDetergent
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? brand = null,Object? reason = null,}) {
  return _then(_RecommendedDetergent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$DiyRecipe {

 String get name; List<String> get ingredients; List<String> get instructions;
/// Create a copy of DiyRecipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiyRecipeCopyWith<DiyRecipe> get copyWith => _$DiyRecipeCopyWithImpl<DiyRecipe>(this as DiyRecipe, _$identity);

  /// Serializes this DiyRecipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DiyRecipe;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiyRecipe&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.instructions, _this.instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DiyRecipe;
  return Object.hash(runtimeType,_this.name,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.instructions));
}

@override
String toString() {
  final _this = this as DiyRecipe;
  return 'DiyRecipe(name: ${_this.name}, ingredients: ${_this.ingredients}, instructions: ${_this.instructions})';
}


}

/// @nodoc
abstract mixin class $DiyRecipeCopyWith<$Res>  {
  factory $DiyRecipeCopyWith(DiyRecipe value, $Res Function(DiyRecipe) _then) = _$DiyRecipeCopyWithImpl;
@useResult
$Res call({
 String name, List<String> ingredients, List<String> instructions
});




}
/// @nodoc
class _$DiyRecipeCopyWithImpl<$Res>
    implements $DiyRecipeCopyWith<$Res> {
  _$DiyRecipeCopyWithImpl(this._self, this._then);

  final DiyRecipe _self;
  final $Res Function(DiyRecipe) _then;

/// Create a copy of DiyRecipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? ingredients = null,Object? instructions = null,}) {
  return _then(DiyRecipe(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [DiyRecipe].
extension DiyRecipePatterns on DiyRecipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiyRecipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiyRecipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiyRecipe value)  $default,){
final _that = this;
switch (_that) {
case _DiyRecipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiyRecipe value)?  $default,){
final _that = this;
switch (_that) {
case _DiyRecipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> ingredients,  List<String> instructions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiyRecipe() when $default != null:
return $default(_that.name,_that.ingredients,_that.instructions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> ingredients,  List<String> instructions)  $default,) {final _that = this;
switch (_that) {
case _DiyRecipe():
return $default(_that.name,_that.ingredients,_that.instructions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> ingredients,  List<String> instructions)?  $default,) {final _that = this;
switch (_that) {
case _DiyRecipe() when $default != null:
return $default(_that.name,_that.ingredients,_that.instructions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DiyRecipe implements DiyRecipe {
  const _DiyRecipe({required this.name, required  List<String> ingredients, required  List<String> instructions}): _ingredients = ingredients,_instructions = instructions;
  factory _DiyRecipe.fromJson(Map<String, dynamic> json) => _$DiyRecipeFromJson(json);

@override final  String name;
 final  List<String> _ingredients;
@override List<String> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}

 final  List<String> _instructions;
@override List<String> get instructions {
  if (_instructions is EqualUnmodifiableListView) return _instructions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_instructions);
}


/// Create a copy of DiyRecipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiyRecipeCopyWith<_DiyRecipe> get copyWith => __$DiyRecipeCopyWithImpl<_DiyRecipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DiyRecipeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiyRecipe&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.instructions, _instructions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_instructions));
}

@override
String toString() {
    return 'DiyRecipe(name: $name, ingredients: $ingredients, instructions: $instructions)';
}


}

/// @nodoc
abstract mixin class _$DiyRecipeCopyWith<$Res> implements $DiyRecipeCopyWith<$Res> {
  factory _$DiyRecipeCopyWith(_DiyRecipe value, $Res Function(_DiyRecipe) _then) = __$DiyRecipeCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> ingredients, List<String> instructions
});




}
/// @nodoc
class __$DiyRecipeCopyWithImpl<$Res>
    implements _$DiyRecipeCopyWith<$Res> {
  __$DiyRecipeCopyWithImpl(this._self, this._then);

  final _DiyRecipe _self;
  final $Res Function(_DiyRecipe) _then;

/// Create a copy of DiyRecipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? ingredients = null,Object? instructions = null,}) {
  return _then(_DiyRecipe(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
