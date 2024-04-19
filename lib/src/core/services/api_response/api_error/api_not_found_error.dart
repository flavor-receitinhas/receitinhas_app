import 'package:app_receitas/src/core/services/api_response/api_error/api_error.dart';

class ApiNotFoundError extends ApiError {
  @override
  String message = 'Arquivo não encontrado';
}
