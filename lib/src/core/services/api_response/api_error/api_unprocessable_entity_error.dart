import 'package:app_receitas/src/core/services/api_response/api_error/api_error.dart';

class ApiUnprocessableEntityError extends ApiError {
  @override
  String message;
  ApiUnprocessableEntityError({
    required this.message,
  });
}
