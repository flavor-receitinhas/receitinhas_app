import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/feactures/onboarding/data/mappers/user_food_pref_mapper.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';

class UserOmboardingRepositoryImp implements UserOmboardingRepository {
  final UserFoodPrefMapper _mapper;
  final ApiRecipes _apiRecipes;

  UserOmboardingRepositoryImp(
    this._mapper,
    this._apiRecipes,
  );

  String pathApi = 'v1/user';

  @override
  Future<void> updateUserPref({required UserFoodPrefEntity user}) async {
    await _apiRecipes.put(
      path: '/$pathApi/${user.userId}/preference',
      body: _mapper.toMap(user),
    );
  }

  @override
  Future<UserFoodPrefEntity> getUserPref({required String userId}) async {
    final result = await _apiRecipes.get(
      path: '/$pathApi/$userId/preference',
    );

    return _mapper.fromMap(result);
  }

  @override
  Future<void> updateUserName(
      {required String userId, required String name}) async {
    await _apiRecipes.put(
      path: '/profile/$userId/name',
      body: {'name': name},
    );
  }
}
