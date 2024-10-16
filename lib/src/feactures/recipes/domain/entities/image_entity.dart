class ImageEntity {
  final String id;
  final String recipeId;
  final String name;
  final String type;
  final int size;
  final String link;
  final bool thumb;

  ImageEntity({
    required this.id,
    required this.recipeId,
    required this.name,
    required this.type,
    required this.size,
    required this.link,
    required this.thumb,
  });
}
