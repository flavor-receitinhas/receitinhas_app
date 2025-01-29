class RecipeDto {
  final String? thumb;
  final int timePrepared;
  final String recipeId;
  final String title;

  RecipeDto({
    this.thumb,
    required this.timePrepared,
    required this.recipeId,
    required this.title,
  });

  factory RecipeDto.fromMap(Map<String, dynamic> map) {
    return RecipeDto(
      thumb: map['thumb'],
      timePrepared: map['timePrepared'],
      recipeId: map['recipeId'],
      title: map['title'],
    );
  }
}
