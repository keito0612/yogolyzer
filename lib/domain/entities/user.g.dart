// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_User _$UserFromJson(Map<String, dynamic> json) => _User(
  id: json['id'] as String,
  email: json['email'] as String,
  provider: $enumDecode(_$AuthProviderEnumMap, json['provider']),
  providerId: json['providerId'] as String,
  isPremium: json['isPremium'] as bool? ?? false,
  premiumExpiresAt: json['premiumExpiresAt'] == null
      ? null
      : DateTime.parse(json['premiumExpiresAt'] as String),
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$UserToJson(_User instance) => <String, dynamic>{
  'id': instance.id,
  'email': instance.email,
  'provider': _$AuthProviderEnumMap[instance.provider]!,
  'providerId': instance.providerId,
  'isPremium': instance.isPremium,
  'premiumExpiresAt': instance.premiumExpiresAt?.toIso8601String(),
  'createdAt': instance.createdAt.toIso8601String(),
  'updatedAt': instance.updatedAt.toIso8601String(),
};

const _$AuthProviderEnumMap = {
  AuthProvider.apple: 'apple',
  AuthProvider.google: 'google',
};
