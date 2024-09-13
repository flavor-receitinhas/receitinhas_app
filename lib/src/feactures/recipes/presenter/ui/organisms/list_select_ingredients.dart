import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/container_ingredient_delete.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class ListSelectIngredients extends StatefulWidget {
  final List<IngredientRecipeEntity> ingredients;
  final void Function(IngredientRecipeEntity indexIngredient) deleteOnPressed;
  const ListSelectIngredients(
      {super.key, required this.ingredients, required this.deleteOnPressed});

  @override
  State<ListSelectIngredients> createState() => _ListSelectIngredientsState();
}

class _ListSelectIngredientsState extends State<ListSelectIngredients> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: DottedBorder(
        dashPattern: const [4, 5],
        borderPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        color: Theme.of(context).colorScheme.onPrimary,
        strokeWidth: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CookieText(
              text: 'Ingredientes selecionados (${widget.ingredients.length})',
              typography: CookieTypography.button,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: widget.ingredients.length,
              itemBuilder: (context, index) {
                final ingredient = widget.ingredients[index];
                return ContainerIngredientDelete(
                  ingredient: ingredient,
                  deleteOnPressed: () {
                    widget.deleteOnPressed(
                      widget.ingredients[index],
                    );
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
