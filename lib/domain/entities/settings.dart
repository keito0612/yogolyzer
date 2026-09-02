import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

/// アプリ設定エンティティ
@freezed
abstract class Settings with _$Settings {
  const factory Settings({
    required String deviceId,
    @Default(false) bool isLoggedIn,
    String? userId,
    @Default(false) bool isPremium,
    @Default(0) int dailyDiagnosisCount,
    DateTime? lastDiagnosisDate,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);
}
