import 'package:drift/drift.dart';
import 'package:uuid/uuid.dart';

import '../../domain/entities/settings.dart';
import '../../domain/repositories/i_settings_repository.dart';
import '../datasources/local/daos/settings_dao.dart';
import '../datasources/local/database.dart';

/// 設定リポジトリの実装
class SettingsRepositoryImpl implements ISettingsRepository {
  SettingsRepositoryImpl(this._dao);

  final SettingsDao _dao;
  static const _uuid = Uuid();
  static const _dailyLimit = 3;

  @override
  Future<Settings> getSettings() async {
    final data = await _getOrCreateSettings();
    return Settings(
      deviceId: data.deviceId,
      isLoggedIn: data.isLoggedIn,
      userId: data.userId,
      isPremium: data.isPremium,
      dailyDiagnosisCount: data.dailyDiagnosisCount,
      lastDiagnosisDate: data.lastDiagnosisDate,
    );
  }

  @override
  Future<void> saveSettings(Settings settings) async {
    await _dao.saveSettings(SettingsTableCompanion(
      deviceId: Value(settings.deviceId),
      isLoggedIn: Value(settings.isLoggedIn),
      userId: Value(settings.userId),
      isPremium: Value(settings.isPremium),
      dailyDiagnosisCount: Value(settings.dailyDiagnosisCount),
      lastDiagnosisDate: Value(settings.lastDiagnosisDate),
    ));
  }

  @override
  Future<String> getDeviceId() async {
    final settings = await _getOrCreateSettings();
    return settings.deviceId;
  }

  @override
  Future<bool> isLoggedIn() async {
    final settings = await _getOrCreateSettings();
    return settings.isLoggedIn;
  }

  @override
  Future<void> setLoggedIn(bool value, {String? userId}) async {
    await _dao.updateLoginState(isLoggedIn: value, userId: userId);
  }

  @override
  Future<bool> isPremium() async {
    final settings = await _getOrCreateSettings();
    return settings.isPremium;
  }

  @override
  Future<void> setPremium(bool value) async {
    await _dao.updatePremiumState(value);
  }

  @override
  Future<int> getDailyDiagnosisCount() async {
    await _resetDailyCountIfNeeded();
    final settings = await _getOrCreateSettings();
    return settings.dailyDiagnosisCount;
  }

  @override
  Future<void> incrementDiagnosisCount() async {
    await _dao.incrementDiagnosisCount();
  }

  @override
  Future<bool> canDiagnose() async {
    final settings = await getSettings();
    if (settings.isPremium) return true;

    await _resetDailyCountIfNeeded();
    final count = await getDailyDiagnosisCount();
    return count < _dailyLimit;
  }

  Future<void> _resetDailyCountIfNeeded() async {
    final settings = await _dao.getSettings();
    if (settings == null) return;

    final lastDate = settings.lastDiagnosisDate;
    if (lastDate == null) return;

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final lastDay = DateTime(lastDate.year, lastDate.month, lastDate.day);

    if (today.isAfter(lastDay)) {
      await _dao.updateDiagnosisCount(0, now);
    }
  }

  Future<SettingsTableData> _getOrCreateSettings() async {
    var settings = await _dao.getSettings();
    if (settings == null) {
      final deviceId = _uuid.v4();
      await _dao.saveSettings(SettingsTableCompanion(
        deviceId: Value(deviceId),
      ));
      settings = await _dao.getSettings();
    }
    return settings!;
  }
}
