import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class UserFoodPrefDto {
  String userId;
  List<Proteins> protein;
  List<DietaryRestrictions> dietaryRestriction;
  List<DifficultyRecipes> difficultyRecipe;
  UserFoodPrefDto({
    required this.userId,
    required this.protein,
    required this.dietaryRestriction,
    required this.difficultyRecipe,
  });
}
