class AppException implements Exception {
  final String message;

  AppException(this.message);

  @override
  String toString() {
    return message;
  }
}

class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

class ValidationException extends AppException {
  ValidationException(String message) : super(message);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String message) : super(message);
}


