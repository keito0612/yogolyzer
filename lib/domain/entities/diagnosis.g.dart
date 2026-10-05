// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diagnosis.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Diagnosis _$DiagnosisFromJson(Map<String, dynamic> json) => _Diagnosis(
  id: json['id'] as String,
  cloudId: json['cloudId'] as String?,
  imagePath: json['imagePath'] as String,
  location: json['location'] as String,
  material: json['material'] as String,
  stainType: json['stainType'] as String,
  confidence: (json['confidence'] as num).toDouble(),
  recommendedDetergents: (json['recommendedDetergents'] as List<dynamic>)
      .map((e) => RecommendedDetergent.fromJson(e as Map<String, dynamic>))
      .toList(),
  diyRecipe: json['diyRecipe'] == null
      ? null
      : DiyRecipe.fromJson(json['diyRecipe'] as Map<String, dynamic>),
  cleaningSteps: (json['cleaningSteps'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  cautions: (json['cautions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  isSynced: json['isSynced'] as bool? ?? false,
  createdAt: DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$DiagnosisToJson(_Diagnosis instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cloudId': instance.cloudId,
      'imagePath': instance.imagePath,
      'location': instance.location,
      'material': instance.material,
      'stainType': instance.stainType,
      'confidence': instance.confidence,
      'recommendedDetergents': instance.recommendedDetergents,
      'diyRecipe': instance.diyRecipe,
      'cleaningSteps': instance.cleaningSteps,
      'cautions': instance.cautions,
      'isSynced': instance.isSynced,
      'createdAt': instance.createdAt.toIso8601String(),
    };

_RecommendedDetergent _$RecommendedDetergentFromJson(
  Map<String, dynamic> json,
) => _RecommendedDetergent(
  name: json['name'] as String,
  brand: json['brand'] as String,
  reason: json['reason'] as String,
);

Map<String, dynamic> _$RecommendedDetergentToJson(
  _RecommendedDetergent instance,
) => <String, dynamic>{
  'name': instance.name,
  'brand': instance.brand,
  'reason': instance.reason,
};

_DiyRecipe _$DiyRecipeFromJson(Map<String, dynamic> json) => _DiyRecipe(
  name: json['name'] as String,
  ingredients: (json['ingredients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  instructions: (json['instructions'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  usage: json['usage'] as String? ?? '',
  cautions:
      (json['cautions'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
);

Map<String, dynamic> _$DiyRecipeToJson(_DiyRecipe instance) =>
    <String, dynamic>{
      'name': instance.name,
      'ingredients': instance.ingredients,
      'instructions': instance.instructions,
      'usage': instance.usage,
      'cautions': instance.cautions,
    };
