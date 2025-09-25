import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/custom_topic_info.dart';
import 'package:domain_receitinhas/features/recipes/domain/dtos/ingredient_recipe_dto.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ViewDetailsRecipe extends StatelessWidget {
  final String details;
  final List<IngredientRecipeDto> ingredients;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CookieText(
          text: AppLocalizations.of(context)!.recipeDetailsTitle,
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        if (details.isNotEmpty) ...[
          CookieText(text: details),
          const SizedBox(height: 20),
        ],
        CustomTopicInfo(
          title: AppLocalizations.of(context)!.recipeIngredientsTitle,
          child: ListView.builder(
            itemCount: ingredients.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              var quantity = ingredients[index].quantity;
              var formattedQuantity =
                  quantity % 1 == 0 ? quantity.toInt() : quantity;
              return CookieText(
                text:
                    '${ingredients[index].ingredientName} - $formattedQuantity ${ingredients[index].unit}',
              );
            },
          ),
        ),
        if (instruction.isNotEmpty) ...[
          const SizedBox(height: 20),

          CustomTopicInfo(
            title: AppLocalizations.of(context)!.recipeInstructionsTitle,
            child: CookieText(text: instruction),
          ),
        ],
        if (serveFood.isNotEmpty) ...[
          const SizedBox(height: 20),
          CustomTopicInfo(
            title: AppLocalizations.of(context)!.recipeServeFoodTitle,
            child: CookieText(text: serveFood),
          ),
        ],
      ],
    );
  }
}
