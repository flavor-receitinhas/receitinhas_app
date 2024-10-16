import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/image_context.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InfoContainerDifficultyRecipe extends StatelessWidget {
  final CreateRecipeController ct;
  final Function(DifficultyRecipe) onChanged;
  const InfoContainerDifficultyRecipe(
      {super.key, required this.ct, required this.onChanged});

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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CookieText(
            text: AppLocalizations.of(context)!.recipeDifficultyTitle,
            typography: CookieTypography.title,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          Column(
            children: DifficultyRecipe.values
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CookieButton(
                      label: AppLocalizations.of(context)!
                          .difficultyRecipesOptions(e.name),
                      onPressed: () {
                        onChanged(e);
                      },
                      isSelect: ct.difficultyRecipe == e,
                      prefix: CookieSvg(
                        svg: ImageContext().svgIconDifficulty(e),
                      ),
                      backgroundColor:
                          Theme.of(context).colorScheme.onSecondary,
                      labelColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                )
                .toList(),
          ),
          Row(
            children: [
              Expanded(
                child: CookieButton(
                  label: AppLocalizations.of(context)!.recipeDifficultyBack,
                  onPressed: () {
                    ct.containerController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                child: CookieButton(
                  label: AppLocalizations.of(context)!.recipeDifficultyNext,
                  onPressed: () {
                    ct.containerController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
