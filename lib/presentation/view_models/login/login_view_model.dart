import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../application/services/auth_service.dart';
import '../../../infrastructure/datasources/remote/api_exception.dart';
import '../../../infrastructure/providers/service_providers.dart';

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
  late final AuthService _authService;

  @override
  LoginState build() {
    _authService = ref.watch(authServiceProvider);
    return const LoginState.idle();
  }

  /// Appleでログイン
  Future<bool> signInWithApple() async {
    state = const LoginState.loading(provider: AuthProvider.apple);

    try {
      final user = await _authService.signInWithApple();

      if (!ref.mounted) return false;

      state = LoginState.success(
        userId: user.id,
        email: user.email,
        provider: AuthProvider.apple,
      );
      return true;
    } on ApiException catch (e) {
      if (!ref.mounted) return false;
      state = LoginState.error(message: e.message);
      return false;
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
      final user = await _authService.signInWithGoogle();

      if (!ref.mounted) return false;

      state = LoginState.success(
        userId: user.id,
        email: user.email,
        provider: AuthProvider.google,
      );
      return true;
    } on ApiException catch (e) {
      if (!ref.mounted) return false;
      state = LoginState.error(message: e.message);
      return false;
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

  /// Apple Sign-inが利用可能か
  Future<bool> isAppleSignInAvailable() async {
    return _authService.isAppleSignInAvailable();
  }
}

/// LoginViewModelのプロバイダー
final loginViewModelProvider =
    NotifierProvider.autoDispose<LoginViewModel, LoginState>(
  LoginViewModel.new,
);
