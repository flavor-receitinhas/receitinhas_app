import 'package:app_receitas/src/core/services/api_response/api_error/api_error.dart';

class ApiUnknownError extends ApiError {
  @override
  String message;
  ApiUnknownError({
    required this.message,
  });
}
