import 'package:app_receitas/src/features/favorite/domain/dtos/favorite_user_dto.dart';
import 'package:app_receitas/src/features/favorite/domain/mappers/favorite_mapper.dart';

class FavoriteUserMapper {
  FavoriteUserDto fromJson(Map<String, dynamic> json) {
    return FavoriteUserDto(
      favorite: FavoriteMapper().fromJson(json['favorite']),
      thumb: json['thumb'],
      timePrepared: json['timePrepared'],
    );
  }

  Map<String, dynamic> toJson(FavoriteUserDto favoriteUser) {
    return {
      'favorite': FavoriteMapper().toJson(favoriteUser.favorite),
      'thumb': favoriteUser.thumb,
      'timePrepared': favoriteUser.timePrepared,
    };
  }
}
