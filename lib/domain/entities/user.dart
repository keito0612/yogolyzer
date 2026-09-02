import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// 認証プロバイダー
enum AuthProvider {
  @JsonValue('apple')
  apple,
  @JsonValue('google')
  google,
}

/// ユーザーエンティティ
@freezed
abstract class User with _$User {
  const factory User({
    required String id,
    required String email,
    required AuthProvider provider,
    required String providerId,
    @Default(false) bool isPremium,
    DateTime? premiumExpiresAt,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
