import 'package:app_receitas/src/core/widgets/feactures/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_button.dart';
import 'package:flutter/material.dart';

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
        const CookieText(text: 'Organizar por'),
        IconButton(
          onPressed: () {
            CookieSheetBottom(
              title: CookieText(
                text: 'Organizar por',
                typography: CookieTypography.title,
                color: colorTheme.onSecondary,
              ),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CookieTextButton(
                    text: 'Mais recente primeiro',
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapRecent,
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: 'Mais antigo primeiro',
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapOld,
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: 'Nome de A a Z',
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: onTapAsc,
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: 'Nome de Z a A',
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
