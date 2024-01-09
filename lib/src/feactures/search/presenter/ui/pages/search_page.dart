import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/moleculs/recipe_search_container.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/pages/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  static const route = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
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
                      text: 'Ola, nietz!',
                      typography: CookieTypography.title,
                    ),
                    CookieText(
                      text: 'O que vamos cozinhar hoje ?',
                    ),
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
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: CookieTextFieldSearch(
                    hintText: 'Procure algo para cozinhar',
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FilterPage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/menu.svg',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CookieTextButton(
                  text: 'Limpar filtros',
                  typography: CookieTypography.button,
                  onPressed: () {},
                ),
              ],
            ),
            const Visibility(
              visible: true,
              child: CookieText(
                text: 'Resultados da pesquisa (3)',
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: const RecipeSearchContainer(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
