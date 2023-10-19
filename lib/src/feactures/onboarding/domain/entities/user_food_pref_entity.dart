// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class UserFoodPrefEntity {
  String userId;
  String userName;
  List<Proteins> protein;
  List<DietaryRestrictions> dietaryRestriction;
  List<DifficultyRecipes> difficultyRecipe;

  UserFoodPrefEntity({
    required this.userId,
    required this.userName,
    required this.protein,
    required this.dietaryRestriction,
    required this.difficultyRecipe,
  });
}
