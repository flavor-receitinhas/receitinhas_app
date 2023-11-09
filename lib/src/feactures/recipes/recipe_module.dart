import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/widgets.dart';

class RecipeModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ViewRecipesPage.route: const ViewRecipesPage(),
    CreateRecipePage.route: const CreateRecipePage(),
  };

  @override
  void inicialize() {
    //Controller
    di.registerFactory<RecipeController>(
      () => RecipeController(
        di(),
      ),
    );
  }
}
