// Абстрактный базовый класс для всех ошибок приложения
abstract class AppException implements Exception {
  final String message;
  final Object? originalError;

  AppException(this.message, [this.originalError]);

  @override
  String toString() => '$runtimeType: $message';
}

// Исключения слоя данных
class DataException extends AppException {
  DataException(super.message, [super.originalError]);
}
class DatabaseException extends DataException {
  DatabaseException(super.message, [super.originalError]);
}
class MappingException extends DataException {
  MappingException(super.message, [super.originalError]);
}
class ValidationException extends DataException {
  ValidationException(super.message, [super.originalError]);
}

// Исключения сетевого слоя
class NetworkException extends AppException {
  NetworkException(super.message, [super.originalError]);
}
class ConnectionException extends NetworkException {
  ConnectionException([Object? originalError]) : super('No internet connection', originalError);
}
class TimeoutException extends NetworkException {
  TimeoutException([Object? originalError]) : super('Request timeout', originalError);
}

// Исключения авторизации
class AuthException extends AppException {
  AuthException(super.message, [super.originalError]);
}
class UnauthorizedException extends AuthException {
  UnauthorizedException([Object? originalError]) : super('User is not authorized', originalError);
}
class AuthenticationFailedException extends AuthException {
  AuthenticationFailedException([Object? originalError]) : super('Authentication failed', originalError);
}

// Исключения синхронизации
class SyncException extends AppException {
  SyncException(super.message, [super.originalError]);
}
class ConflictException extends SyncException {
  ConflictException(super.message, [super.originalError]);
}
class SyncFailedException extends SyncException {
  SyncFailedException([Object? originalError]) : super('Synchronization failed', originalError);
}
