import 'dart:io';
import 'dart:io' as io;

import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../../infrastructure/datasources/remote/backup_remote_data_source.dart';

/// バックアップサービス
class BackupService {
  BackupService({
    required BackupRemoteDataSource backupRemoteDataSource,
  }) : _backupRemoteDataSource = backupRemoteDataSource;

  final BackupRemoteDataSource _backupRemoteDataSource;

  /// データベースをバックアップ
  Future<BackupResult> backup() async {
    // データベースファイルのパスを取得
    final dbFile = await _getDatabaseFile();
    if (!await dbFile.exists()) {
      throw Exception('データベースファイルが見つかりません');
    }

    // gzip圧縮
    final compressedFile = await _compressDatabase(dbFile);

    try {
      // アップロード
      final result = await _backupRemoteDataSource.uploadBackup(compressedFile);
      return result;
    } finally {
      // 一時ファイルを削除
      if (await compressedFile.exists()) {
        await compressedFile.delete();
      }
    }
  }

  /// バックアップを復元
  Future<void> restore() async {
    // バックアップをダウンロード
    final compressedFile = await _backupRemoteDataSource.downloadBackup();

    try {
      // 解凍
      final restoredDbFile = await _decompressDatabase(compressedFile);

      // 現在のデータベースを置き換え
      final currentDbFile = await _getDatabaseFile();

      // バックアップを作成
      final backupPath = '${currentDbFile.path}.backup';
      if (await currentDbFile.exists()) {
        await currentDbFile.copy(backupPath);
      }

      try {
        // データベースを置き換え
        await restoredDbFile.copy(currentDbFile.path);
        await restoredDbFile.delete();

        // バックアップを削除
        final backupFile = File(backupPath);
        if (await backupFile.exists()) {
          await backupFile.delete();
        }
      } catch (e) {
        // 失敗時はバックアップから復元
        final backupFile = File(backupPath);
        if (await backupFile.exists()) {
          await backupFile.copy(currentDbFile.path);
          await backupFile.delete();
        }
        rethrow;
      }
    } finally {
      // 一時ファイルを削除
      if (await compressedFile.exists()) {
        await compressedFile.delete();
      }
    }
  }

  /// バックアップステータスを取得
  Future<BackupStatus> getBackupStatus() async {
    return _backupRemoteDataSource.getBackupStatus();
  }

  /// データベースファイルのパスを取得
  Future<File> _getDatabaseFile() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbPath = path.join(appDir.path, 'yogolyzer.db');
    return File(dbPath);
  }

  /// データベースをgzip圧縮
  Future<File> _compressDatabase(File dbFile) async {
    final tempDir = await getTemporaryDirectory();
    final compressedPath = path.join(tempDir.path, 'backup.db.gz');
    final compressedFile = File(compressedPath);

    final bytes = await dbFile.readAsBytes();
    final compressed = io.gzip.encode(bytes);
    await compressedFile.writeAsBytes(compressed);

    return compressedFile;
  }

  /// gzip圧縮されたデータベースを解凍
  Future<File> _decompressDatabase(File compressedFile) async {
    final tempDir = await getTemporaryDirectory();
    final decompressedPath = path.join(tempDir.path, 'restored.db');
    final decompressedFile = File(decompressedPath);

    final compressedBytes = await compressedFile.readAsBytes();
    final decompressed = io.gzip.decode(compressedBytes);
    await decompressedFile.writeAsBytes(decompressed);

    return decompressedFile;
  }
}
