class RemoteJobException implements Exception {
  final String message;

  RemoteJobException(this.message);

  @override
  String toString() => 'RemoteJobException: $message';
}

// ジョブのリクエストが失敗した
class RequestFailedException extends RemoteJobException {
  RequestFailedException(String message) : super(message);
}

// ジョブの結果が失敗だった
class JobFailedException extends RemoteJobException {
  JobFailedException(String message) : super(message);
}

// サーバーとの接続が切断
class ServerDisconnectedException extends RemoteJobException {
  ServerDisconnectedException(String message) : super(message);
}
