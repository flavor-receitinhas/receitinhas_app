import 'package:app_receitas/src/core/services/api/response_request_entity.dart';
import 'package:dio/dio.dart' as dio;

class ResponseRequestMapper {
  ResponseRequestEntity fromDio(dio.Response response) {
    return ResponseRequestEntity(
      data: response.data ?? {},
      statusCode: response.statusCode ?? 0,
      statusMessage: response.statusMessage ?? '',
    );
  }

  // ResponseRequestEntity fromHttp(http.Response response) {
  //   return ResponseRequestEntity(
  //     data: _convertToMap(response.bodyBytes),
  //     statusCode: response.statusCode,
  //     statusMessage: response.reasonPhrase ?? '',
  //   );
  // }
}
