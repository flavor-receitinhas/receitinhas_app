enum Proteins {
  vegetarian,
  vegan,
  meat,
  fish;

  static Proteins fromName(String? name) {
    switch (name) {
      case 'vegetarian':
        return Proteins.vegetarian;
      case 'vegan':
        return Proteins.vegan;
      case 'meat':
        return Proteins.meat;
      case 'fish':
        return Proteins.fish;
      default:
        return Proteins.meat;
    }
  }
}
