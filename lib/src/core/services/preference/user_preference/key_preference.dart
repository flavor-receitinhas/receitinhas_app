enum KeyPreferences {
  ///Se o usuario esta logado
  isLogged(key: 'isLogged'),
  ///Escolher qual o tema
  isThemeLight(key: 'isThemeLight', defaultValue: true);

  final String key;
  final dynamic defaultValue;

  const KeyPreferences({required this.key, this.defaultValue});
}
