import 'package:app_receitas/src/features/onboarding/data/mappers/validate_user_entity.dart';
import 'package:app_receitas/src/features/onboarding/domain/entities/user_food_pref_entity.dart';

abstract class UserOnboardingRepository {
  Future<void> updateUserPref({required UserFoodPrefEntity user});
  Future<UserFoodPrefEntity> getUserPref({required String userId});
  Future<void> updateUserName({required String userId, required String name});
  Future<ValidateUserEntity> validateUser({
    required String userID,
    required String name,
  });
}
