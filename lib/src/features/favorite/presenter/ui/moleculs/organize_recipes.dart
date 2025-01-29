import 'package:app_receitas/src/core/widgets/features/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OrganizeRecipes extends StatelessWidget {
  final void Function() onTapRecent;
  final void Function() onTapOld;
  final void Function() onTapAsc;
  final void Function() onTapDesc;
  const OrganizeRecipes({
    super.key,
    required this.onTapRecent,
    required this.onTapOld,
    required this.onTapAsc,
    required this.onTapDesc,
  });

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CookieText(
          text: AppLocalizations.of(context)!.favoriteOrganizeRecipesTitle,
        ),
        IconButton(
          onPressed: () {
            CookieSheetBottom(
              title: CookieText(
                text:
                    AppLocalizations.of(context)!.favoriteOrganizeRecipesTitle,
                typography: CookieTypography.title,
                color: colorTheme.onSecondary,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CookieTextButton(
                    text: AppLocalizations.of(context)!
                        .favoriteOrganizeRecipesRecentFirst,
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapRecent,
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: AppLocalizations.of(context)!
                        .favoriteOrganizeRecipesOldestFirst,
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapOld,
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: AppLocalizations.of(context)!
                        .favoriteOrganizeRecipesNameAsc,
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapAsc,
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: AppLocalizations.of(context)!
                        .favoriteOrganizeRecipesNameDesc,
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapDesc,
                  ),
                ],
              ),
            ).show(context);
          },
          icon: const Icon(Icons.menu),
        )
      ],
    );
  }
}
