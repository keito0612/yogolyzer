// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'diagnosis_result_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Detergent {

 String get name; String get brand; String get reason;
/// Create a copy of Detergent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetergentCopyWith<Detergent> get copyWith => _$DetergentCopyWithImpl<Detergent>(this as Detergent, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as Detergent;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Detergent&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.brand, _this.brand) || other.brand == _this.brand)&&(identical(other.reason, _this.reason) || other.reason == _this.reason));
}


@override
int get hashCode {
  final _this = this as Detergent;
  return Object.hash(runtimeType,_this.name,_this.brand,_this.reason);
}

@override
String toString() {
  final _this = this as Detergent;
  return 'Detergent(name: ${_this.name}, brand: ${_this.brand}, reason: ${_this.reason})';
}


}

/// @nodoc
abstract mixin class $DetergentCopyWith<$Res>  {
  factory $DetergentCopyWith(Detergent value, $Res Function(Detergent) _then) = _$DetergentCopyWithImpl;
@useResult
$Res call({
 String name, String brand, String reason
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? brand = null,Object? reason = null,}) {
  return _then(Detergent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  String brand,  String reason)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Detergent() when $default != null:
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
case _Detergent():
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
case _Detergent() when $default != null:
return $default(_that.name,_that.brand,_that.reason);case _:
  return null;

}
}

}

/// @nodoc


class _Detergent implements Detergent {
  const _Detergent({required this.name, required this.brand, required this.reason});
  

@override final  String name;
@override final  String brand;
@override final  String reason;

/// Create a copy of Detergent
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetergentCopyWith<_Detergent> get copyWith => __$DetergentCopyWithImpl<_Detergent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Detergent&&(identical(other.name, name) || other.name == name)&&(identical(other.brand, brand) || other.brand == brand)&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,brand,reason);
}

@override
String toString() {
    return 'Detergent(name: $name, brand: $brand, reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$DetergentCopyWith<$Res> implements $DetergentCopyWith<$Res> {
  factory _$DetergentCopyWith(_Detergent value, $Res Function(_Detergent) _then) = __$DetergentCopyWithImpl;
@override @useResult
$Res call({
 String name, String brand, String reason
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? brand = null,Object? reason = null,}) {
  return _then(_Detergent(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,brand: null == brand ? _self.brand : brand // ignore: cast_nullable_to_non_nullable
as String,reason: null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc
mixin _$DiyRecipe {

 String get name; List<String> get ingredients; List<String> get instructions; String get usage; List<String> get cautions;
/// Create a copy of DiyRecipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiyRecipeCopyWith<DiyRecipe> get copyWith => _$DiyRecipeCopyWithImpl<DiyRecipe>(this as DiyRecipe, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DiyRecipe;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiyRecipe&&(identical(other.name, _this.name) || other.name == _this.name)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.instructions, _this.instructions)&&(identical(other.usage, _this.usage) || other.usage == _this.usage)&&const DeepCollectionEquality().equals(other.cautions, _this.cautions));
}


@override
int get hashCode {
  final _this = this as DiyRecipe;
  return Object.hash(runtimeType,_this.name,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.instructions),_this.usage,const DeepCollectionEquality().hash(_this.cautions));
}

@override
String toString() {
  final _this = this as DiyRecipe;
  return 'DiyRecipe(name: ${_this.name}, ingredients: ${_this.ingredients}, instructions: ${_this.instructions}, usage: ${_this.usage}, cautions: ${_this.cautions})';
}


}

/// @nodoc
abstract mixin class $DiyRecipeCopyWith<$Res>  {
  factory $DiyRecipeCopyWith(DiyRecipe value, $Res Function(DiyRecipe) _then) = _$DiyRecipeCopyWithImpl;
@useResult
$Res call({
 String name, List<String> ingredients, List<String> instructions, String usage, List<String> cautions
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
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? ingredients = null,Object? instructions = null,Object? usage = null,Object? cautions = null,}) {
  return _then(DiyRecipe(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as String,cautions: null == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> ingredients,  List<String> instructions,  String usage,  List<String> cautions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiyRecipe() when $default != null:
return $default(_that.name,_that.ingredients,_that.instructions,_that.usage,_that.cautions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> ingredients,  List<String> instructions,  String usage,  List<String> cautions)  $default,) {final _that = this;
switch (_that) {
case _DiyRecipe():
return $default(_that.name,_that.ingredients,_that.instructions,_that.usage,_that.cautions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> ingredients,  List<String> instructions,  String usage,  List<String> cautions)?  $default,) {final _that = this;
switch (_that) {
case _DiyRecipe() when $default != null:
return $default(_that.name,_that.ingredients,_that.instructions,_that.usage,_that.cautions);case _:
  return null;

}
}

}

/// @nodoc


class _DiyRecipe implements DiyRecipe {
  const _DiyRecipe({required this.name, required  List<String> ingredients, required  List<String> instructions, this.usage = '',  List<String> cautions = const []}): _ingredients = ingredients,_instructions = instructions,_cautions = cautions;
  

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

@override@JsonKey() final  String usage;
 final  List<String> _cautions;
@override@JsonKey() List<String> get cautions {
  if (_cautions is EqualUnmodifiableListView) return _cautions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_cautions);
}


/// Create a copy of DiyRecipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiyRecipeCopyWith<_DiyRecipe> get copyWith => __$DiyRecipeCopyWithImpl<_DiyRecipe>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiyRecipe&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.instructions, _instructions)&&(identical(other.usage, usage) || other.usage == usage)&&const DeepCollectionEquality().equals(other.cautions, _cautions));
}


@override
int get hashCode {
    return Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_instructions),usage,const DeepCollectionEquality().hash(_cautions));
}

@override
String toString() {
    return 'DiyRecipe(name: $name, ingredients: $ingredients, instructions: $instructions, usage: $usage, cautions: $cautions)';
}


}

/// @nodoc
abstract mixin class _$DiyRecipeCopyWith<$Res> implements $DiyRecipeCopyWith<$Res> {
  factory _$DiyRecipeCopyWith(_DiyRecipe value, $Res Function(_DiyRecipe) _then) = __$DiyRecipeCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> ingredients, List<String> instructions, String usage, List<String> cautions
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
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? ingredients = null,Object? instructions = null,Object? usage = null,Object? cautions = null,}) {
  return _then(_DiyRecipe(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as String,cautions: null == cautions ? _self._cautions : cautions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc
mixin _$DiagnosisResult {

 String get id; String get imagePath; String get location; String get material; String get stainType; double get confidence; List<Detergent> get recommendedDetergents; DiyRecipe? get diyRecipe; List<String> get cleaningSteps; List<String> get cautions; DateTime get createdAt;
/// Create a copy of DiagnosisResult
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosisResultCopyWith<DiagnosisResult> get copyWith => _$DiagnosisResultCopyWithImpl<DiagnosisResult>(this as DiagnosisResult, _$identity);



@override
bool operator ==(Object other) {
  final _this = this as DiagnosisResult;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResult&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.imagePath, _this.imagePath) || other.imagePath == _this.imagePath)&&(identical(other.location, _this.location) || other.location == _this.location)&&(identical(other.material, _this.material) || other.material == _this.material)&&(identical(other.stainType, _this.stainType) || other.stainType == _this.stainType)&&(identical(other.confidence, _this.confidence) || other.confidence == _this.confidence)&&const DeepCollectionEquality().equals(other.recommendedDetergents, _this.recommendedDetergents)&&(identical(other.diyRecipe, _this.diyRecipe) || other.diyRecipe == _this.diyRecipe)&&const DeepCollectionEquality().equals(other.cleaningSteps, _this.cleaningSteps)&&const DeepCollectionEquality().equals(other.cautions, _this.cautions)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt));
}


@override
int get hashCode {
  final _this = this as DiagnosisResult;
  return Object.hash(runtimeType,_this.id,_this.imagePath,_this.location,_this.material,_this.stainType,_this.confidence,const DeepCollectionEquality().hash(_this.recommendedDetergents),_this.diyRecipe,const DeepCollectionEquality().hash(_this.cleaningSteps),const DeepCollectionEquality().hash(_this.cautions),_this.createdAt);
}

@override
String toString() {
  final _this = this as DiagnosisResult;
  return 'DiagnosisResult(id: ${_this.id}, imagePath: ${_this.imagePath}, location: ${_this.location}, material: ${_this.material}, stainType: ${_this.stainType}, confidence: ${_this.confidence}, recommendedDetergents: ${_this.recommendedDetergents}, diyRecipe: ${_this.diyRecipe}, cleaningSteps: ${_this.cleaningSteps}, cautions: ${_this.cautions}, createdAt: ${_this.createdAt})';
}


}

/// @nodoc
abstract mixin class $DiagnosisResultCopyWith<$Res>  {
  factory $DiagnosisResultCopyWith(DiagnosisResult value, $Res Function(DiagnosisResult) _then) = _$DiagnosisResultCopyWithImpl;
@useResult
$Res call({
 String id, String imagePath, String location, String material, String stainType, double confidence, List<Detergent> recommendedDetergents, DiyRecipe? diyRecipe, List<String> cleaningSteps, List<String> cautions, DateTime createdAt
});


$DiyRecipeCopyWith<$Res>? get diyRecipe;

}
/// @nodoc
class _$DiagnosisResultCopyWithImpl<$Res>
    implements $DiagnosisResultCopyWith<$Res> {
  _$DiagnosisResultCopyWithImpl(this._self, this._then);

  final DiagnosisResult _self;
  final $Res Function(DiagnosisResult) _then;

/// Create a copy of DiagnosisResult
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? imagePath = null,Object? location = null,Object? material = null,Object? stainType = null,Object? confidence = null,Object? recommendedDetergents = null,Object? diyRecipe = freezed,Object? cleaningSteps = null,Object? cautions = null,Object? createdAt = null,}) {
  return _then(DiagnosisResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,stainType: null == stainType ? _self.stainType : stainType // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,recommendedDetergents: null == recommendedDetergents ? _self.recommendedDetergents : recommendedDetergents // ignore: cast_nullable_to_non_nullable
as List<Detergent>,diyRecipe: freezed == diyRecipe ? _self.diyRecipe : diyRecipe // ignore: cast_nullable_to_non_nullable
as DiyRecipe?,cleaningSteps: null == cleaningSteps ? _self.cleaningSteps : cleaningSteps // ignore: cast_nullable_to_non_nullable
as List<String>,cautions: null == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}
/// Create a copy of DiagnosisResult
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


/// Adds pattern-matching-related methods to [DiagnosisResult].
extension DiagnosisResultPatterns on DiagnosisResult {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DiagnosisResult value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DiagnosisResult() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DiagnosisResult value)  $default,){
final _that = this;
switch (_that) {
case _DiagnosisResult():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DiagnosisResult value)?  $default,){
final _that = this;
switch (_that) {
case _DiagnosisResult() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String imagePath,  String location,  String material,  String stainType,  double confidence,  List<Detergent> recommendedDetergents,  DiyRecipe? diyRecipe,  List<String> cleaningSteps,  List<String> cautions,  DateTime createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DiagnosisResult() when $default != null:
return $default(_that.id,_that.imagePath,_that.location,_that.material,_that.stainType,_that.confidence,_that.recommendedDetergents,_that.diyRecipe,_that.cleaningSteps,_that.cautions,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String imagePath,  String location,  String material,  String stainType,  double confidence,  List<Detergent> recommendedDetergents,  DiyRecipe? diyRecipe,  List<String> cleaningSteps,  List<String> cautions,  DateTime createdAt)  $default,) {final _that = this;
switch (_that) {
case _DiagnosisResult():
return $default(_that.id,_that.imagePath,_that.location,_that.material,_that.stainType,_that.confidence,_that.recommendedDetergents,_that.diyRecipe,_that.cleaningSteps,_that.cautions,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String imagePath,  String location,  String material,  String stainType,  double confidence,  List<Detergent> recommendedDetergents,  DiyRecipe? diyRecipe,  List<String> cleaningSteps,  List<String> cautions,  DateTime createdAt)?  $default,) {final _that = this;
switch (_that) {
case _DiagnosisResult() when $default != null:
return $default(_that.id,_that.imagePath,_that.location,_that.material,_that.stainType,_that.confidence,_that.recommendedDetergents,_that.diyRecipe,_that.cleaningSteps,_that.cautions,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc


class _DiagnosisResult implements DiagnosisResult {
  const _DiagnosisResult({required this.id, required this.imagePath, required this.location, required this.material, required this.stainType, required this.confidence, required  List<Detergent> recommendedDetergents, required this.diyRecipe, required  List<String> cleaningSteps, required  List<String> cautions, required this.createdAt}): _recommendedDetergents = recommendedDetergents,_cleaningSteps = cleaningSteps,_cautions = cautions;
  

@override final  String id;
@override final  String imagePath;
@override final  String location;
@override final  String material;
@override final  String stainType;
@override final  double confidence;
 final  List<Detergent> _recommendedDetergents;
@override List<Detergent> get recommendedDetergents {
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

@override final  DateTime createdAt;

/// Create a copy of DiagnosisResult
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DiagnosisResultCopyWith<_DiagnosisResult> get copyWith => __$DiagnosisResultCopyWithImpl<_DiagnosisResult>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DiagnosisResult&&(identical(other.id, id) || other.id == id)&&(identical(other.imagePath, imagePath) || other.imagePath == imagePath)&&(identical(other.location, location) || other.location == location)&&(identical(other.material, material) || other.material == material)&&(identical(other.stainType, stainType) || other.stainType == stainType)&&(identical(other.confidence, confidence) || other.confidence == confidence)&&const DeepCollectionEquality().equals(other.recommendedDetergents, _recommendedDetergents)&&(identical(other.diyRecipe, diyRecipe) || other.diyRecipe == diyRecipe)&&const DeepCollectionEquality().equals(other.cleaningSteps, _cleaningSteps)&&const DeepCollectionEquality().equals(other.cautions, _cautions)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id,imagePath,location,material,stainType,confidence,const DeepCollectionEquality().hash(_recommendedDetergents),diyRecipe,const DeepCollectionEquality().hash(_cleaningSteps),const DeepCollectionEquality().hash(_cautions),createdAt);
}

@override
String toString() {
    return 'DiagnosisResult(id: $id, imagePath: $imagePath, location: $location, material: $material, stainType: $stainType, confidence: $confidence, recommendedDetergents: $recommendedDetergents, diyRecipe: $diyRecipe, cleaningSteps: $cleaningSteps, cautions: $cautions, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$DiagnosisResultCopyWith<$Res> implements $DiagnosisResultCopyWith<$Res> {
  factory _$DiagnosisResultCopyWith(_DiagnosisResult value, $Res Function(_DiagnosisResult) _then) = __$DiagnosisResultCopyWithImpl;
@override @useResult
$Res call({
 String id, String imagePath, String location, String material, String stainType, double confidence, List<Detergent> recommendedDetergents, DiyRecipe? diyRecipe, List<String> cleaningSteps, List<String> cautions, DateTime createdAt
});


@override $DiyRecipeCopyWith<$Res>? get diyRecipe;

}
/// @nodoc
class __$DiagnosisResultCopyWithImpl<$Res>
    implements _$DiagnosisResultCopyWith<$Res> {
  __$DiagnosisResultCopyWithImpl(this._self, this._then);

  final _DiagnosisResult _self;
  final $Res Function(_DiagnosisResult) _then;

/// Create a copy of DiagnosisResult
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? imagePath = null,Object? location = null,Object? material = null,Object? stainType = null,Object? confidence = null,Object? recommendedDetergents = null,Object? diyRecipe = freezed,Object? cleaningSteps = null,Object? cautions = null,Object? createdAt = null,}) {
  return _then(_DiagnosisResult(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,imagePath: null == imagePath ? _self.imagePath : imagePath // ignore: cast_nullable_to_non_nullable
as String,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,material: null == material ? _self.material : material // ignore: cast_nullable_to_non_nullable
as String,stainType: null == stainType ? _self.stainType : stainType // ignore: cast_nullable_to_non_nullable
as String,confidence: null == confidence ? _self.confidence : confidence // ignore: cast_nullable_to_non_nullable
as double,recommendedDetergents: null == recommendedDetergents ? _self._recommendedDetergents : recommendedDetergents // ignore: cast_nullable_to_non_nullable
as List<Detergent>,diyRecipe: freezed == diyRecipe ? _self.diyRecipe : diyRecipe // ignore: cast_nullable_to_non_nullable
as DiyRecipe?,cleaningSteps: null == cleaningSteps ? _self._cleaningSteps : cleaningSteps // ignore: cast_nullable_to_non_nullable
as List<String>,cautions: null == cautions ? _self._cautions : cautions // ignore: cast_nullable_to_non_nullable
as List<String>,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

/// Create a copy of DiagnosisResult
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
mixin _$DiagnosisResultState {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResultState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DiagnosisResultState()';
}


}

/// @nodoc
class $DiagnosisResultStateCopyWith<$Res>  {
$DiagnosisResultStateCopyWith(DiagnosisResultState _, $Res Function(DiagnosisResultState) __);
}


/// Adds pattern-matching-related methods to [DiagnosisResultState].
extension DiagnosisResultStatePatterns on DiagnosisResultState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( DiagnosisResultStateLoading value)?  loading,TResult Function( DiagnosisResultStateLoaded value)?  loaded,TResult Function( DiagnosisResultStateDeleting value)?  deleting,TResult Function( DiagnosisResultStateDeleted value)?  deleted,TResult Function( DiagnosisResultStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case DiagnosisResultStateLoading() when loading != null:
return loading(_that);case DiagnosisResultStateLoaded() when loaded != null:
return loaded(_that);case DiagnosisResultStateDeleting() when deleting != null:
return deleting(_that);case DiagnosisResultStateDeleted() when deleted != null:
return deleted(_that);case DiagnosisResultStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( DiagnosisResultStateLoading value)  loading,required TResult Function( DiagnosisResultStateLoaded value)  loaded,required TResult Function( DiagnosisResultStateDeleting value)  deleting,required TResult Function( DiagnosisResultStateDeleted value)  deleted,required TResult Function( DiagnosisResultStateError value)  error,}){
final _that = this;
switch (_that) {
case DiagnosisResultStateLoading():
return loading(_that);case DiagnosisResultStateLoaded():
return loaded(_that);case DiagnosisResultStateDeleting():
return deleting(_that);case DiagnosisResultStateDeleted():
return deleted(_that);case DiagnosisResultStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( DiagnosisResultStateLoading value)?  loading,TResult? Function( DiagnosisResultStateLoaded value)?  loaded,TResult? Function( DiagnosisResultStateDeleting value)?  deleting,TResult? Function( DiagnosisResultStateDeleted value)?  deleted,TResult? Function( DiagnosisResultStateError value)?  error,}){
final _that = this;
switch (_that) {
case DiagnosisResultStateLoading() when loading != null:
return loading(_that);case DiagnosisResultStateLoaded() when loaded != null:
return loaded(_that);case DiagnosisResultStateDeleting() when deleting != null:
return deleting(_that);case DiagnosisResultStateDeleted() when deleted != null:
return deleted(_that);case DiagnosisResultStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loading,TResult Function( DiagnosisResult result,  bool isSaved)?  loaded,TResult Function( DiagnosisResult result)?  deleting,TResult Function()?  deleted,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case DiagnosisResultStateLoading() when loading != null:
return loading();case DiagnosisResultStateLoaded() when loaded != null:
return loaded(_that.result,_that.isSaved);case DiagnosisResultStateDeleting() when deleting != null:
return deleting(_that.result);case DiagnosisResultStateDeleted() when deleted != null:
return deleted();case DiagnosisResultStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loading,required TResult Function( DiagnosisResult result,  bool isSaved)  loaded,required TResult Function( DiagnosisResult result)  deleting,required TResult Function()  deleted,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case DiagnosisResultStateLoading():
return loading();case DiagnosisResultStateLoaded():
return loaded(_that.result,_that.isSaved);case DiagnosisResultStateDeleting():
return deleting(_that.result);case DiagnosisResultStateDeleted():
return deleted();case DiagnosisResultStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loading,TResult? Function( DiagnosisResult result,  bool isSaved)?  loaded,TResult? Function( DiagnosisResult result)?  deleting,TResult? Function()?  deleted,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case DiagnosisResultStateLoading() when loading != null:
return loading();case DiagnosisResultStateLoaded() when loaded != null:
return loaded(_that.result,_that.isSaved);case DiagnosisResultStateDeleting() when deleting != null:
return deleting(_that.result);case DiagnosisResultStateDeleted() when deleted != null:
return deleted();case DiagnosisResultStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class DiagnosisResultStateLoading implements DiagnosisResultState {
  const DiagnosisResultStateLoading();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResultStateLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DiagnosisResultState.loading()';
}


}




/// @nodoc


class DiagnosisResultStateLoaded implements DiagnosisResultState {
  const DiagnosisResultStateLoaded({required this.result, required this.isSaved});
  

 final  DiagnosisResult result;
 final  bool isSaved;

/// Create a copy of DiagnosisResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosisResultStateLoadedCopyWith<DiagnosisResultStateLoaded> get copyWith => _$DiagnosisResultStateLoadedCopyWithImpl<DiagnosisResultStateLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResultStateLoaded&&(identical(other.result, result) || other.result == result)&&(identical(other.isSaved, isSaved) || other.isSaved == isSaved));
}


@override
int get hashCode {
    return Object.hash(runtimeType,result,isSaved);
}

@override
String toString() {
    return 'DiagnosisResultState.loaded(result: $result, isSaved: $isSaved)';
}


}

/// @nodoc
abstract mixin class $DiagnosisResultStateLoadedCopyWith<$Res> implements $DiagnosisResultStateCopyWith<$Res> {
  factory $DiagnosisResultStateLoadedCopyWith(DiagnosisResultStateLoaded value, $Res Function(DiagnosisResultStateLoaded) _then) = _$DiagnosisResultStateLoadedCopyWithImpl;
@useResult
$Res call({
 DiagnosisResult result, bool isSaved
});


$DiagnosisResultCopyWith<$Res> get result;

}
/// @nodoc
class _$DiagnosisResultStateLoadedCopyWithImpl<$Res>
    implements $DiagnosisResultStateLoadedCopyWith<$Res> {
  _$DiagnosisResultStateLoadedCopyWithImpl(this._self, this._then);

  final DiagnosisResultStateLoaded _self;
  final $Res Function(DiagnosisResultStateLoaded) _then;

/// Create a copy of DiagnosisResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,Object? isSaved = null,}) {
  return _then(DiagnosisResultStateLoaded(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DiagnosisResult,isSaved: null == isSaved ? _self.isSaved : isSaved // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of DiagnosisResultState
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


class DiagnosisResultStateDeleting implements DiagnosisResultState {
  const DiagnosisResultStateDeleting({required this.result});
  

 final  DiagnosisResult result;

/// Create a copy of DiagnosisResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosisResultStateDeletingCopyWith<DiagnosisResultStateDeleting> get copyWith => _$DiagnosisResultStateDeletingCopyWithImpl<DiagnosisResultStateDeleting>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResultStateDeleting&&(identical(other.result, result) || other.result == result));
}


@override
int get hashCode {
    return Object.hash(runtimeType,result);
}

@override
String toString() {
    return 'DiagnosisResultState.deleting(result: $result)';
}


}

/// @nodoc
abstract mixin class $DiagnosisResultStateDeletingCopyWith<$Res> implements $DiagnosisResultStateCopyWith<$Res> {
  factory $DiagnosisResultStateDeletingCopyWith(DiagnosisResultStateDeleting value, $Res Function(DiagnosisResultStateDeleting) _then) = _$DiagnosisResultStateDeletingCopyWithImpl;
@useResult
$Res call({
 DiagnosisResult result
});


$DiagnosisResultCopyWith<$Res> get result;

}
/// @nodoc
class _$DiagnosisResultStateDeletingCopyWithImpl<$Res>
    implements $DiagnosisResultStateDeletingCopyWith<$Res> {
  _$DiagnosisResultStateDeletingCopyWithImpl(this._self, this._then);

  final DiagnosisResultStateDeleting _self;
  final $Res Function(DiagnosisResultStateDeleting) _then;

/// Create a copy of DiagnosisResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = null,}) {
  return _then(DiagnosisResultStateDeleting(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DiagnosisResult,
  ));
}

/// Create a copy of DiagnosisResultState
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


class DiagnosisResultStateDeleted implements DiagnosisResultState {
  const DiagnosisResultStateDeleted();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResultStateDeleted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DiagnosisResultState.deleted()';
}


}




/// @nodoc


class DiagnosisResultStateError implements DiagnosisResultState {
  const DiagnosisResultStateError({required this.message});
  

 final  String message;

/// Create a copy of DiagnosisResultState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DiagnosisResultStateErrorCopyWith<DiagnosisResultStateError> get copyWith => _$DiagnosisResultStateErrorCopyWithImpl<DiagnosisResultStateError>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DiagnosisResultStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode {
    return Object.hash(runtimeType,message);
}

@override
String toString() {
    return 'DiagnosisResultState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $DiagnosisResultStateErrorCopyWith<$Res> implements $DiagnosisResultStateCopyWith<$Res> {
  factory $DiagnosisResultStateErrorCopyWith(DiagnosisResultStateError value, $Res Function(DiagnosisResultStateError) _then) = _$DiagnosisResultStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$DiagnosisResultStateErrorCopyWithImpl<$Res>
    implements $DiagnosisResultStateErrorCopyWith<$Res> {
  _$DiagnosisResultStateErrorCopyWithImpl(this._self, this._then);

  final DiagnosisResultStateError _self;
  final $Res Function(DiagnosisResultStateError) _then;

/// Create a copy of DiagnosisResultState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(DiagnosisResultStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
