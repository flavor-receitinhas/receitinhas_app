import 'package:app_receitas/src/feactures/recipes/domain/entities/image_entity.dart';

class ImageMapper {
  Map<String, dynamic> toMap(ImageEntity entity) {
    return <String, dynamic>{
      'id': entity.id,
      'recipeId': entity.recipeId,
      'name': entity.name,
      'type': entity.type,
      'size': entity.size,
      'link': entity.link,
      'thumb': entity.thumb,
    };
  }

  ImageEntity fromMap(Map<String, dynamic> map) {
    return ImageEntity(
      id: map['id'] as String,
      recipeId: map['recipeId'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      size: map['size'] as int,
      link: map['link'] as String,
      thumb: map['thumb'] as bool,
    );
  }
}
