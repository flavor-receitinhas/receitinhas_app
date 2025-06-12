import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/features/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/features/onboarding/presenter/ui/image_context.dart';
import 'package:app_receitas/src/features/onboarding/presenter/validator_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

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
              children: DifficultyRecipe.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CookieButton(
                        label: AppLocalizations.of(context)!
                            .difficultyRecipesOptions(e.name),
                        onPressed: () {
                          setState(() {
                            ValidatorOnboarding.validateTapDifficulty(
                                ct.difficultyRecipe, e);
                          });
                        },
                        isSelect: ct.difficultyRecipe.contains(e),
                        prefix: CookieSvg(
                          svg: ImageContext().svgIconDifficulty(e),
                          color: Theme.of(context).colorScheme.onSecondary,
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
                if (ct.difficultyRecipe.isNotEmpty) {
                  widget.ct.pageController.animateToPage(
                    3,
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.ease,
                  );
                } else {
                  final snackBar = SnackBar(
                    content: CookieText(
                      text: AppLocalizations.of(context)!
                          .dietaryRestrictionSnackBar,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
