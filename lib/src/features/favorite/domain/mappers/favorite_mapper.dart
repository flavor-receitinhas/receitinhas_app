import 'package:app_receitas/src/features/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/features/favorite/domain/entities/favorite_entity.dart';

class FavoriteMapper {
  FavoriteEntity fromJson(Map<String, dynamic> json) {
    return FavoriteEntity(
      id: json['id'],
      name: json['name'],
      //imageUrl: json['imageUrl'],
      userId: json['userId'],
      recipeId: json['recipeId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson(FavoriteEntity favorite) {
    return {
      'id': favorite.id,
      'name': favorite.name,
      // 'imageUrl': favorite.imageUrl,
      'userId': favorite.userId,
      'recipeId': favorite.recipeId,
      'createdAt': favorite.createdAt,
      'updatedAt': favorite.updatedAt,
    };
  }

  Map<String, dynamic> toJsonDto(FavoriteDto favorite) {
    return {
      'recipeId': favorite.recipeId,
    };
  }
}
