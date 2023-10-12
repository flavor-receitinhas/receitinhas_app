enum Proteins {
  vegetarian,
  vegan,
  meat,
  fish;

  static Proteins fromName(String? name) {
    switch (name) {
      case 'VEGETARIAN':
        return Proteins.vegetarian;
      case 'VEGAN':
        return Proteins.vegan;
      case 'MEAT':
        return Proteins.meat;
      case 'FISH':
        return Proteins.fish;
      default:
        return Proteins.meat;
    }
  }
}
