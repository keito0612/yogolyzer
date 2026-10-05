import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uuid/uuid.dart';

import '../../../domain/entities/diagnosis.dart';
import 'api_endpoints.dart';
import 'api_exception.dart';

/// 診断API用リモートデータソース
class DiagnosisRemoteDataSource {
  DiagnosisRemoteDataSource(this._dio);

  final Dio _dio;

  /// AI診断を実行
  Future<Diagnosis> analyze({
    required String imagePath,
    required String location,
    required String material,
    required String deviceId,
  }) async {
    try {
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imagePath,
          filename: 'diagnosis_image.jpg',
        ),
        'location': location,
        'material': material,
      });

      final response = await _dio.post<Map<String, dynamic>>(
        ApiEndpoints.diagnosisAnalyze,
        data: formData,
        options: Options(
          contentType: 'multipart/form-data',
          receiveTimeout: const Duration(seconds: 120), // AI処理は時間がかかる
          headers: {'X-Device-ID': deviceId},
        ),
      );

      if (response.data == null) {
        throw const UnknownApiException('レスポンスが空です');
      }

      // レスポンスは {success: true, data: {...}} の形式
      final responseData = response.data!;
      final diagnosisData = responseData['data'] as Map<String, dynamic>?;

      if (diagnosisData == null) {
        throw const UnknownApiException('診断データが空です');
      }

      return _mapToDiagnosis(diagnosisData, imagePath, location, material);
    } on DioException catch (e) {
      throw e.error as ApiException? ?? const UnknownApiException();
    } on FileSystemException catch (e) {
      throw const ValidationException('画像ファイルが見つかりません');
    } catch (e) {
      rethrow;
    }
  }

  /// APIレスポンスをDiagnosisエンティティに変換
  Diagnosis _mapToDiagnosis(
    Map<String, dynamic> data,
    String imagePath,
    String location,
    String material,
  ) {
    final recommendedDetergents =
        (data['recommended_detergents'] as List<dynamic>?)
            ?.map(
              (e) => RecommendedDetergent.fromJson(e as Map<String, dynamic>),
            )
            .toList() ??
        [];

    DiyRecipe? diyRecipe;
    if (data['diy_recipe'] != null) {
      diyRecipe = DiyRecipe.fromJson(
        data['diy_recipe'] as Map<String, dynamic>,
      );
    }

    final cleaningSteps =
        (data['cleaning_steps'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    final cautions =
        (data['cautions'] as List<dynamic>?)
            ?.map((e) => e.toString())
            .toList() ??
        [];

    // バックエンドがIDを返さない場合はUUIDを生成
    final id = data['id'] as String? ?? const Uuid().v4();

    return Diagnosis(
      id: id,
      cloudId: data['id'] as String?,
      imagePath: imagePath,
      location: location,
      material: material,
      stainType: data['stain_type'] as String,
      confidence: (data['confidence'] as num).toDouble(),
      recommendedDetergents: recommendedDetergents,
      diyRecipe: diyRecipe,
      cleaningSteps: cleaningSteps,
      cautions: cautions,
      isSynced: data['id'] != null, // IDがある場合は同期済み
      createdAt: DateTime.now(),
    );
  }
}
