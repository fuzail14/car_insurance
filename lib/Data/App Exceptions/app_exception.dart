class AppException implements Exception {
  final _message;
  final _prefixMessage;

  AppException([this._message, this._prefixMessage]);

  @override
  String toString() {
    return '$_message$_prefixMessage';
  }
}

class InternetException extends AppException {
  InternetException([message]) : super(message, 'no Internet Exception');
}

class ConflictException extends AppException {
  ConflictException([message]) : super(message, 'Conflict');
}

class ServerException extends AppException {
  ServerException([message]) : super(message, 'Server Error');
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([message]) : super(message, 'UnAuthorized');
}

class RequestTimeOutException extends AppException {
  RequestTimeOutException([message]) : super(message, 'Request Time Out ');
}
