import 'package:app_receitas/src/core/services/api/response_request_entity.dart';

abstract class ApiClient {
  Future<ResponseRequestEntity> put<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  });

  Future<ResponseRequestEntity> delete<T>(
    String url, {
    required Map<String, dynamic> headers,
  });

  Future<ResponseRequestEntity> get<T>(
    String url, {
    required Map<String, dynamic> headers,
  });
  Future<ResponseRequestEntity> post<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  });
}
