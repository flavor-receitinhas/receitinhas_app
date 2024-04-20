class FavoriteDto {
  final String recipeId;
  final String userId;
  final String name;

  FavoriteDto(
      {required this.recipeId, required this.userId, required this.name});
}
