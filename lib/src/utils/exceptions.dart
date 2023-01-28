
class AuthException implements Exception{
  final String message;

  const AuthException(this.message);
}

class NetworkException implements Exception{
  final String message;

  NetworkException(this.message);

}

class NoRemoteDBException implements Exception{}