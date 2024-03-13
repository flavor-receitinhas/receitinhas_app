import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/image_context.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoContainerDifficultyRecipe extends StatefulWidget {
  final CreateRecipeController ct;
  const InfoContainerDifficultyRecipe({super.key, required this.ct});

  @override
  State<InfoContainerDifficultyRecipe> createState() =>
      _InfoContainerDifficultyRecipeState();
}

class _InfoContainerDifficultyRecipeState
    extends State<InfoContainerDifficultyRecipe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          CookieText(
            text: 'Dificuldade',
            typography: CookieTypography.title,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const SizedBox(height: 10),
          Column(
            children: DifficultyRecipe.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CookieButton(
                      label: AppLocalizations.of(context)!
                          .difficultyRecipesOptions(e.name),
                      onPressed: () {
                        setState(() {
                          widget.ct.difficultyRecipe = e;
                        });
                      },
                      isSelect: widget.ct.difficultyRecipe == e,
                      prefix: SvgPicture.asset(
                        ImageContext().svgIconDifficulty(e),
                        colorFilter: ColorFilter.mode(
                          Theme.of(context).colorScheme.onPrimary,
                          BlendMode.srcIn,
                        ),
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      labelColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 20),
          CookieButton(
            label: 'Proximo',
            onPressed: () {
              //      ct.pageController.nextPage(
              //   duration: const Duration(milliseconds: 500),
              //   curve: Curves.ease,
              // );
            },
          ),
        ],
      ),
    );
  }
}
