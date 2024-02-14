import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ViewIntroduceRecipe extends StatelessWidget {
  final RecipeEntity recipe;
  const ViewIntroduceRecipe({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CookieText(
          text: recipe.title,
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        CookieText(
          text: recipe.subTitle!,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              child: Row(
                children: [
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/clock.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CookieText(text: '${recipe.timePrepared} min'),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/fire.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CookieText(text: recipe.difficultyRecipe.name)
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/pot.svg',
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CookieText(
                        text: recipe.portion != 1
                            ? '${recipe.portion} porções'
                            : '${recipe.portion} porção',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
