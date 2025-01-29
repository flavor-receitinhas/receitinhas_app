import 'package:app_receitas/src/features/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/proteins_enum.dart';

class UserFoodPrefEntity {
  String userId;
  List<Proteins> protein;
  List<DietaryRestrictions> dietaryRestriction;
  List<DifficultyRecipe> difficultyRecipe;

  UserFoodPrefEntity({
    required this.userId,
    required this.protein,
    required this.dietaryRestriction,
    required this.difficultyRecipe,
  });
}
