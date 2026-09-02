// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detergent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Detergent _$DetergentFromJson(Map<String, dynamic> json) => _Detergent(
  id: json['id'] as String,
  name: json['name'] as String,
  brand: json['brand'] as String,
  type: $enumDecode(_$DetergentTypeEnumMap, json['type']),
  targetStains: (json['targetStains'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  targetMaterials: (json['targetMaterials'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  cautions: json['cautions'] as String?,
  purchaseUrl: json['purchaseUrl'] as String?,
);

Map<String, dynamic> _$DetergentToJson(_Detergent instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'brand': instance.brand,
      'type': _$DetergentTypeEnumMap[instance.type]!,
      'targetStains': instance.targetStains,
      'targetMaterials': instance.targetMaterials,
      'cautions': instance.cautions,
      'purchaseUrl': instance.purchaseUrl,
    };

const _$DetergentTypeEnumMap = {
  DetergentType.alkaline: 'alkaline',
  DetergentType.acidic: 'acidic',
  DetergentType.neutral: 'neutral',
};
