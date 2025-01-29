import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/onboarding/domain/enums/proteins_enum.dart';
import 'package:app_receitas/src/features/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/features/onboarding/presenter/ui/image_context.dart';
import 'package:app_receitas/src/features/onboarding/presenter/validator_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProteinPreferencePage extends StatefulWidget {
  final OnBoardingController ct;
  const ProteinPreferencePage({super.key, required this.ct});

  @override
  State<ProteinPreferencePage> createState() => _ProteinPreferencePageState();
}

class _ProteinPreferencePageState extends State<ProteinPreferencePage> {
  OnBoardingController get ct => widget.ct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LinearProgressIndicator(
          value: 1 / 4,
          minHeight: 10,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CookieText(
              text: AppLocalizations.of(context)!.proteinPreferenceTitle,
              typography: CookieTypography.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Column(
              children: Proteins.values
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: CookieButton(
                        label: AppLocalizations.of(context)!
                            .proteinPreferenceOptions(e.name),
                        onPressed: () {
                          setState(() {
                            ValidatorOnboarding.validateTapProtein(
                                ct.protein, e);
                          });
                        },
                        isSelect: ct.protein.contains(e),
                        backgroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        prefix: CookieSvg(
                          svg: ImageContext().svgIconProtein(e),
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        labelColor: Theme.of(context).colorScheme.onSecondary,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 20),
            CookieButton(
              label: AppLocalizations.of(context)!.proteinPreferenceConfirm,
              onPressed: () {
                if (ct.protein.isNotEmpty) {
                  ct.pageController.animateToPage(
                    1,
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
