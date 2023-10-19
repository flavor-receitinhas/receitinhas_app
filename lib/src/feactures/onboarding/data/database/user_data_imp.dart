import 'package:app_receitas/src/feactures/onboarding/data/database/user_data.dart';
import 'package:app_receitas/src/feactures/onboarding/data/dtos/user_food_pref_dto.dart';
import 'package:app_receitas/src/feactures/onboarding/data/mappers/user_food_pref_mapper.dart';
import 'package:dio/dio.dart';

class UserDatabaseImp implements UserDatabase {
  final Dio dio;
  final UserFoodPrefMapper _mapper;

  UserDatabaseImp(
    this.dio,
    this._mapper,
  );

  String url = 'http://192.168.1.6:8080';
  String path = 'v1/user';

  @override
  Future<void> createUserPref({required UserFoodPrefDto user}) async {
    await dio.put(
      '$url/$path/${user.userId}/preference',
      data: _mapper.toMap(user)
    );
  }

  @override
  Future<UserFoodPrefDto> getUserPref({required String userId}) async {
    final response = await dio.get('$url/$path/$userId/preference');
    final result = _mapper.fromMap(response.data);
    return result;
  }
}
