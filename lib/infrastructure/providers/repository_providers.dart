import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/repositories/repositories.dart';
import '../repositories/repositories.dart';
import 'database_providers.dart';

/// DiagnosisRepository Provider
final diagnosisRepositoryProvider = Provider<IDiagnosisRepository>((ref) {
  final dao = ref.watch(diagnosisHistoryDaoProvider);
  return DiagnosisRepositoryImpl(dao);
});

/// SettingsRepository Provider
final settingsRepositoryProvider = Provider<ISettingsRepository>((ref) {
  final dao = ref.watch(settingsDaoProvider);
  return SettingsRepositoryImpl(dao);
});

/// DetergentRepository Provider
final detergentRepositoryProvider = Provider<IDetergentRepository>((ref) {
  final detergentsDao = ref.watch(detergentsDaoProvider);
  final recipesDao = ref.watch(recipesDaoProvider);
  return DetergentRepositoryImpl(detergentsDao, recipesDao);
});
