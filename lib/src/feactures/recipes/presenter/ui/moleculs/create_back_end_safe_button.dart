import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateBackAndSafeButton extends StatelessWidget {
  final CreateRecipeController ct;
  const CreateBackAndSafeButton({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton.icon(
          label: const Icon(Icons.save),
          onPressed: () {
            CookieSheetBottom(
              title: CookieText(
                text: AppLocalizations.of(context)!
                    .recipeCreateBackEndSafeButtonPublishPrompt,
                color: Theme.of(context).colorScheme.onSecondary,
                typography: CookieTypography.title,
              ),
              body: Column(
                children: [
                  CookieText(
                    text: AppLocalizations.of(context)!
                        .recipeCreateBackEndSafeButtonPublishConfirmation,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  const SizedBox(height: 10),
                  CookieButton(
                    label: AppLocalizations.of(context)!
                        .recipeCreateBackEndSafeButtonPublish,
                    onPressed: () {
                      ct.createRecipe();
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieButton.outline(
                    label: AppLocalizations.of(context)!
                        .recipeCreateBackEndSafeButtonSaveDraft,
                    onPressed: () {
                      ct.createRecipe();
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieButton.outline(
                    label: AppLocalizations.of(context)!
                        .recipeCreateBackEndSafeButtonContinueWriting,
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ).show(context);
          },
          icon: CookieText(
            text:
                AppLocalizations.of(context)!.recipeCreateBackEndSafeButtonSave,
          ),
        ),
      ],
    );
  }
}
