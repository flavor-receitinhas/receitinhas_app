import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class ImageContext {
  String svgIconProtein(Proteins name) {
    return switch (name) {
      Proteins.vegetarian => 'assets/icons/cheese.svg',
      Proteins.vegan => 'assets/icons/watermelon.svg',
      Proteins.meat => 'assets/icons/chicken.svg',
      Proteins.fish => 'assets/icons/fish.svg',
    };
  }

  String svgIconRestriction(DietaryRestrictions name) {
    return switch (name) {
      DietaryRestrictions.gluten => 'assets/icons/wheat.svg',
      DietaryRestrictions.lactose => 'assets/icons/milk.svg',
      DietaryRestrictions.noRestriction => 'assets/icons/like.svg',
    };
  }

  String svgIconDifficulty(DifficultyRecipe name) {
    return switch (name) {
      DifficultyRecipe.easy => 'assets/icons/clock_express.svg',
      DifficultyRecipe.medium => 'assets/icons/coffes.svg',
      DifficultyRecipe.hard => 'assets/icons/fire_rounded.svg',
    };
  }
}
