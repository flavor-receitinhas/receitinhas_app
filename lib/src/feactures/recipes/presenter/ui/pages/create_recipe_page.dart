import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_view_recipe_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/info_create_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/ingredient_create_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/introduce_create_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/intruction_create_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/server_dish_page.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/manager_page.dart';

class CreateRecipePage extends StatefulWidget {
  static const route = '/create-recipe';
  const CreateRecipePage({super.key});

  @override
  State<CreateRecipePage> createState() => _CreateRecipePageState();
}

class _CreateRecipePageState
    extends ManagerPage<CreateRecipeController, CreateRecipePage> {
  final List<Widget> routes = [];

  @override
  void initState() {
    routes.addAll([
      IntroduceCreatePage(ct: ct),
      InfoCreatePage(ct: ct),
      IngredientCreatePage(ct: ct),
      IntructionCreatePage(ct: ct),
      ServerDishPage(ct: ct),
      CreateViewRecipePage(ct: ct),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: ct.onChangedPage,
      controller: ct.pageController,
      physics: const NeverScrollableScrollPhysics(),
      children: routes,
    );
  }
}
