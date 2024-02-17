enum KeyPreferences {
  ///Escolher qual o tema
  isThemeLight(key: 'isThemeLight', defaultValue: true),
  ///Preferencias do onboarding
  onBoardingPref(key:'onBoardingPref');

  final String key;
  final dynamic defaultValue;

  const KeyPreferences({required this.key, this.defaultValue});
}
