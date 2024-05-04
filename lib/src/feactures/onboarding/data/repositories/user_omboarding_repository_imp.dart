import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/dio_client.dart';
import 'package:app_receitas/src/core/services/api_response/api_response.dart';
import 'package:app_receitas/src/feactures/onboarding/data/mappers/user_food_pref_mapper.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';

class UserOmboardingRepositoryImp implements UserOmboardingRepository {
  final DioClient dio;
  final UserFoodPrefMapper _mapper;
  final ApiResponse _apiResponse;

  UserOmboardingRepositoryImp(
    this.dio,
    this._mapper,
    this._apiResponse,
  );

  String url = Global.dnsApi;
  String path = 'v1/user';

  @override
  Future<void> updateUserPref({required UserFoodPrefEntity user}) async {
    final response = await dio.put(
      '$url/$path/${user.userId}/preference',
      body: _mapper.toMap(user),
      headers: {
        'Authorization': Global.token,
      },
    );

    _apiResponse.handleResponse(response);
  }

  @override
  Future<UserFoodPrefEntity> getUserPref({required String userId}) async {
    final response = await dio.get(
      '$url/$path/$userId/preference',
      headers: {
        'Authorization': Global.token,
      },
    );
    final result = _apiResponse.handleResponse(response);

    return _mapper.fromMap(result);
  }

  @override
  Future<void> updateUserName(
      {required String userId, required String name}) async {
    final response = await dio.put('$url/profile/$userId/name', body: {
      'name': name
    }, headers: {
      'Authorization': Global.token,
    });
    
    _apiResponse.handleResponse(response);
  }
}
