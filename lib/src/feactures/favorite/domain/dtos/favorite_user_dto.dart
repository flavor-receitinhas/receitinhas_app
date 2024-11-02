import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';

class FavoriteUserDto {
  final FavoriteEntity favorite;
  final String? thumb;
  final int timePrepared;

  FavoriteUserDto(
      {required this.favorite, this.thumb, required this.timePrepared});
}
