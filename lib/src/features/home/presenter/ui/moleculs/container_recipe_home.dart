import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_recipe_badge.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:domain_receitinhas/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:flutter/material.dart';

class ContainerRecipeHome extends StatelessWidget {
  final RecipeDto recipe;
  final double? height;
  final double width;

  const ContainerRecipeHome({
    super.key,
    required this.recipe,
    this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          ViewRecipesPage.route,
          arguments: {'id': recipe.recipeId},
        );
      },
      child: SizedBox(
        width: width,
        height: height,
        child: Stack(
          alignment: Alignment.topLeft,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                recipe.thumb ?? Global.imageRecipeDefault,
                fit: BoxFit.cover,
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.4),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 16,
                top: 16,
                right: 16,
                bottom: 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: CookieText(
                          text: recipe.title,
                          color: Colors.white,
                          maxLine: 2,
                          overflow: TextOverflow.ellipsis,
                          typography: CookieTypography.button,
                          shadows: [
                            Shadow(
                              color: Colors.black.withValues(alpha: 0.3),
                              offset: Offset(1, 1),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                      ),
                      // Icon(
                      //   Icons.favorite,
                      //   color: Colors.white,
                      //   size: 20,
                      //   shadows: [
                      //     Shadow(
                      //       color: Colors.black.withValues(alpha: 0.3),
                      //       offset: Offset(1, 1),
                      //       blurRadius: 10,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),

                  Row(
                    children: [
                      CookieRecipeBadge(
                        icon: IconsSvgEnum.clock,
                        label:
                            '${recipe.timePrepared} ${AppLocalizations.of(context)!.recipeIntroduceTimePrepared}',
                      ),
                    ],
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
