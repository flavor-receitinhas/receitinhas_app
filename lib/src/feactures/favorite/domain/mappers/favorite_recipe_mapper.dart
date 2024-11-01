import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_recipe_dto.dart';

class FavoriteRecipeMapper {
  static FavoriteRecipeDto fromJson(Map<String, dynamic> json) {
    return FavoriteRecipeDto(
      exists: json['exists'],
      favoriteId: json['favoriteId'],
    );
  }
}
