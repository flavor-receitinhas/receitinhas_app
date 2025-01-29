import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/features/favorite/domain/mappers/favorite_mapper.dart';
import 'package:app_receitas/src/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:app_receitas/src/features/favorite/domain/repositories/favorite_repository_imp.dart';
import 'package:app_receitas/src/features/favorite/presenter/controllers/favorite_controller.dart';
import 'package:app_receitas/src/features/favorite/presenter/ui/pages/favorite_page.dart';
import 'package:flutter/widgets.dart';

class FavoriteModule implements RegisterModule {
  @override
  Map<String, Widget> routers = {
    FavoritePage.route: const FavoritePage(),
  };

  @override
  void inicialize() {
    //Mapper
    di.registerFactory(() => FavoriteMapper());

    //Repositories
    di.registerFactory<FavoriteRepository>(
      () => FavoriteRepositoryImp(di(), di()),
    );

    //Controller
    di.registerFactory<FavoriteController>(
      () => FavoriteController(
        di(),
      ),
    );
  }
}
