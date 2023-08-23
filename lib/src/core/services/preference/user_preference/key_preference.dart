enum KeyPreferences {
  chooseTheme(key: 'chooseTheme');

  final String key;
  final dynamic defaultValue;

  const KeyPreferences({required this.key, this.defaultValue});
}
