enum KeyPreferences {
  ///Escolher qual o tema
  isThemeLight(key: 'isThemeLight', defaultValue: true),
  ///Preferencias do onboarding
  onBoardingPref(key:'onBoardingPref'),
  ///Ultima página preenchida no onBoarding
  onBoardingLastPage(key:'onBoardingLastPage', defaultValue: 0);

  final String key;
  final dynamic defaultValue;

  const KeyPreferences({required this.key, this.defaultValue});
}
