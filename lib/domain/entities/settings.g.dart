// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  deviceId: json['deviceId'] as String,
  isLoggedIn: json['isLoggedIn'] as bool? ?? false,
  userId: json['userId'] as String?,
  isPremium: json['isPremium'] as bool? ?? false,
  dailyDiagnosisCount: (json['dailyDiagnosisCount'] as num?)?.toInt() ?? 0,
  lastDiagnosisDate: json['lastDiagnosisDate'] == null
      ? null
      : DateTime.parse(json['lastDiagnosisDate'] as String),
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'deviceId': instance.deviceId,
  'isLoggedIn': instance.isLoggedIn,
  'userId': instance.userId,
  'isPremium': instance.isPremium,
  'dailyDiagnosisCount': instance.dailyDiagnosisCount,
  'lastDiagnosisDate': instance.lastDiagnosisDate?.toIso8601String(),
};
