import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/api_client.dart';
import 'package:app_receitas/src/core/services/api/api_response.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';

class ApiRecipes {
  // final response = await _dioClient.post(
  //   '$url/$path/${favoriteDto.userId}',
  //   body: _mapper.toJsonDto(favoriteDto),
  //   headers: {
  //     'Authorization': Global.token,
  //   },
  // );

  final ApiClient _apiClient;
  final ApiResponse _apiResponse;
  final AuthService _authService;

  const ApiRecipes(this._apiClient, this._apiResponse, this._authService);

  Map<String, dynamic> _apiHeader() {
    _authService.refreshToken();
    return {
      'Authorization': Global.token,
    };
  }

  Future<dynamic> get<T>(
      {required String path, Map<String, dynamic>? body}) async {
    final response = await _apiClient.get<T>(
      path,
      headers: _apiHeader(),
    );
    _apiResponse.handleResponse(response);
  }

  Future<dynamic> post(
      {required String path, Map<String, dynamic>? body}) async {
    final response = await _apiClient.post(
      path,
      body: body ?? {},
      headers: _apiHeader(),
    );
    return _apiResponse.handleResponse(response);
  }

  Future<dynamic> put(
      {required String path, Map<String, dynamic>? body}) async {
    final response = await _apiClient.put(
      path,
      body: body ?? {},
      headers: _apiHeader(),
    );
    return _apiResponse.handleResponse(response);
  }

  Future<dynamic> delete({required String path}) async {
    final response = await _apiClient.delete(
      path,
      headers: _apiHeader(),
    );
    return _apiResponse.handleResponse(response);
  }
}
