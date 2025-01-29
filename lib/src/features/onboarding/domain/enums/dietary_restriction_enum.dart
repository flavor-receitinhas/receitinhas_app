enum DietaryRestrictions {
  gluten,
  lactose,
  noRestriction;

  static DietaryRestrictions fromName(String? name) {
    switch (name) {
      case 'gluten':
        return DietaryRestrictions.gluten;
      case 'lactose':
        return DietaryRestrictions.lactose;
      case 'noRestriction':
        return DietaryRestrictions.noRestriction;
      default:
        return DietaryRestrictions.noRestriction;
    }
  }
}
