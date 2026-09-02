import 'dart:convert';

import 'package:drift/drift.dart';

import '../../domain/entities/diagnosis.dart';
import '../../domain/repositories/i_diagnosis_repository.dart';
import '../datasources/local/database.dart';
import '../datasources/local/daos/diagnosis_history_dao.dart';

/// 診断リポジトリの実装
class DiagnosisRepositoryImpl implements IDiagnosisRepository {
  DiagnosisRepositoryImpl(this._dao);

  final DiagnosisHistoryDao _dao;

  @override
  Future<List<Diagnosis>> getAll() async {
    final records = await _dao.getAll();
    return records.map(_toDomain).toList();
  }

  @override
  Future<Diagnosis?> getById(String id) async {
    final record = await _dao.getById(id);
    return record != null ? _toDomain(record) : null;
  }

  @override
  Future<List<Diagnosis>> getUnsynced() async {
    final records = await _dao.getUnsynced();
    return records.map(_toDomain).toList();
  }

  @override
  Future<int> getCount() {
    return _dao.getCount();
  }

  @override
  Future<void> save(Diagnosis diagnosis) async {
    final companion = DiagnosisHistoryTableCompanion(
      id: Value(diagnosis.id),
      cloudId: Value(diagnosis.cloudId),
      imagePath: Value(diagnosis.imagePath),
      location: Value(diagnosis.location),
      material: Value(diagnosis.material),
      stainType: Value(diagnosis.stainType),
      diagnosisResult: Value(_toJson(diagnosis)),
      isSynced: Value(diagnosis.isSynced),
      createdAt: Value(diagnosis.createdAt),
    );
    await _dao.insert(companion);
  }

  @override
  Future<void> markAsSynced(String id, String cloudId) {
    return _dao.markAsSynced(id, cloudId);
  }

  @override
  Future<void> deleteById(String id) async {
    await _dao.deleteById(id);
  }

  @override
  Future<void> deleteAll() async {
    await _dao.deleteAll();
  }

  @override
  Stream<List<Diagnosis>> watchAll() {
    return _dao.watchAll().map((records) => records.map(_toDomain).toList());
  }

  /// DBレコードからドメインエンティティへ変換
  Diagnosis _toDomain(DiagnosisHistoryTableData record) {
    final resultJson = jsonDecode(record.diagnosisResult) as Map<String, dynamic>;

    return Diagnosis(
      id: record.id,
      cloudId: record.cloudId,
      imagePath: record.imagePath,
      location: record.location,
      material: record.material,
      stainType: record.stainType,
      confidence: (resultJson['confidence'] as num?)?.toDouble() ?? 0.0,
      recommendedDetergents: (resultJson['recommendedDetergents'] as List<dynamic>?)
              ?.map((e) => RecommendedDetergent.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      diyRecipe: resultJson['diyRecipe'] != null
          ? DiyRecipe.fromJson(resultJson['diyRecipe'] as Map<String, dynamic>)
          : null,
      cleaningSteps: (resultJson['cleaningSteps'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      cautions: (resultJson['cautions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      isSynced: record.isSynced,
      createdAt: record.createdAt,
    );
  }

  /// ドメインエンティティからJSON文字列へ変換（DB保存用）
  String _toJson(Diagnosis diagnosis) {
    return jsonEncode({
      'confidence': diagnosis.confidence,
      'recommendedDetergents':
          diagnosis.recommendedDetergents.map((e) => e.toJson()).toList(),
      'diyRecipe': diagnosis.diyRecipe?.toJson(),
      'cleaningSteps': diagnosis.cleaningSteps,
      'cautions': diagnosis.cautions,
    });
  }
}
