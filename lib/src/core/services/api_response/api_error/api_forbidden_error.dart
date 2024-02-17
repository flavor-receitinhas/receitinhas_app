import 'package:app_receitas/src/core/services/api_response/api_error/api_error.dart';

class ApiForbiddenError extends ApiError {
  @override
  String message = 'Acesso negado';
}
