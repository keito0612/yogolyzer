import 'package:freezed_annotation/freezed_annotation.dart';

part 'diagnosis.freezed.dart';
part 'diagnosis.g.dart';

/// 診断結果エンティティ
@freezed
abstract class Diagnosis with _$Diagnosis {
  const factory Diagnosis({
    required String id,
    String? cloudId,
    required String imagePath,
    required String location,
    required String material,
    required String stainType,
    required double confidence,
    required List<RecommendedDetergent> recommendedDetergents,
    DiyRecipe? diyRecipe,
    required List<String> cleaningSteps,
    required List<String> cautions,
    @Default(false) bool isSynced,
    required DateTime createdAt,
  }) = _Diagnosis;

  factory Diagnosis.fromJson(Map<String, dynamic> json) =>
      _$DiagnosisFromJson(json);
}

/// おすすめ洗剤（診断結果に含まれる）
@freezed
abstract class RecommendedDetergent with _$RecommendedDetergent {
  const factory RecommendedDetergent({
    required String name,
    required String brand,
    required String reason,
  }) = _RecommendedDetergent;

  factory RecommendedDetergent.fromJson(Map<String, dynamic> json) =>
      _$RecommendedDetergentFromJson(json);
}

/// 自作レシピ（診断結果に含まれる簡易版）
@freezed
abstract class DiyRecipe with _$DiyRecipe {
  const factory DiyRecipe({
    required String name,
    required List<String> ingredients,
    required List<String> instructions,
    @Default('') String usage,
    @Default([]) List<String> cautions,
  }) = _DiyRecipe;

  factory DiyRecipe.fromJson(Map<String, dynamic> json) =>
      _$DiyRecipeFromJson(json);
}
