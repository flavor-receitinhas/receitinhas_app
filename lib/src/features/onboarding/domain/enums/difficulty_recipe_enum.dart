import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

enum DifficultyRecipe {
  easy,
  medium,
  hard;

  static DifficultyRecipe fromName(String? name) {
    switch (name) {
      case 'easy':
        return DifficultyRecipe.easy;
      case 'medium':
        return DifficultyRecipe.hard;
      case 'hard':
        return DifficultyRecipe.medium;
      default:
        return DifficultyRecipe.easy;
    }
  }

  String titleDescription(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;
    switch (this) {
      case DifficultyRecipe.easy:
        return localizations.searchRecipeOrderDifficultyEasy;
      case DifficultyRecipe.medium:
        return localizations.searchRecipeOrderDifficultyMedium;
      case DifficultyRecipe.hard:
        return localizations.searchRecipeOrderDifficultyHard;
    }
  }
}
