import 'package:app_receitas/src/features/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/proteins_enum.dart';

class UserFoodPrefMapper {
  Map<String, dynamic> toMap(UserFoodPrefEntity dto) {
    return <String, dynamic>{
      'userId': dto.userId,
      'protein': dto.protein.map((x) => x.name).toList(),
      'dietaryRestriction': dto.dietaryRestriction.map((x) => x.name).toList(),
      'difficultyRecipe': dto.difficultyRecipe.map((x) => x.name).toList(),
    };
  }


  UserFoodPrefEntity fromMap(Map<String, dynamic> map) {
    return UserFoodPrefEntity(
      userId: map['userId'] as String,
      protein:
          map['protein'].map<Proteins>((e) => Proteins.fromName(e)).toList(),
      dietaryRestriction: map['dietaryRestriction']
          .map<DietaryRestrictions>((e) => DietaryRestrictions.fromName(e))
          .toList(),
      difficultyRecipe: map['difficultyRecipe']
          .map<DifficultyRecipe>((e) => DifficultyRecipe.fromName(e))
          .toList(),
    );
  }
}
