import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LeaveRecipeSheet extends StatelessWidget {
  const LeaveRecipeSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CookieText(
          text: AppLocalizations.of(context)!
              .recipeLeaveRecipeSheetDiscardWarning,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(height: 10),
        CookieButton.outline(
          label: AppLocalizations.of(context)!
              .recipeLeaveRecipeSheetContinueWriting,
          labelColor: Theme.of(context).colorScheme.onSecondary,
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(height: 10),
        CookieButton(
          label:
              AppLocalizations.of(context)!.recipeLeaveRecipeSheetDiscardRecipe,
          labelColor: Theme.of(context).colorScheme.onPrimary,
          backgroundColor: Colors.red,
          onPressed: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              CustomBottomBar.route,
              (route) => false,
            );
          },
        )
      ],
    );
  }
}
