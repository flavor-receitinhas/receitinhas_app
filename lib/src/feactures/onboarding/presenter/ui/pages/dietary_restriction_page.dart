import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/image_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/svg.dart';

class DietaryRestricionPage extends StatefulWidget {
  final OnBoardingController ct;

  const DietaryRestricionPage({super.key, required this.ct});

  @override
  State<DietaryRestricionPage> createState() => _DietaryRestricionPageState();
}

class _DietaryRestricionPageState extends State<DietaryRestricionPage> {
  OnBoardingController get ct => widget.ct;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LinearProgressIndicator(
          value: 2 / 4,
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
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            const Spacer(),
            CookieText(
              text: AppLocalizations.of(context)!.dietaryRestrictionTitle,
              typography: CookieTypography.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Column(
                children: DietaryRestrictions.values
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: CookieButton(
                          label: AppLocalizations.of(context)!
                              .dietaryRestrictionOptions(e.name),
                          onPressed: () {
                            setState(() {
                              ct.onboardingPref.dietaryRestriction.contains(e)
                                  ? ct.onboardingPref.dietaryRestriction
                                      .remove(e)
                                  : ct.onboardingPref.dietaryRestriction.add(e);
                              if (ct.onboardingPref.dietaryRestriction.contains(
                                      DietaryRestrictions.noRestriction) &&
                                  e == DietaryRestrictions.noRestriction) {
                                ct.onboardingPref.dietaryRestriction
                                    .remove(DietaryRestrictions.gluten);
                                ct.onboardingPref.dietaryRestriction
                                    .remove(DietaryRestrictions.lactose);
                              }
                              if (e != DietaryRestrictions.noRestriction) {
                                ct.onboardingPref.dietaryRestriction
                                    .remove(DietaryRestrictions.noRestriction);
                              }
                            });
                            ct.saveOnboardingPrefs();
                          },
                          isSelect:
                              ct.onboardingPref.dietaryRestriction.contains(e),
                          backgroundColor:
                              Theme.of(context).colorScheme.onPrimary,
                          prefix: SvgPicture.asset(
                            ImageContext().svgIconRestriction(e),
                            colorFilter: ColorFilter.mode(
                              Theme.of(context).colorScheme.onSecondary,
                              BlendMode.srcIn,
                            ),
                          ),
                          labelColor: Theme.of(context).colorScheme.onSecondary,
                        ),
                      ),
                    )
                    .toList()),
            const SizedBox(height: 20),
            CookieButton(
              label: AppLocalizations.of(context)!.dietaryRestrictionConfirm,
              onPressed: () {
                widget.ct.pageController.animateToPage(
                  2,
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
