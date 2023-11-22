import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/controllers/favorite_controller.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/container_recipe.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {
  static const route = '/favorite';
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController ct = di();
  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CookieText(
                        text: 'Lista de Favoritos',
                        typography: CookieTypography.title,
                      ),
                      CookieText(text: 'Gerencie suas receitas favoritas'),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CookieTextFieldSearch(
                hintText: 'Pesquise sua receita favorita',
              ),
              const SizedBox(height: 10),
              Row(
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
                                  ct.recentFirst;
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
                                ct.recentOlder;
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(height: 10),
                            CookieTextButton(
                              text: 'Nome de A a Z',
                              color: colorTheme.onSecondary,
                              typography: CookieTypography.button,
                              onPressed: () {
                                ct.organizeAZ;
                                Navigator.pop(context);
                              },
                            ),
                            const SizedBox(height: 10),
                            CookieTextButton(
                              text: 'Nome de Z a A',
                              color: colorTheme.onSecondary,
                              typography: CookieTypography.button,
                              onPressed: () {
                                ct.organizeZA;
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
              ),
              const ContainerRecipe(),
            ],
          ),
        ),
      ),
    );
  }
}
