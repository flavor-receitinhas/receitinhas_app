import 'dart:convert';
import 'dart:developer';

import 'package:app_receitas/src/core/services/api/response_request_entity.dart';
import 'package:app_receitas/src/core/services/api/response_request_mapper.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  final ResponseRequestMapper _requestMapper;

  ApiClient(this._requestMapper);

  Future<ResponseRequestEntity> put<T>(
    String url, {
    required Map<String, dynamic> body,
    required Map<String, dynamic> headers,
    bool isformData = false,
  }) async {
    try {
      dynamic data = body;
      if (isformData) {
        _log(method: 'put', path: url, headers: headers);
        data = FormData.fromMap(data);
      } else {
        _log(method: 'put', path: url, headers: headers, body: body);
      }
      final response = await _dio.put(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return _requestMapper.fromDio(response);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 0,
        statusMessage: e.message ?? '',
      );
    }
  }

  Future<ResponseRequestEntity> delete<T>(
    String url, {
    required Map<String, dynamic> headers,
  }) async {
    try {
      _log(method: 'delete', path: url, headers: headers);
      final response = await _dio.delete<T>(
        url,
        options: Options(headers: headers),
      );
      return _requestMapper.fromDio(response);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 0,
        statusMessage: e.message ?? '',
      );
    }
  }

  Future<ResponseRequestEntity> get<T>(
    String url, {
    required Map<String, dynamic> headers,
  }) async {
    try {
      _log(method: 'get', path: url, headers: headers);
      final response = await _dio.get<T>(
        url,
        options: Options(headers: headers),
      );
      return _requestMapper.fromDio(response);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 0,
        statusMessage: e.message ?? '',
      );
    }
  }

  Future<ResponseRequestEntity> post<T>(
    String url, {
    required dynamic body,
    required Map<String, dynamic> headers,
    bool isformData = false,
  }) async {
    try {
      dynamic data = body;
      if (isformData) {
        data = FormData.fromMap(data);
        _log(method: 'post', path: url, headers: headers);
      } else {
        _log(method: 'post', path: url, headers: headers, body: body);
      }
      final response = await _dio.post<T>(
        url,
        data: data,
        options: Options(headers: headers),
      );
      return _requestMapper.fromDio(response);
    } on DioException catch (e) {
      return ResponseRequestEntity(
        data: e.response?.data,
        statusCode: e.response?.statusCode ?? 0,
        statusMessage: e.message ?? '',
      );
    }
  }

  void _log({
    required String method,
    required String path,
    Map<String, dynamic>? headers,
    dynamic body,
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
