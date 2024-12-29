class ApplicationException implements Exception {
  final String message;
  ApplicationException(this.message);

  @override
  String toString() => 'ApplicationException: $message';
}

class UnableConnectServerException extends ApplicationException {
  UnableConnectServerException() : super('接続可能なサーバがありません。');
}
