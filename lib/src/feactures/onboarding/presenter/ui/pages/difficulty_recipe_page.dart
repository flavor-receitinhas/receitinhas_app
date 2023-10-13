import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/image_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class DifficultRecipePage extends StatefulWidget {
  final OnBoardingController ct;
  const DifficultRecipePage({super.key, required this.ct});

  @override
  State<DifficultRecipePage> createState() => _DifficultRecipePageState();
}

class _DifficultRecipePageState extends State<DifficultRecipePage> {
  OnBoardingController get ct => widget.ct;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LinearProgressIndicator(
          value: 3 / 4,
          minHeight: 10,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                ct.pageController.animateToPage(
                  1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const Spacer(),
            CookieText(
              text: AppLocalizations.of(context)!.difficultyRecipesTitle,
              typography: CookieTypography.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Column(
              children: DifficultyRecipes.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CookieButton(
                        label: AppLocalizations.of(context)!
                            .difficultyRecipesOptions(e.name),
                        onPressed: () {
                          ct.onboardingPref.difficultyRecipe.contains(e)
                              ? ct.onboardingPref.difficultyRecipe.remove(e)
                              : ct.onboardingPref.difficultyRecipe.add(e);
                          ct.saveOnboardingPrefs();
                        },
                        isSelect: widget.ct.onboardingPref.difficultyRecipe
                            .contains(e),
                        prefix: SvgPicture.asset(
                          ImageContext().svgIconDifficulty(e),
                          colorFilter: ColorFilter.mode(
                            Theme.of(context).colorScheme.onSecondary,
                            BlendMode.srcIn,
                          ),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        labelColor: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            CookieButton(
              label: AppLocalizations.of(context)!.difficultyRecipesConfirm,
              onPressed: () {
                widget.ct.pageController.animateToPage(
                  3,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
