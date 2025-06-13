import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/container_ingredient_delete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ListSelectIngredients extends StatelessWidget {
  final List<IngredientRecipeEntity> ingredients;
  final void Function(IngredientRecipeEntity indexIngredient) deleteOnPressed;

  const ListSelectIngredients({
    super.key,
    required this.ingredients,
    required this.deleteOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DottedBorder(
        options: RectDottedBorderOptions(
          dashPattern: const [4, 5],
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
          color: Theme.of(context).colorScheme.onPrimary,
          strokeWidth: 1,
          borderPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 5,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CookieText(
              text:
                  '${AppLocalizations.of(context)!.recipeSelectedIngredients} (${ingredients.length})',
              typography: CookieTypography.button,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];
                return ContainerIngredientDelete(
                  ingredient: ingredient,
                  deleteOnPressed: () {
                    deleteOnPressed(ingredients[index]);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
