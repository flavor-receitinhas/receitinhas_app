import 'dart:convert';
import 'dart:developer';

import 'package:app_receitas/src/core/library/api_client.dart';
import 'package:app_receitas/src/core/services/api/response_request_entity.dart';
import 'package:app_receitas/src/core/services/api/response_request_mapper.dart';
import 'package:dio/dio.dart';

class DioClient extends ApiClient {
  final Dio _dio = Dio();
  final ResponseRequestMapper _requestMapper;

  DioClient(this._requestMapper);

  @override
  Future<ResponseRequestEntity> put<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) async {
    _log(method: 'put', path: url, headers: headers, body: body);
    final response = await _dio.put(
      url,
      data: body,
      options: Options(headers: headers),
    );
    return _requestMapper.fromDio(response);
  }

  @override
  Future<ResponseRequestEntity> delete<T>(
    String url, {
    required Map<String, dynamic> headers,
  }) async {
    _log(method: 'delete', path: url, headers: headers);
    final response = await _dio.delete<T>(
      url,
      options: Options(headers: headers),
    );
    return _requestMapper.fromDio(response);
  }

  @override
  Future<ResponseRequestEntity> get<T>(
    String url, {
    required Map<String, dynamic> headers,
  }) async {
    _log(method: 'get', path: url, headers: headers);
    final response = await _dio.get<T>(
      url,
      options: Options(headers: headers),
    );
    return _requestMapper.fromDio(response);
  }

  @override
  Future<ResponseRequestEntity> post<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
  }) async {
    _log(method: 'post', path: url, headers: headers, body: body);
    final response = await _dio.post<T>(
      url,
      data: body,
      options: Options(headers: headers),
    );
    return _requestMapper.fromDio(response);
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
