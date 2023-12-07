import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/controllers/favorite_controller.dart';
import 'package:flutter/material.dart';

class OrganizeRecipes extends StatefulWidget {
  final FavoriteController ct;
  const OrganizeRecipes({super.key, required this.ct});

  @override
  State<OrganizeRecipes> createState() => _OrganizeRecipesState();
}

class _OrganizeRecipesState extends State<OrganizeRecipes> {
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
                    onPressed: () {
                      setState(() {
                        widget.ct.recentFirst;
                      });
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: 'Mais antigo primeiro',
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: () {
                      widget.ct.recentOlder;
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: 'Nome de A a Z',
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: () {
                      widget.ct.organizeAZ;
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(height: 10),
                  CookieTextButton(
                    text: 'Nome de Z a A',
                    color: colorTheme.onSecondary,
                    typography: CookieTypography.button,
                    onPressed: () {
                      widget.ct.organizeZA;
                      Navigator.pop(context);
                    },
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
