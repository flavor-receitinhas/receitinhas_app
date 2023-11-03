import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/pages/favorite_page.dart';
import 'package:flutter/widgets.dart';

class FavoriteModule implements RegisterModule {
  @override
  Map<String, Widget> routers = {
    FavoritePage.route: const FavoritePage(),
  };

  @override
  void inicialize() {}
}
