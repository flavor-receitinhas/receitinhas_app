import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';

abstract class UserFoodPrefRepository {
  Future<UserFoodPrefEntity> getUser({required String id});
  Future<void> createUser({required UserFoodPrefEntity user});
}
