import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/ingredient_select_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/container_ingredient.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/sheet_select_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          return  Center(
            child: CookieText(
              text: AppLocalizations.of(context)!.recipeLoadIngredientsError,
            ),
          );
        },
        noItemsFoundIndicatorBuilder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CookieText(
                text: AppLocalizations.of(context)!.recipeNoItemsFound,
              ),
              CookieTextButton(
                text: AppLocalizations.of(context)!.recipeAddIngredient,
                color: Theme.of(context).colorScheme.primary,
                onPressed: () {
                  CookieSheetBottom(
                    alignmentTitle: Alignment.center,
                    title: CookieText(
                      text: AppLocalizations.of(context)!
                          .recipeIngredientNotFound,
                      typography: CookieTypography.title,
                      color: Theme.of(context).colorScheme.onSecondary,
                    ),
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CookieText(
                          text: AppLocalizations.of(context)!
                              .recipeEnterIngredientBelow,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        const SizedBox(height: 10),
                        CookieTextField.outline(
                          hintText: AppLocalizations.of(context)!
                              .recipeEnterIngredientHint,
                          maxLength: 50,
                          controller: ct.ingredientController,
                        ),
                        const SizedBox(height: 20),
                        CookieButton(
                          label: AppLocalizations.of(context)!.recipeConfirm,
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
          return Center(
            child: CookieText(
              text: AppLocalizations.of(context)!.recipeLoadIngredientsError,
            ),
          );
        },
        itemBuilder: (context, ingredient, idx) {
          return InkWell(
            onTap: () {
              CookieSheetBottom(
                alignmentTitle: Alignment.center,
                title: CookieText(
                  text: AppLocalizations.of(context)!.recipeSelectQuantity,
                  typography: CookieTypography.title,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                body: SheetSelectIngredient(
                  ct: ct,
                  ingredient: ingredient,
                ),
              ).show(context);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ContainerIngredient(
                body: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CookieText(
                      text: ingredient.name,
                      typography: CookieTypography.button,
                    ),
                  ],
                ),
                icon: const Icon(Icons.add),
              ),
            ),
          );
        },
      ),
    );
  }
}
