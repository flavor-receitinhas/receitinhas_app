import 'package:app_receitas/src/core/widgets/feactures/icon_enum.dart' as icon;
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class ImageContext {
  String svgIconProtein(Proteins name) {
    return switch (name) {
      Proteins.vegetarian => icon.IconEnum.cheese.path,
      Proteins.vegan => icon.IconEnum.watermelon.path,
      Proteins.meat => icon.IconEnum.chicken.path,
      Proteins.fish => icon.IconEnum.fish.path,
    };
  }

  String svgIconRestriction(DietaryRestrictions name) {
    return switch (name) {
      DietaryRestrictions.gluten => icon.IconEnum.wheat.path,
      DietaryRestrictions.lactose => icon.IconEnum.milk.path,
      DietaryRestrictions.noRestriction => icon.IconEnum.like.path,
    };
  }

  String svgIconDifficulty(DifficultyRecipe name) {
    return switch (name) {
      DifficultyRecipe.easy => icon.IconEnum.clockExpress.path,
      DifficultyRecipe.medium => icon.IconEnum.coffes.path,
      DifficultyRecipe.hard => icon.IconEnum.fireRounded.path,
    };
  }
}
