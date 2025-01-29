import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BackSheet extends StatelessWidget {
  const BackSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CookieText(
          text: AppLocalizations.of(context)!.profileBackSheetConfirmExit,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(height: 10),
        CookieButton(
          label:
              AppLocalizations.of(context)!.profileBackSheetExitWithoutSaving,
          onPressed: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 10),
        CookieButton.outline(
          label: AppLocalizations.of(context)!.profileBackSheetContinueEditing,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
