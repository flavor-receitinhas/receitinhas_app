class OnboardingPrefModel {
  bool vegetarian;
  bool vegan;
  bool meat;
  bool fish;
  bool gluten;
  bool lactose;
  bool noRestriction;
  bool easyDifFiculty;
  bool mediumDifficulty;
  bool hardDifficulty;

  OnboardingPrefModel({
    this.vegetarian = false,
    this.vegan = false,
    this.meat = false,
    this.fish = false,
    this.gluten = false,
    this.lactose = false,
    this.noRestriction = true,
    this.easyDifFiculty = false,
    this.mediumDifficulty = false,
    this.hardDifficulty = false,
  });

  OnboardingPrefModel.fromJson(Map<String, dynamic> map)
      : vegetarian = map['vegetarian'],
        vegan = map['vegan'],
        meat = map['meat'],
        fish = map['fish'],
        gluten = map['gluten'],
        lactose = map['lactose'],
        noRestriction = map['noRestriction'],
        easyDifFiculty = map['easyDifFiculty'],
        mediumDifficulty = map['mediumDifficulty'],
        hardDifficulty = map['hardDifficulty'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['vegetarian'] = vegetarian;
    data['vegan'] = vegan;
    data['meat'] = meat;
    data['fish'] = fish;
    data['gluten'] = gluten;
    data['lactose'] = lactose;
    data['noRestriction'] = noRestriction;
    data['easyDifFiculty'] = easyDifFiculty;
    data['mediumDifficulty'] = mediumDifficulty;
    data['hardDifficulty'] = hardDifficulty;
    return data;
  }
}
