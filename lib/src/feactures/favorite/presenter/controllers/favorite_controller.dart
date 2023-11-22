class FavoriteController {
  List<String> listFavorite = [];

  void get recentFirst =>
      listFavorite.sort((a, b) => a.length.compareTo(b.length));

  void get recentOlder =>
      listFavorite.sort((a, b) => b.compareTo(a));

  void get organizeAZ =>
      listFavorite.sort((a, b) => a.compareTo(b));

  void get organizeZA =>
      listFavorite.sort((a, b) => b.compareTo(a));
}
