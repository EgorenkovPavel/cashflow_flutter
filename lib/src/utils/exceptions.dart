
class AuthException implements Exception{
  final String message;

  const AuthException(this.message);

  @override
  String toString() {
    return 'Auth Exception - $message';
  }
}

class NetworkException implements Exception{
  final String message;

  NetworkException(this.message);

  @override
  String toString() {
    return 'Network Exception - $message';
  }
}

class NoRemoteDBException implements Exception{}