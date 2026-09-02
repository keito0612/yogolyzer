import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_view_model.freezed.dart';

/// 認証プロバイダーの種類
enum AuthProvider {
  apple,
  google,
}

/// ログイン画面の状態
@freezed
sealed class LoginState with _$LoginState {
  /// 初期状態（待機中）
  const factory LoginState.idle() = LoginStateIdle;

  /// ログイン処理中
  const factory LoginState.loading({
    required AuthProvider provider,
  }) = LoginStateLoading;

  /// ログイン成功
  const factory LoginState.success({
    required String userId,
    required String email,
    required AuthProvider provider,
  }) = LoginStateSuccess;

  /// ログインエラー
  const factory LoginState.error({
    required String message,
  }) = LoginStateError;
}

/// ログイン画面のViewModel
class LoginViewModel extends Notifier<LoginState> {
  @override
  LoginState build() {
    return const LoginState.idle();
  }

  /// Appleでログイン
  Future<bool> signInWithApple() async {
    state = const LoginState.loading(provider: AuthProvider.apple);

    try {
      // TODO: 実際のApple Sign-in処理に置き換える
      await Future.delayed(const Duration(milliseconds: 800));

      if (!ref.mounted) return false;

      // モック: ログイン成功
      state = const LoginState.success(
        userId: 'apple-user-123',
        email: 'user@icloud.com',
        provider: AuthProvider.apple,
      );
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = LoginState.error(message: 'Appleログインに失敗しました: $e');
      return false;
    }
  }

  /// Googleでログイン
  Future<bool> signInWithGoogle() async {
    state = const LoginState.loading(provider: AuthProvider.google);

    try {
      // TODO: 実際のGoogle Sign-in処理に置き換える
      await Future.delayed(const Duration(milliseconds: 800));

      if (!ref.mounted) return false;

      // モック: ログイン成功
      state = const LoginState.success(
        userId: 'google-user-456',
        email: 'user@gmail.com',
        provider: AuthProvider.google,
      );
      return true;
    } catch (e) {
      if (!ref.mounted) return false;
      state = LoginState.error(message: 'Googleログインに失敗しました: $e');
      return false;
    }
  }

  /// エラー状態をリセット
  void resetError() {
    if (state is LoginStateError) {
      state = const LoginState.idle();
    }
  }
}

/// LoginViewModelのプロバイダー
final loginViewModelProvider =
    NotifierProvider.autoDispose<LoginViewModel, LoginState>(
  LoginViewModel.new,
);
