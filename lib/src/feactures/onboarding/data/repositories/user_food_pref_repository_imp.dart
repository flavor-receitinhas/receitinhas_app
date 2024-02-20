import 'package:app_receitas/src/feactures/onboarding/data/database/user_data.dart';
import 'package:app_receitas/src/feactures/onboarding/data/dtos/user_food_pref_dto.dart';
import 'package:app_receitas/src/feactures/onboarding/data/mappers/user_food_pref_mapper.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_food_pref_repository.dart';

class UserFoodPrefRepositoryImp implements UserFoodPrefRepository {
  UserDatabase userData;
  final UserFoodPrefMapper _mapper;
  UserFoodPrefRepositoryImp(
    this.userData,
    this._mapper,
  );

  @override
  Future<void> createUser({required UserFoodPrefEntity user}) async {
    await userData.createUserPref(
      user: UserFoodPrefDto(
        userId: user.userId,
        protein: user.protein,
        dietaryRestriction: user.dietaryRestriction,
        difficultyRecipe: user.difficultyRecipe,
      ),
    );
  }

  @override
  Future<UserFoodPrefEntity> getUser({required String id}) async {
    final result = await userData.getUserPref(userId: id);
    return _mapper.toEntity(result);
  }
}
