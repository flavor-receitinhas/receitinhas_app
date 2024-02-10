import 'package:app_receitas/src/feactures/onboarding/data/dtos/user_food_pref_dto.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';

class UserFoodPrefMapper {
  Map<String, dynamic> toMap(UserFoodPrefDto dto) {
    return <String, dynamic>{
      'userId': dto.userId,
      'userName': dto.userName,
      'protein': dto.protein.map((x) => x.name).toList(),
      'dietaryRestriction': dto.dietaryRestriction.map((x) => x.name).toList(),
      'difficultyRecipe': dto.difficultyRecipe.map((x) => x.name).toList(),
    };
  }

  UserFoodPrefEntity toEntity(UserFoodPrefDto dto) {
    return UserFoodPrefEntity(
        userId: dto.userId,
        userName: dto.userName,
        protein: dto.protein,
        dietaryRestriction: dto.dietaryRestriction,
        difficultyRecipe: dto.difficultyRecipe);
  }

  UserFoodPrefDto fromMap(Map<String, dynamic> map) {
    return UserFoodPrefDto(
      userId: map['userId'] as String,
      userName: map['userName'] as String,
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
