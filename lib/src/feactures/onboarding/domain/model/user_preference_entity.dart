import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class UserPreferenceEntity {
  List<Proteins> protein;
  List<DietaryRestrictions> dietaryRestriction;
  List<DifficultyRecipes> difficultyRecipe;

  UserPreferenceEntity({
    this.protein = const [],
    this.dietaryRestriction = const [],
    this.difficultyRecipe = const [],
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'protein': protein.map((e) => e.name).toList(),
      'dietaryRestriction': dietaryRestriction.map((e) => e.name).toList(),
      'difficultyRecipe': difficultyRecipe.map((e) => e.name).toList(),
    };
  }

  factory UserPreferenceEntity.fromMap(Map<String, dynamic> map) {
    return UserPreferenceEntity(
      protein:
          map['protein'].map<Proteins>((e) => Proteins.fromName(e)).toList(),
      dietaryRestriction: map['dietaryRestriction']
          .map<DietaryRestrictions>((e) => DietaryRestrictions.fromName(e))
          .toList(),
      difficultyRecipe: map['difficultyRecipe']
          .map<DifficultyRecipes>((e) => DifficultyRecipes.fromName(e))
          .toList(),
    );
  }
}
