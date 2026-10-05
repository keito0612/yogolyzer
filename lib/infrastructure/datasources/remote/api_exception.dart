/// API例外の基底クラス
sealed class ApiException implements Exception {
  const ApiException();

  String get message;
}

/// 認証エラー（401）
class UnauthorizedException extends ApiException {
  const UnauthorizedException([this._message]);

  final String? _message;

  @override
  String get message => _message ?? '認証に失敗しました。再度ログインしてください。';
}

/// ネットワークエラー
class NetworkException extends ApiException {
  const NetworkException([this._message]);

  final String? _message;

  @override
  String get message => _message ?? 'ネットワーク接続を確認してください。';
}

/// サーバーエラー
class ServerException extends ApiException {
  const ServerException(this.statusCode, [this._message]);

  final int statusCode;
  final String? _message;

  @override
  String get message =>
      _message ?? 'サーバーエラーが発生しました（$statusCode）';
}

/// サービス利用不可エラー（503）
class ServiceUnavailableException extends ApiException {
  const ServiceUnavailableException([this._message]);

  final String? _message;

  @override
  String get message =>
      _message ?? '現在通信が混雑しています。しばらく時間を置いてから再度お試しください。';
}

/// タイムアウトエラー
class TimeoutException extends ApiException {
  const TimeoutException([this._message]);

  final String? _message;

  @override
  String get message => _message ?? '接続がタイムアウトしました。再度お試しください。';
}

/// レート制限エラー（429）
class RateLimitException extends ApiException {
  const RateLimitException([this._message]);

  final String? _message;

  @override
  String get message => _message ?? '本日の診断回数上限に達しました。';
}

/// バリデーションエラー（400）
class ValidationException extends ApiException {
  const ValidationException(this._message);

  final String _message;

  @override
  String get message => _message;
}

/// 不明なエラー
class UnknownApiException extends ApiException {
  const UnknownApiException([this._message]);

  final String? _message;

  @override
  String get message => _message ?? '予期しないエラーが発生しました。';
}
