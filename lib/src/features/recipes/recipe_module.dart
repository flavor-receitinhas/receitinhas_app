import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/ingredient_select_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/view_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/create_and_edit_recipe_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/select_ingredients_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:domain_receitinhas/features/recipes/domain/repositories/ingredient_repository.dart';
import 'package:domain_receitinhas/features/recipes/domain/repositories/ingredient_repository_imp.dart';
import 'package:domain_receitinhas/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:domain_receitinhas/features/recipes/domain/repositories/recipe_repository_imp.dart';
import 'package:flutter/widgets.dart';

class RecipeModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ViewRecipesPage.route: const ViewRecipesPage(),
    CreateAndEditRecipePage.route: const CreateAndEditRecipePage(),
    SelectIngredientsPage.route: const SelectIngredientsPage(),
  };

  @override
  void inicialize() {
    //Repository
    di.registerFactory<RecipeRepository>(() => RecipeRepositoryImp());
    di.registerFactory<IngredientRepository>(() => IngredientRepositoryImp());

    //Controller
    di.registerFactory<CreateRecipeController>(
      () => CreateRecipeController(di()),
    );
    di.registerFactory<ViewRecipeController>(
      () => ViewRecipeController(di(), di()),
    );
    di.registerFactory<IngredientSelectController>(
      () => IngredientSelectController(di()),
    );
  }
}
