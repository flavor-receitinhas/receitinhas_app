import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

class ViewDetailsRecipe extends StatelessWidget {
  final String details;
  final List<String> ingredients;
  final String instruction;
  final String serveFood;
  const ViewDetailsRecipe({
    super.key,
    required this.details,
    required this.ingredients,
    required this.instruction,
    required this.serveFood,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CookieText(
          text: 'Detalhes da receita',
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        CookieText(
          text: details,
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                    text: 'Ingredientes',
                    typography: CookieTypography.title,
                  ),
                  CookieSvg(path: 'assets/icons/carrot.svg'),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: ingredients.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CookieText(text: ingredients[index]);
                },
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                    text: 'Instruções de preparo',
                    typography: CookieTypography.title,
                  ),
                  CookieSvg(path: 'assets/icons/knife.svg'),
                ],
              ),
              const SizedBox(height: 20),
              HtmlWidget(
                instruction,
                textStyle: TextStyle(
                  color: theme.onPrimary,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible: serveFood.isNotEmpty,
          child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CookieText(
                      text: 'Hora de se servir!',
                      typography: CookieTypography.title,
                    ),
                    CookieSvg(path: 'assets/icons/pan.svg'),
                  ],
                ),
                const SizedBox(height: 20),
                HtmlWidget(
                  serveFood,
                  textStyle: TextStyle(
                    color: theme.onPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
