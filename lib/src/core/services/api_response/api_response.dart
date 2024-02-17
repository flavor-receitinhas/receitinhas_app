import 'package:app_receitas/src/core/services/api_response/api_error/api_forbidden_error.dart';
import 'package:app_receitas/src/core/services/api_response/api_error/api_internal_server_error.dart';
import 'package:app_receitas/src/core/services/api_response/api_error/api_unauthenticated_error.dart';
import 'package:app_receitas/src/core/services/api_response/api_error/api_unknown_error.dart';
import 'package:dio/dio.dart';

class ApiResponse {
  Map<String, dynamic> handleResponse(Response<dynamic> response) {
    switch (response.statusCode) {
      case 401:
        throw ApiUnauthenticatedError();
      case 403:
        throw ApiForbiddenError();
      case 500:
        throw ApiInternalServerError(message: response.statusMessage!);
      case 0:
        throw ApiUnknownError(message: response.statusMessage!);
    }
    final result = response.data;

    return result;
  }
}
