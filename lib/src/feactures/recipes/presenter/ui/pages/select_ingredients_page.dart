import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/select_ingredient_container.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/sheet_select_ingredient.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/organisms/list_all_ingredients.dart';
import 'package:dotted_border/dotted_border.dart';
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
            SliverVisibility(
              visible: true,
              sliver: SliverToBoxAdapter(
                child: DottedBorder(
                  dashPattern: const [4, 5],
                  borderPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 5,
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(10),
                  color: Theme.of(context).colorScheme.onPrimary,
                  strokeWidth: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CookieText(
                        text: 'Ingredientes selecionados (1)',
                        typography: CookieTypography.button,
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return const SelectIngredientContainer();
                        },
                      ),
                    ],
                  ),
                ),
              ),
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
              padding:  EdgeInsets.symmetric(horizontal: 16),
              sliver: ListAllIngredients(),
            )
          ],
        ),
      ),
    );
  }
}
