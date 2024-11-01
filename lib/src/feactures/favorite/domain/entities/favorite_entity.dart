class FavoriteEntity {
  final String id;
  final String recipeId;
  final String userId;
  final String name;
  final String createdAt;
  final String updatedAt;

  FavoriteEntity({
    required this.id,
    required this.recipeId,
    required this.userId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
}
