import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

import 'api_endpoints.dart';
import 'api_exception.dart';

/// バックアップ結果
class BackupResult {
  BackupResult({
    required this.backedUpAt,
    required this.fileSize,
  });

  final DateTime backedUpAt;
  final int fileSize;

  factory BackupResult.fromJson(Map<String, dynamic> json) {
    return BackupResult(
      backedUpAt: DateTime.parse(json['backed_up_at'] as String),
      fileSize: json['file_size'] as int,
    );
  }
}

/// バックアップステータス
class BackupStatus {
  BackupStatus({
    this.lastBackupAt,
    this.hasBackup = false,
    this.fileSize,
  });

  final DateTime? lastBackupAt;
  final bool hasBackup;
  final int? fileSize;

  factory BackupStatus.fromJson(Map<String, dynamic> json) {
    return BackupStatus(
      lastBackupAt: json['last_backup_at'] != null
          ? DateTime.parse(json['last_backup_at'] as String)
          : null,
      hasBackup: json['has_backup'] as bool? ?? false,
      fileSize: json['file_size'] as int?,
    );
  }
}

/// バックアップAPI用リモートデータソース
class BackupRemoteDataSource {
  BackupRemoteDataSource(this._dio);

  final Dio _dio;

  /// SQLiteファイルをアップロード
  Future<BackupResult> uploadBackup(File sqliteFile) async {
    try {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(
          sqliteFile.path,
          filename: 'backup.db.gz',
        ),
      });

      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.backupUpload,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          sendTimeout: const Duration(minutes: 5),
          receiveTimeout: const Duration(minutes: 5),
        ),
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      return BackupResult.fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }

  /// バックアップをダウンロード
  Future<File> downloadBackup() async {
    try {
      final response = await _dio.get<List<int>>(
        ApiEndpoints.backupDownload,
        options: Options(
          responseType: ResponseType.bytes,
          receiveTimeout: const Duration(minutes: 5),
        ),
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      // 一時ファイルとして保存
      final tempDir = await getTemporaryDirectory();
      final tempFile = File('${tempDir.path}/restore_backup.db.gz');
      await tempFile.writeAsBytes(Uint8List.fromList(response.data!));

      return tempFile;
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }

  /// バックアップステータスを取得
  Future<BackupStatus> getBackupStatus() async {
    try {
      final response = await _dio.get<Map<String, dynamic>>(
        ApiEndpoints.backupStatus,
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      return BackupStatus.fromJson(response.data!);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    }
  }
}
