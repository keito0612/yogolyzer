import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import 'tables/tables.dart';

part 'database.g.dart';

/// アプリケーションデータベース
@DriftDatabase(
  tables: [
    DiagnosisHistoryTable,
    SettingsTable,
    CachedDetergentsTable,
    CachedRecipesTable,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// テスト用コンストラクタ
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // 将来のマイグレーション用
      },
    );
  }
}

/// データベース接続を開く
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'yogolyzer.db'));
    return NativeDatabase.createInBackground(file);
  });
}

/// データベースプロバイダー
final databaseProvider = Provider<AppDatabase>((ref) {
  final database = AppDatabase();
  ref.onDispose(() => database.close());
  return database;
});
