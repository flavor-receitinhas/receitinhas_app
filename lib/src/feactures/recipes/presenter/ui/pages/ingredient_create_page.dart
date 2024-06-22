import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/select_ingredients_page.dart';
import 'package:flutter/material.dart';

class IngredientCreatePage extends StatelessWidget {
  final CreateRecipeController ct;
  const IngredientCreatePage({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: 'Proximo',
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onPressed: () {
          ct.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            CookieButton(
              label: 'Voltar',
              onPressed: () {
                ct.pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const CookieText(
                    text: 'Ingredientes',
                    typography: CookieTypography.title,
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text:
                        'Essas informações vão ajudar a indentificar coisas básicas da sua receita, então seja bem consiso.',
                  ),
                  const SizedBox(height: 20),
                  ContainerCreateInfo(
                    title: 'Ingredientes',
                    iconSvg: 'assets/icons/carrot.svg',
                    child: Center(
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const SelectIngredientsPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.add_circle_outline_rounded,
                          size: 34,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
