// Внутри пакета finance_api_client
import 'package:dio/dio.dart';

class FinanceApiClient {
  late final Dio _dio;

  FinanceApiClient({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 5), // Таймаут соединения
        receiveTimeout: const Duration(seconds: 3),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    // Добавляем Interceptors для логирования и авторизации
    _dio.interceptors.add(LogInterceptor(responseBody: true));
  }

  // Метод для получения данных
  Future<Map<DateTime, int>> fetchMonthlySummary(int year) async {
    final response = await _dio.get('/v1/summary', queryParameters: {'year': year});
    // Здесь логика парсинга JSON в объекты из finance_models
    return _parseSummary(response.data);
  }
}

