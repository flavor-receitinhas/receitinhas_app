enum DifficultyRecipes {
  easy,
  medium,
  hard;

  static DifficultyRecipes fromName(String? name) {
    switch (name) {
      case 'easy':
        return DifficultyRecipes.easy;
      case 'medium':
        return DifficultyRecipes.hard;
      case 'hard':
        return DifficultyRecipes.medium;
      default:
        return DifficultyRecipes.easy;
    }
  }
}
