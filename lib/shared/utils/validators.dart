import 'dart:io';

/// バリデーション結果
class ValidationResult {
  const ValidationResult.valid()
      : isValid = true,
        errorMessage = null;

  const ValidationResult.invalid(this.errorMessage) : isValid = false;

  final bool isValid;
  final String? errorMessage;
}

/// バリデーションユーティリティ
class Validators {
  Validators._();

  // ═══════════════════════════════════════════════
  // テキストバリデーション
  // ═══════════════════════════════════════════════

  /// 場所名のバリデーション
  static ValidationResult validateLocationName(String text) {
    final trimmed = text.trim();

    if (trimmed.isEmpty) {
      return const ValidationResult.invalid('場所を入力してください');
    }

    if (trimmed.length < 2) {
      return const ValidationResult.invalid('2文字以上で入力してください');
    }

    if (trimmed.length > 30) {
      return const ValidationResult.invalid('30文字以内で入力してください');
    }

    // 禁止文字チェック（制御文字など）
    if (RegExp(r'[\x00-\x1F\x7F]').hasMatch(trimmed)) {
      return const ValidationResult.invalid('使用できない文字が含まれています');
    }

    return const ValidationResult.valid();
  }

  // ═══════════════════════════════════════════════
  // 画像バリデーション
  // ═══════════════════════════════════════════════

  /// 画像ファイルの最大サイズ（10MB）
  static const int maxImageSizeBytes = 10 * 1024 * 1024;

  /// 許可される画像形式
  static const List<String> allowedImageExtensions = [
    '.jpg',
    '.jpeg',
    '.png',
    '.heic',
    '.heif',
  ];

  /// 画像パスのバリデーション
  static ValidationResult validateImagePath(String? imagePath) {
    if (imagePath == null || imagePath.isEmpty) {
      return const ValidationResult.invalid('画像を選択してください');
    }

    final file = File(imagePath);

    if (!file.existsSync()) {
      return const ValidationResult.invalid('画像ファイルが見つかりません');
    }

    return const ValidationResult.valid();
  }

  /// 画像ファイルのバリデーション（ファイル形式・サイズ）
  static Future<ValidationResult> validateImageFile(String imagePath) async {
    // パスの基本チェック
    final pathResult = validateImagePath(imagePath);
    if (!pathResult.isValid) {
      return pathResult;
    }

    final file = File(imagePath);

    // 拡張子チェック
    final extension = imagePath.toLowerCase().split('.').last;
    final hasValidExtension = allowedImageExtensions.any(
      (ext) => ext.substring(1) == extension,
    );
    if (!hasValidExtension) {
      return ValidationResult.invalid(
        '対応していない画像形式です（${allowedImageExtensions.join(", ")}）',
      );
    }

    // ファイルサイズチェック
    try {
      final fileSize = await file.length();
      if (fileSize > maxImageSizeBytes) {
        final maxSizeMB = maxImageSizeBytes / (1024 * 1024);
        return ValidationResult.invalid(
          '画像サイズが大きすぎます（${maxSizeMB.toInt()}MB以下）',
        );
      }
    } catch (e) {
      return const ValidationResult.invalid('画像ファイルを読み込めません');
    }

    return const ValidationResult.valid();
  }

  // ═══════════════════════════════════════════════
  // 診断リクエストバリデーション
  // ═══════════════════════════════════════════════

  /// 診断リクエストのバリデーション
  static Future<ValidationResult> validateDiagnosisRequest({
    required String? imagePath,
    required String? location,
    required String? material,
  }) async {
    // 画像チェック
    if (imagePath == null || imagePath.isEmpty) {
      return const ValidationResult.invalid('画像を撮影してください');
    }

    final imageResult = await validateImageFile(imagePath);
    if (!imageResult.isValid) {
      return imageResult;
    }

    // 場所チェック
    if (location == null || location.isEmpty) {
      return const ValidationResult.invalid('場所を選択してください');
    }

    // 素材チェック
    if (material == null || material.isEmpty) {
      return const ValidationResult.invalid('素材を選択してください');
    }

    return const ValidationResult.valid();
  }

  // ═══════════════════════════════════════════════
  // API共通バリデーション
  // ═══════════════════════════════════════════════

  /// 必須文字列のバリデーション
  static ValidationResult validateRequired(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return ValidationResult.invalid('$fieldNameを入力してください');
    }
    return const ValidationResult.valid();
  }

  /// トークンのバリデーション
  static ValidationResult validateToken(String? token) {
    if (token == null || token.isEmpty) {
      return const ValidationResult.invalid('認証情報がありません');
    }

    // JWTの基本形式チェック（3つのパートがドットで区切られている）
    final parts = token.split('.');
    if (parts.length != 3) {
      return const ValidationResult.invalid('認証情報が不正です');
    }

    return const ValidationResult.valid();
  }
}
