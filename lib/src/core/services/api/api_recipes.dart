import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/api_client.dart';
import 'package:app_receitas/src/core/services/api/api_response.dart';
import 'package:app_receitas/src/features/auth/domain/services/auth_serivce.dart';

class ApiRecipes {
  final ApiClient _apiClient;
  final ApiResponseParser _apiResponse;
  final AuthService _authService;

  const ApiRecipes(this._apiClient, this._apiResponse, this._authService);
  String get url => Global.dnsApi;
  Future<Map<String, dynamic>> _apiHeader() async {
    await _authService.refreshToken();
    return {
      'Authorization': Global.token,
    };
  }

  Future<dynamic> get({
    required String path,
    Map<String, dynamic>? body,
  }) async {
    final response = await _apiClient.get(
      url + path,
      headers: await _apiHeader(),
    );
    return _apiResponse.handleResponse(response);
  }

  Future<dynamic> post({
    required String path,
    dynamic body,
    bool isformData = false,
  }) async {
    final response = await _apiClient.post(
      url + path,
      body: body ?? {},
      headers: await _apiHeader(),
      isformData: isformData,
    );
    return _apiResponse.handleResponse(response);
  }

  Future<dynamic> put({
    required String path,
    dynamic body,
    bool isformData = false,
  }) async {
    final response = await _apiClient.put(
      url + path,
      body: body ?? {},
      headers: await _apiHeader(),
      isformData: isformData,
    );
    return _apiResponse.handleResponse(response);
  }

  Future<dynamic> delete({required String path}) async {
    final response = await _apiClient.delete(
      url + path,
      headers: await _apiHeader(),
    );
    return _apiResponse.handleResponse(response);
  }
}
