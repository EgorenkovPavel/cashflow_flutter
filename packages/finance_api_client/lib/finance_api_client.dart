library spring;

import 'package:dio/dio.dart';
import 'package:dto_models/dto_models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:uuid/uuid.dart';

part 'finance_api_client.g.dart';

@RestApi(baseUrl: "http://localhost:8080/v1")
abstract class FinanceApiClient {
  factory FinanceApiClient(Dio dio, {String baseUrl}) = _FinanceApiClient;

  @POST("/register")
  Future<UserResponce> register(@Header("Authorization") String idToken);

  @POST("user-groups/{userGroup}/accounts")
  Future<BaseAccountResponse> createAccount(
    @Path("userGroup") UuidValue userGroup,
    @Body() CreateAccountRequest request,
  );

  @GET("user-groups/{userGroup}/accounts/{id}")
  Future<BaseAccountResponse> getAccount(
    @Path("userGroup") UuidValue userGroup,
    @Path("id") UuidValue id,
  );

  @GET("user-groups/{userGroup}/accounts")
  Future<List<BaseAccountResponse>> getAccounts(
    @Path("userGroup") UuidValue userGroup,
  );
}

class AuthInterceptor extends Interceptor {
  String? _accessToken;

  // Метод для обновления токена в памяти после регистрации
  void updateToken(String token) => _accessToken = token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_accessToken != null) {
      options.headers['Authorization'] = 'Bearer $_accessToken';
    }
    handler.next(options);
  }
}
