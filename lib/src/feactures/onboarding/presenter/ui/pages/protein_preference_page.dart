import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProteinPreferencePage extends StatefulWidget {
  final OnBoardingController ct;
  const ProteinPreferencePage({super.key, required this.ct});

  @override
  State<ProteinPreferencePage> createState() => _ProteinPreferencePageState();
}

class _ProteinPreferencePageState extends State<ProteinPreferencePage> {
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
            CookieButton(
              label: AppLocalizations.of(context)!.proteinPreferenceOption1,
              onPressed: () {},
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              prefix: Icon(
                Icons.ac_unit_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              labelColor: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.proteinPreferenceOption2,
              onPressed: () {},
              prefix: Icon(
                Icons.ac_unit_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              labelColor: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.proteinPreferenceOption3,
              onPressed: () {},
              prefix: Icon(
                Icons.ac_unit_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              labelColor: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.proteinPreferenceOption4,
              onPressed: () {},
              prefix: Icon(
                Icons.ac_unit_rounded,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.onPrimary,
              labelColor: Theme.of(context).colorScheme.onSecondary,
            ),
            const SizedBox(height: 20),
            CookieButton(
              label: AppLocalizations.of(context)!.proteinPreferenceConfirm,
              onPressed: () {
                widget.ct.pageController.animateToPage(
                  1,
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
