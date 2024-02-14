import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_left_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CookieText(
                      text: 'Ola, nietz!',
                      typography: CookieTypography.title,
                    ),
                    CookieText(
                      text: 'O que vamos cozinhar hoje ?',
                    ),
                  ],
                ),
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
              ],
            ),
          ),
          const Row(
            children: [
              CookieLeftButton(title: 'Home'),
            ],
          ),
          const SizedBox(height: 20),
          const SearchRecipe(),
          ResultRecipes(ct: ct),
        ],
      ),
    );
  }
}
