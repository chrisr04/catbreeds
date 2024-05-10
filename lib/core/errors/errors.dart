class NetworkException implements Exception {
  NetworkException([this._prefix, this._message]);

  final dynamic _prefix;
  final dynamic _message;

  @override
  String toString() => '$_prefix${_message != null ? ':$_message' : ''}';
}

class NoInternetException extends NetworkException {
  NoInternetException([message]) : super('No internet connection', message);
}

class FetchDataException extends NetworkException {
  FetchDataException([message]) : super('Error during Communication', message);
}

class InvalidResponseException extends NetworkException {
  InvalidResponseException([message]) : super('Invalid response', message);
}
