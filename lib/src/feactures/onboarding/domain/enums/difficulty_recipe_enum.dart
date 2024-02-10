enum DifficultyRecipe {
  easy,
  medium,
  hard;

  static DifficultyRecipe fromName(String? name) {
    switch (name) {
      case 'easy':
        return DifficultyRecipe.easy;
      case 'medium':
        return DifficultyRecipe.hard;
      case 'hard':
        return DifficultyRecipe.medium;
      default:
        return DifficultyRecipe.easy;
    }
  }
}
