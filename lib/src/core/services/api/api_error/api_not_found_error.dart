import 'package:app_receitas/src/core/services/api/api_error/api_error.dart';

class ApiNotFoundError extends ApiError {
  @override
  String message = 'Não encontrado';
}
