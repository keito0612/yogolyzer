import 'package:drift/drift.dart';

import '../database.dart';
import '../tables/settings_table.dart';

part 'settings_dao.g.dart';

/// 設定DAO
@DriftAccessor(tables: [SettingsTable])
class SettingsDao extends DatabaseAccessor<AppDatabase>
    with _$SettingsDaoMixin {
  SettingsDao(super.db);

  /// 設定を取得（id=1固定）
  Future<SettingsTableData?> getSettings() {
    return (select(settingsTable)..where((t) => t.id.equals(1)))
        .getSingleOrNull();
  }

  /// 設定を保存（upsert）
  Future<void> saveSettings(SettingsTableCompanion entry) {
    return into(settingsTable).insertOnConflictUpdate(
      entry.copyWith(id: const Value(1)),
    );
  }

  /// デバイスIDを更新
  Future<void> updateDeviceId(String deviceId) async {
    await (update(settingsTable)..where((t) => t.id.equals(1))).write(
      SettingsTableCompanion(
        deviceId: Value(deviceId),
      ),
    );
  }

  /// ログイン状態を更新
  Future<void> updateLoginState({
    required bool isLoggedIn,
    String? userId,
  }) async {
    await (update(settingsTable)..where((t) => t.id.equals(1))).write(
      SettingsTableCompanion(
        isLoggedIn: Value(isLoggedIn),
        userId: Value(userId),
      ),
    );
  }

  /// プレミアム状態を更新
  Future<void> updatePremiumState(bool isPremium) async {
    await (update(settingsTable)..where((t) => t.id.equals(1))).write(
      SettingsTableCompanion(
        isPremium: Value(isPremium),
      ),
    );
  }

  /// 診断回数を更新
  Future<void> updateDiagnosisCount(int count, DateTime date) async {
    await (update(settingsTable)..where((t) => t.id.equals(1))).write(
      SettingsTableCompanion(
        dailyDiagnosisCount: Value(count),
        lastDiagnosisDate: Value(date),
      ),
    );
  }

  /// 診断回数をインクリメント
  Future<void> incrementDiagnosisCount() async {
    final settings = await getSettings();
    final today = DateTime.now();
    final todayDate = DateTime(today.year, today.month, today.day);

    int newCount;
    if (settings?.lastDiagnosisDate != null) {
      final lastDate = settings!.lastDiagnosisDate!;
      final lastDateOnly = DateTime(lastDate.year, lastDate.month, lastDate.day);
      if (lastDateOnly == todayDate) {
        newCount = settings.dailyDiagnosisCount + 1;
      } else {
        newCount = 1;
      }
    } else {
      newCount = 1;
    }

    await updateDiagnosisCount(newCount, today);
  }

  /// 設定を監視
  Stream<SettingsTableData?> watchSettings() {
    return (select(settingsTable)..where((t) => t.id.equals(1)))
        .watchSingleOrNull();
  }
}
