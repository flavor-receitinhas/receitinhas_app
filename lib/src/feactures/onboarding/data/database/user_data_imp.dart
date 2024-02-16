import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/dio_client.dart';
import 'package:app_receitas/src/feactures/onboarding/data/database/user_data.dart';
import 'package:app_receitas/src/feactures/onboarding/data/dtos/user_food_pref_dto.dart';
import 'package:app_receitas/src/feactures/onboarding/data/mappers/user_food_pref_mapper.dart';

class UserDatabaseImp implements UserDatabase {
  final DioClient dio;
  final UserFoodPrefMapper _mapper;

  UserDatabaseImp(
    this.dio,
    this._mapper,
  );

  String url = Global.dnsApi;
  String path = 'v1/user';

  @override
  Future<void> createUserPref({required UserFoodPrefDto user}) async {
    await dio.put(
      '$url/$path/${user.userId}/preference',
      body: _mapper.toMap(user),
      headers: {
        'Authorization': Global.token,
      },
    );
  }

  @override
  Future<UserFoodPrefDto> getUserPref({required String userId}) async {
    final response = await dio.get(
      '$url/$path/$userId/preference',
      headers: {
        'Authorization': Global.token,
      },
    );
    final result = _mapper.fromMap(response.data);
    return result;
  }
}
