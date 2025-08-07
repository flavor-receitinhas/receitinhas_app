enum KeyPreferences {
  ///Escolher qual o tema
  isThemeLight(defaultValue: true),
  ///Escolher idioma
  language(defaultValue:'');

  final dynamic defaultValue;

  const KeyPreferences({this.defaultValue});
}
