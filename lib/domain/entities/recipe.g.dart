// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Recipe _$RecipeFromJson(Map<String, dynamic> json) => _Recipe(
  id: json['id'] as String,
  name: json['name'] as String,
  targetStain: json['targetStain'] as String,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  instructions: (json['instructions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  usage: json['usage'] as String,
  cautions: json['cautions'] as String?,
  isPremium: json['isPremium'] as bool? ?? false,
);

Map<String, dynamic> _$RecipeToJson(_Recipe instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'targetStain': instance.targetStain,
  'ingredients': instance.ingredients,
  'instructions': instance.instructions,
  'usage': instance.usage,
  'cautions': instance.cautions,
  'isPremium': instance.isPremium,
};
