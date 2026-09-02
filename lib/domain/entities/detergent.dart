import 'package:freezed_annotation/freezed_annotation.dart';

part 'detergent.freezed.dart';
part 'detergent.g.dart';

/// 洗剤の種類
enum DetergentType {
  @JsonValue('alkaline')
  alkaline, // アルカリ性
  @JsonValue('acidic')
  acidic, // 酸性
  @JsonValue('neutral')
  neutral, // 中性
}

/// 洗剤エンティティ
@freezed
abstract class Detergent with _$Detergent {
  const factory Detergent({
    required String id,
    required String name,
    required String brand,
    required DetergentType type,
    required List<String> targetStains,
    required List<String> targetMaterials,
    String? cautions,
    String? purchaseUrl,
  }) = _Detergent;

  factory Detergent.fromJson(Map<String, dynamic> json) =>
      _$DetergentFromJson(json);
}
