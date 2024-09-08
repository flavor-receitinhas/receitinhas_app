import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/ingredient_select_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_ingredient.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/sheet_select_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ListAllIngredients extends StatelessWidget {
  final IngredientSelectController ct;
  const ListAllIngredients({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, IngredientEntity>(
      pagingController: ct.pagingController,
      builderDelegate: PagedChildBuilderDelegate<IngredientEntity>(
          animateTransitions: true,
          firstPageErrorIndicatorBuilder: (context) {
            return const Center(
              child: CookieText(
                text: 'Erro ao carregar ingredientes',
              ),
            );
          },
          noItemsFoundIndicatorBuilder: (context) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CookieText(
                  text: 'Nenhuma receita encontrada',
                ),
                CookieTextButton(
                  text: 'Adicionar ingrediente',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    CookieSheetBottom(
                      alignmentTitle: Alignment.center,
                      title: CookieText(
                        text: 'Não encontrou seu igrediente ?',
                        typography: CookieTypography.title,
                        color: Theme.of(context).colorScheme.onSecondary,
                      ),
                      body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CookieText(
                            text: 'Digite ele no campo abaixo',
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                          const SizedBox(height: 10),
                          CookieTextField.outline(
                            hintText: 'Digite o ingrediente',
                            maxLength: 50,
                            controller: ct.ingredientController,
                          ),
                          const SizedBox(height: 20),
                          CookieButton(
                            label: 'Confirmar',
                            onPressed: () {
                              ct.addIngredient();
                              ct.refreshPage();
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ).show(context);
                  },
                )
              ],
            );
          },
          newPageErrorIndicatorBuilder: (context) {
            return const Center(
              child: CookieText(
                text: 'Erro ao carregar ingredientes',
              ),
            );
          },
          itemBuilder: (context, ingredient, idx) {
            return InkWell(
              onTap: () {
                CookieSheetBottom(
                  alignmentTitle: Alignment.center,
                  title: CookieText(
                    text: 'Selecionar quantidade',
                    typography: CookieTypography.title,
                    color: Theme.of(context).colorScheme.onSecondary,
                  ),
                  body: const SheetSelectIngredient(),
                ).show(context);
              },
              child: ContainerIngredient(
                body: CookieText(
                  text: ingredient.name,
                  typography: CookieTypography.button,
                ),
                icon: const Icon(Icons.add),
                onTap: () {},
              ),
            );
          }),
    );
  }
}
