enum KeyPreferences {
  ///Escolher qual o tema
  isThemeLight(defaultValue: true),
  ///Escolher idioma
  language(defaultValue:'pt');

  final dynamic defaultValue;

  const KeyPreferences({this.defaultValue});
}
