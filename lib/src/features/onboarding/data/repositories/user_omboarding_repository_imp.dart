import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/features/onboarding/data/mappers/user_food_pref_mapper.dart';
import 'package:app_receitas/src/features/onboarding/data/mappers/validate_user_entity.dart';
import 'package:app_receitas/src/features/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/features/onboarding/domain/repositories/user_onboarding_repository.dart';

class UserOmboardingRepositoryImp implements UserOnboardingRepository {
  final UserFoodPrefMapper _mapper;
  final ApiRecipes _apiRecipes;

  UserOmboardingRepositoryImp(this._mapper, this._apiRecipes);

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
    final result = await _apiRecipes.get(path: '/$pathApi/$userId/preference');

    return _mapper.fromMap(result);
  }

  @override
  Future<void> updateUserName({
    required String userId,
    required String name,
  }) async {
    await _apiRecipes.put(path: '/profile/$userId/name', body: {'name': name});
  }

  @override
  Future<ValidateUserEntity> validateUser({
    required String userID,
    required String name,
  }) async {
    final result = await _apiRecipes.get(
      path: '/profile/$userID/name/$name/validate',
    );

    return ValidateUserEntity.fromMap(result);
  }
}
