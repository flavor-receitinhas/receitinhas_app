import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_ingredient.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/validator/number_convert.dart';
import 'package:flutter/material.dart';

class ContainerIngredientDelete extends StatelessWidget {
  final IngredientRecipeEntity ingredient;
  final void Function() deleteOnPressed;
  const ContainerIngredientDelete(
      {super.key, required this.ingredient, required this.deleteOnPressed});

  @override
  Widget build(BuildContext context) {
    return ContainerIngredient(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieText(
            text: ingredient.ingredient.name,
            typography: CookieTypography.button,
            maxLine: 2,
            overflow: TextOverflow.ellipsis,
          ),
          CookieText(
            text: '${formatDouble(ingredient.quantity)} ${ingredient.unit}',
          ),
        ],
      ),
      icon: const CookieSvg(
        svg: IconsSvgEnum.delete,
      ),
      onTap: deleteOnPressed,
    );
  }
}
