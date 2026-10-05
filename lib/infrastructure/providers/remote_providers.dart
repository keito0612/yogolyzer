import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../datasources/remote/api_client.dart';
import '../datasources/remote/auth_remote_data_source.dart';
import '../datasources/remote/backup_remote_data_source.dart';
import '../datasources/remote/diagnosis_remote_data_source.dart';
import '../datasources/remote/subscription_remote_data_source.dart';
import '../external/token_storage.dart';

/// TokenStorage Provider
final tokenStorageProvider = Provider<ITokenStorage>((ref) {
  return TokenStorageImpl();
});

/// Dio Provider
final dioProvider = Provider<Dio>((ref) {
  final tokenStorage = ref.watch(tokenStorageProvider);
  return ApiClient.create(tokenStorage);
});

/// AuthRemoteDataSource Provider
final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteDataSource(dio);
});

/// DiagnosisRemoteDataSource Provider
final diagnosisRemoteDataSourceProvider =
    Provider<DiagnosisRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return DiagnosisRemoteDataSource(dio);
});

/// SubscriptionRemoteDataSource Provider
final subscriptionRemoteDataSourceProvider =
    Provider<SubscriptionRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return SubscriptionRemoteDataSource(dio);
});

/// BackupRemoteDataSource Provider
final backupRemoteDataSourceProvider =
    Provider<BackupRemoteDataSource>((ref) {
  final dio = ref.watch(dioProvider);
  return BackupRemoteDataSource(dio);
});
