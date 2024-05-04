class FavoriteEntity {
  final int id;
  final String recipeId;
  final String userId;
  final String name;
  final int createdAt;
  final int updatedAt;

  FavoriteEntity({
    required this.id,
    required this.recipeId,
    required this.userId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
}
