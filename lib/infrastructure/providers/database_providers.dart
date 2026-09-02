import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/local/database.dart';
import '../datasources/local/daos/daos.dart';

/// アプリデータベースのProvider
final appDatabaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(() => db.close());
  return db;
});

/// DiagnosisHistoryDao Provider
final diagnosisHistoryDaoProvider = Provider<DiagnosisHistoryDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return DiagnosisHistoryDao(db);
});

/// SettingsDao Provider
final settingsDaoProvider = Provider<SettingsDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return SettingsDao(db);
});

/// DetergentsDao Provider
final detergentsDaoProvider = Provider<DetergentsDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return DetergentsDao(db);
});

/// RecipesDao Provider
final recipesDaoProvider = Provider<RecipesDao>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return RecipesDao(db);
});
