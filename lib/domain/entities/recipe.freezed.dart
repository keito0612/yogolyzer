// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Recipe {

 String get id; String get name; String get targetStain; List<String> get ingredients; List<String> get instructions; String get usage; String? get cautions; bool get isPremium;
/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RecipeCopyWith<Recipe> get copyWith => _$RecipeCopyWithImpl<Recipe>(this as Recipe, _$identity);

  /// Serializes this Recipe to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as Recipe;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Recipe&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.targetStain, _this.targetStain) || other.targetStain == _this.targetStain)&&const DeepCollectionEquality().equals(other.ingredients, _this.ingredients)&&const DeepCollectionEquality().equals(other.instructions, _this.instructions)&&(identical(other.usage, _this.usage) || other.usage == _this.usage)&&(identical(other.cautions, _this.cautions) || other.cautions == _this.cautions)&&(identical(other.isPremium, _this.isPremium) || other.isPremium == _this.isPremium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as Recipe;
  return Object.hash(runtimeType,_this.id,_this.name,_this.targetStain,const DeepCollectionEquality().hash(_this.ingredients),const DeepCollectionEquality().hash(_this.instructions),_this.usage,_this.cautions,_this.isPremium);
}

@override
String toString() {
  final _this = this as Recipe;
  return 'Recipe(id: ${_this.id}, name: ${_this.name}, targetStain: ${_this.targetStain}, ingredients: ${_this.ingredients}, instructions: ${_this.instructions}, usage: ${_this.usage}, cautions: ${_this.cautions}, isPremium: ${_this.isPremium})';
}


}

/// @nodoc
abstract mixin class $RecipeCopyWith<$Res>  {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) _then) = _$RecipeCopyWithImpl;
@useResult
$Res call({
 String id, String name, String targetStain, List<String> ingredients, List<String> instructions, String usage, String? cautions, bool isPremium
});




}
/// @nodoc
class _$RecipeCopyWithImpl<$Res>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._self, this._then);

  final Recipe _self;
  final $Res Function(Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? targetStain = null,Object? ingredients = null,Object? instructions = null,Object? usage = null,Object? cautions = freezed,Object? isPremium = null,}) {
  return _then(Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,targetStain: null == targetStain ? _self.targetStain : targetStain // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as String,cautions: freezed == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Recipe].
extension RecipePatterns on Recipe {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Recipe value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Recipe value)  $default,){
final _that = this;
switch (_that) {
case _Recipe():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Recipe value)?  $default,){
final _that = this;
switch (_that) {
case _Recipe() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String targetStain,  List<String> ingredients,  List<String> instructions,  String usage,  String? cautions,  bool isPremium)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.name,_that.targetStain,_that.ingredients,_that.instructions,_that.usage,_that.cautions,_that.isPremium);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String targetStain,  List<String> ingredients,  List<String> instructions,  String usage,  String? cautions,  bool isPremium)  $default,) {final _that = this;
switch (_that) {
case _Recipe():
return $default(_that.id,_that.name,_that.targetStain,_that.ingredients,_that.instructions,_that.usage,_that.cautions,_that.isPremium);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String targetStain,  List<String> ingredients,  List<String> instructions,  String usage,  String? cautions,  bool isPremium)?  $default,) {final _that = this;
switch (_that) {
case _Recipe() when $default != null:
return $default(_that.id,_that.name,_that.targetStain,_that.ingredients,_that.instructions,_that.usage,_that.cautions,_that.isPremium);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Recipe implements Recipe {
  const _Recipe({required this.id, required this.name, required this.targetStain, required  List<String> ingredients, required  List<String> instructions, required this.usage, this.cautions, this.isPremium = false}): _ingredients = ingredients,_instructions = instructions;
  factory _Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

@override final  String id;
@override final  String name;
@override final  String targetStain;
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

@override final  String usage;
@override final  String? cautions;
@override@JsonKey() final  bool isPremium;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RecipeCopyWith<_Recipe> get copyWith => __$RecipeCopyWithImpl<_Recipe>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RecipeToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _Recipe&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.targetStain, targetStain) || other.targetStain == targetStain)&&const DeepCollectionEquality().equals(other.ingredients, _ingredients)&&const DeepCollectionEquality().equals(other.instructions, _instructions)&&(identical(other.usage, usage) || other.usage == usage)&&(identical(other.cautions, cautions) || other.cautions == cautions)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,targetStain,const DeepCollectionEquality().hash(_ingredients),const DeepCollectionEquality().hash(_instructions),usage,cautions,isPremium);
}

@override
String toString() {
    return 'Recipe(id: $id, name: $name, targetStain: $targetStain, ingredients: $ingredients, instructions: $instructions, usage: $usage, cautions: $cautions, isPremium: $isPremium)';
}


}

/// @nodoc
abstract mixin class _$RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$RecipeCopyWith(_Recipe value, $Res Function(_Recipe) _then) = __$RecipeCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String targetStain, List<String> ingredients, List<String> instructions, String usage, String? cautions, bool isPremium
});




}
/// @nodoc
class __$RecipeCopyWithImpl<$Res>
    implements _$RecipeCopyWith<$Res> {
  __$RecipeCopyWithImpl(this._self, this._then);

  final _Recipe _self;
  final $Res Function(_Recipe) _then;

/// Create a copy of Recipe
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? targetStain = null,Object? ingredients = null,Object? instructions = null,Object? usage = null,Object? cautions = freezed,Object? isPremium = null,}) {
  return _then(_Recipe(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,targetStain: null == targetStain ? _self.targetStain : targetStain // ignore: cast_nullable_to_non_nullable
as String,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<String>,instructions: null == instructions ? _self._instructions : instructions // ignore: cast_nullable_to_non_nullable
as List<String>,usage: null == usage ? _self.usage : usage // ignore: cast_nullable_to_non_nullable
as String,cautions: freezed == cautions ? _self.cautions : cautions // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
