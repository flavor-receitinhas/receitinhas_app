enum DifficultyRecipes {
  easy,
  medium,
  hard;

  static DifficultyRecipes fromName(String? name) {
    switch (name) {
      case 'EASY':
        return DifficultyRecipes.easy;
      case 'HARD':
        return DifficultyRecipes.hard;
      case 'MEDIUM':
        return DifficultyRecipes.medium;
      default:
        return DifficultyRecipes.easy;
    }
  }
}
