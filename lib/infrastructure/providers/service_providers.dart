import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../application/services/auth_service.dart';
import '../../application/services/backup_service.dart';
import '../../application/services/diagnosis_service.dart';
import '../../application/services/subscription_service.dart';
import 'remote_providers.dart';
import 'repository_providers.dart';

/// AuthService Provider
final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(
    authRemoteDataSource: ref.watch(authRemoteDataSourceProvider),
    settingsRepository: ref.watch(settingsRepositoryProvider),
    tokenStorage: ref.watch(tokenStorageProvider),
  );
});

/// DiagnosisService Provider
final diagnosisServiceProvider = Provider<DiagnosisService>((ref) {
  return DiagnosisService(
    diagnosisRemoteDataSource: ref.watch(diagnosisRemoteDataSourceProvider),
    diagnosisRepository: ref.watch(diagnosisRepositoryProvider),
    settingsRepository: ref.watch(settingsRepositoryProvider),
  );
});

/// SubscriptionService Provider
final subscriptionServiceProvider = Provider<SubscriptionService>((ref) {
  return SubscriptionService(
    subscriptionRemoteDataSource: ref.watch(subscriptionRemoteDataSourceProvider),
    settingsRepository: ref.watch(settingsRepositoryProvider),
  );
});

/// BackupService Provider
final backupServiceProvider = Provider<BackupService>((ref) {
  return BackupService(
    backupRemoteDataSource: ref.watch(backupRemoteDataSourceProvider),
  );
});
