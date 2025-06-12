import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/ingredient_select_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/container_ingredient.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/sheet_select_ingredient.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ListAllIngredients extends StatelessWidget {
  final IngredientSelectController ct;
  const ListAllIngredients({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ct,
      builder: (context, child) {
        if (ct.ingredients.isEmpty && ct.isLoading) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (ct.ingredients.isEmpty && ct.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: CookieText(
                text: AppLocalizations.of(context)!.recipeLoadIngredientsError,
              ),
            ),
          );
        }

        if (ct.ingredients.isEmpty) {
          return SliverToBoxAdapter(
            child: Column(
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
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index < ct.ingredients.length) {
                final ingredient = ct.ingredients[index];
                return InkWell(
                  onTap: () {
                    CookieSheetBottom(
                      alignmentTitle: Alignment.center,
                      title: CookieText(
                        text:
                            AppLocalizations.of(context)!.recipeSelectQuantity,
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
              } else if (ct.isLoadingMore) {
                return const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (ct.hasError) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: CookieText(
                      text: AppLocalizations.of(context)!
                          .recipeLoadIngredientsError,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
            childCount: ct.ingredients.length +
                (ct.isLoadingMore || ct.hasError ? 1 : 0),
          ),
        );
      },
    );
  }
}
