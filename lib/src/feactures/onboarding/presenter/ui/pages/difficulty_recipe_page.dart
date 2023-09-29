import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CookieText(
                  text: AppLocalizations.of(context)!.difficultyRecipesTitle,
                  typography: CookieTypography.title,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                CookieButton(
                  label: AppLocalizations.of(context)!.difficultyRecipesOption1,
                  onPressed: () {
                    setState(() {
                      ct.onboardingPref.easyDifFiculty =
                          !ct.onboardingPref.easyDifFiculty;
                    });
                    ct.saveOnboardingPrefs();
                  },
                  isSelect: widget.ct.onboardingPref.easyDifFiculty,
                  prefix: Icon(
                    Icons.ac_unit_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  labelColor: Theme.of(context).colorScheme.onSecondary,
                ),
                const SizedBox(height: 10),
                CookieButton(
                  label: AppLocalizations.of(context)!.difficultyRecipesOption2,
                  onPressed: () {
                    setState(() {
                      ct.onboardingPref.mediumDifficulty =
                          !ct.onboardingPref.mediumDifficulty;
                    });
                    ct.saveOnboardingPrefs();
                  },
                  isSelect: widget.ct.onboardingPref.mediumDifficulty,
                  prefix: Icon(
                    Icons.ac_unit_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  labelColor: Theme.of(context).colorScheme.onSecondary,
                ),
                const SizedBox(height: 10),
                CookieButton(
                  label: AppLocalizations.of(context)!.difficultyRecipesOption3,
                  onPressed: () {
                    setState(() {
                      ct.onboardingPref.hardDifficulty =
                          !ct.onboardingPref.hardDifficulty;
                    });
                    ct.saveOnboardingPrefs();
                  },
                  isSelect: widget.ct.onboardingPref.hardDifficulty,
                  prefix: Icon(
                    Icons.ac_unit_rounded,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  labelColor: Theme.of(context).colorScheme.onSecondary,
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
          ],
        ),
      ),
    );
  }
}