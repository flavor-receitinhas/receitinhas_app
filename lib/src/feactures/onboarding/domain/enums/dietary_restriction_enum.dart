enum DietaryRestrictions {
  gluten,
  lactose,
  noRestriction;

  static DietaryRestrictions fromName(String? name) {
    switch (name) {
      case 'GLUTEN':
        return DietaryRestrictions.gluten;
      case 'LACTOSE':
        return DietaryRestrictions.lactose;
      case 'NORESTRICTION':
        return DietaryRestrictions.noRestriction;
      default:
        return DietaryRestrictions.noRestriction;
    }
  }
}
