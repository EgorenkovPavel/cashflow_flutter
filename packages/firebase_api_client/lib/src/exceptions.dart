// Оригинальное исключение: не найдено удаленной БД
class NoRemoteDBException implements Exception {
  @override
  String toString() => 'No remote database';
}