import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class ValidatorOnboarding {
  static String? validateName(String? value) {
    if (value == null || value.length < 3) {
      return 'O nome deve ter no minimo 3 letras';
    }
    if (value.length > 30) {
      return 'O nome deve ter no maximo 30 letras';
    }
    RegExp usernameRegex =
        RegExp(r'^(?!.*\.\.)(?![_\.])(?!.*\.$)[a-zA-Z0-9._]{1,30}$');
    if (!usernameRegex.hasMatch(value)) {
      return 'Nome de usuário inválido';
    }
    return null;
  }

  static void validateTapDietaryRestriction(
      List<DietaryRestrictions> listDietary, DietaryRestrictions dietary) {
    listDietary.contains(
      dietary,
    )
        ? listDietary.remove(
            dietary,
          )
        : listDietary.add(
            dietary,
          );
    if (listDietary.contains(DietaryRestrictions.noRestriction) &&
        dietary == DietaryRestrictions.noRestriction) {
      listDietary.remove(DietaryRestrictions.gluten);
      listDietary.remove(DietaryRestrictions.lactose);
    }
    if (dietary != DietaryRestrictions.noRestriction) {
      listDietary.remove(DietaryRestrictions.noRestriction);
    }
  }

  static void validateTapProtein(
      List<Proteins> listProteins, Proteins proteins) {
    listProteins.contains(proteins)
        ? listProteins.remove(proteins)
        : listProteins.add(proteins);
  }

  static void validateTapDifficulty(List<DifficultyRecipe> listDifficulty,
      DifficultyRecipe difficultyRecipe) {
    listDifficulty.contains(difficultyRecipe)
        ? listDifficulty.remove(difficultyRecipe)
        : listDifficulty.add(difficultyRecipe);
  }
}
