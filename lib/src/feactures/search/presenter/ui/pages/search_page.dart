import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/feactures/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/moleculs/search_recipe.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/organisms/result_recipes.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const route = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  ResearchController ct = di();

  @override
  void initState() {
    ct.init();
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const CookieButton(label: 'Pesquisa').back(context),
          const SizedBox(height: 20),
          const SearchRecipe(),
          ResultRecipes(ct: ct),
        ],
      ),
    );
  }
}
