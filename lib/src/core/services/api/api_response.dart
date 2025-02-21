import 'package:app_receitas/src/core/services/api/api_error/api_bad_request.dart';
import 'package:app_receitas/src/core/services/api/api_error/api_forbidden_error.dart';
import 'package:app_receitas/src/core/services/api/api_error/api_internal_server_error.dart';
import 'package:app_receitas/src/core/services/api/api_error/api_not_found_error.dart';
import 'package:app_receitas/src/core/services/api/api_error/api_unauthenticated_error.dart';
import 'package:app_receitas/src/core/services/api/api_error/api_unprocessable_entity_error.dart';
import 'package:app_receitas/src/core/services/api/response_request_entity.dart';

class ApiResponseParser {
  dynamic handleResponse(ResponseRequestEntity response) {
    switch (response.statusCode) {
      case 400:
        throw ApiBadRequest();
      case 401:
        throw ApiUnauthenticatedError();
      case 403:
        throw ApiForbiddenError();
      case 404:
        throw ApiNotFoundError();
      case 422:
        throw ApiUnprocessableEntityError(message: response.data['message']);
      case 500:
        throw ApiInternalServerError(
          message: response.data['message'] ??
              response.data['detail'] ??
              'Erro no sistema',
        );
    }
    return response.data;
  }
}
