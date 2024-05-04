import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/organisms/list_all_ingredients.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/organisms/list_select_ingredients.dart';
import 'package:flutter/material.dart';

class SelectIngredientsPage extends StatefulWidget {
  const SelectIngredientsPage({super.key});

  @override
  State<SelectIngredientsPage> createState() => _SelectIngredientsPageState();
}

class _SelectIngredientsPageState extends State<SelectIngredientsPage> {
  String dropdownValue = 'Unidade 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const CookieButton(label: 'Voltar').back(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        CookieText(
                          text: 'Selecionar ingredientes',
                          typography: CookieTypography.title,
                        ),
                        SizedBox(height: 10),
                        CookieTextFieldSearch(
                            hintText: 'Pesquise seus ingredientes'),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SliverVisibility(
              visible: true,
              sliver: ListSelectIngredients(),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
                child: CookieText(
                  text: 'Escolha outros ingredientes abaixo',
                  typography: CookieTypography.button,
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              sliver: ListAllIngredients(),
            )
          ],
        ),
      ),
    );
  }
}
