import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';

abstract class UserOnboardingRepository {
  Future<void> updateUserPref({required UserFoodPrefEntity user});
  Future<UserFoodPrefEntity> getUserPref({required String userId});
  Future<void> updateUserName({required String userId, required String name});
}
