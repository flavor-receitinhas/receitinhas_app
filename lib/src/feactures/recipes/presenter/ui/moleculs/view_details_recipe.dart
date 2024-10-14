import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/global/icon_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewDetailsRecipe extends StatelessWidget {
  final String details;
  final List<IngredientRecipeEntity> ingredients;
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
      children: [
        CookieText(
          text: AppLocalizations.of(context)!.recipeDetailsTitle,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                    text: AppLocalizations.of(context)!.recipeIngredientsTitle,
                    typography: CookieTypography.title,
                  ),
                  CookieSvg(path: IconEnum.carrot.path),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: ingredients.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CookieText(
                    text: ingredients[index].ingredient.name,
                  );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                    text: AppLocalizations.of(context)!.recipeInstructionsTitle,
                    typography: CookieTypography.title,
                  ),
                  CookieSvg(path: IconEnum.knife.path),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CookieText(
                      text: AppLocalizations.of(context)!.recipeServeFoodTitle,
                      typography: CookieTypography.title,
                    ),
                    CookieSvg(path: IconEnum.pan.path),
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
