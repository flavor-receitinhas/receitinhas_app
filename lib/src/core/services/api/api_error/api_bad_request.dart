import 'package:app_receitas/src/core/services/api/api_error/api_error.dart';

class ApiBadRequest extends ApiError {
  @override
  String message = 'Requisição inválida';
}
