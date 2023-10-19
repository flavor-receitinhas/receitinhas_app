import 'package:app_receitas/src/feactures/onboarding/data/dtos/user_food_pref_dto.dart';

abstract class UserDatabase {
  Future<void> createUserPref({required UserFoodPrefDto user});
  Future<UserFoodPrefDto> getUserPref({required String userId});
}
