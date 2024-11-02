class FavoriteRecipeDto {
  final bool exists;
  final String? favoriteId;

  FavoriteRecipeDto({
    required this.exists,
    this.favoriteId,
  });

  FavoriteRecipeDto copyWith({
    bool? exists,
    String? favoriteId,
  }) {
    return FavoriteRecipeDto(
      exists: exists ?? this.exists,
      favoriteId: favoriteId ?? this.favoriteId,
    );
  }
}
