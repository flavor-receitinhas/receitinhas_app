import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class ImageContext {
  IconsSvgEnum svgIconProtein(Proteins name) {
    return switch (name) {
      Proteins.vegetarian => IconsSvgEnum.cheese,
      Proteins.vegan => IconsSvgEnum.watermelon,
      Proteins.meat => IconsSvgEnum.chicken,
      Proteins.fish => IconsSvgEnum.fish,
    };
  }

  IconsSvgEnum svgIconRestriction(DietaryRestrictions name) {
    return switch (name) {
      DietaryRestrictions.gluten => IconsSvgEnum.wheat,
      DietaryRestrictions.lactose => IconsSvgEnum.milk,
      DietaryRestrictions.noRestriction => IconsSvgEnum.like,
    };
  }

  IconsSvgEnum svgIconDifficulty(DifficultyRecipe name) {
    return switch (name) {
      DifficultyRecipe.easy => IconsSvgEnum.clockExpress,
      DifficultyRecipe.medium => IconsSvgEnum.coffes,
      DifficultyRecipe.hard => IconsSvgEnum.fireRounded,
    };
  }
}
