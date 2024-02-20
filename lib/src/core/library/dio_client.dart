import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio = Dio();
  Future<Response<T>> put<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) {
    _log(method: 'put', path: url, headers: headers, body: body);
    return _dio.put<T>(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  Future<Response<T>> delete<T>(
    String url, {
    required Map<String, dynamic> headers,
  }) {
    _log(method: 'delete', path: url, headers: headers);
    return _dio.delete<T>(
      url,
      options: Options(headers: headers),
    );
  }

  Future<Response<T>> get<T>(
    String url, {
    required Map<String, dynamic> headers,
  }) {
    _log(method: 'get', path: url, headers: headers);
    return _dio.get<T>(
      url,
      options: Options(headers: headers),
    );
  }

  Future<Response<T>> post<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) {
    _log(method: 'post', path: url, headers: headers, body: body);
    return _dio.post<T>(
      url,
      data: body,
      options: Options(headers: headers),
    );
  }

  void _log({
    required String method,
    required String path,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? body,
  }) {
    log(
      '=============================== INICIO ==============================\n'
      '=============== Method: $method \n'
      '=============== Path: $path \n'
      '=============== Body: ${json.encode(body)} \n'
      '=============== Headers: ${json.encode(headers)} \n'
      '============================= FIM ================================\n',
      time: DateTime.now(),
    );
  }
}
