import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:app_receitas/src/features/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/features/search/presenter/ui/moleculs/recipe_search_container.dart';
import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ResultRecipes extends StatelessWidget {
  final ResearchController ct;
  const ResultRecipes({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: ct,
      builder: (context, child) {
        if (ct.recipes.isEmpty && ct.isLoading) {
          return const SliverToBoxAdapter(
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (ct.recipes.isEmpty && ct.hasError) {
          return SliverToBoxAdapter(
            child: Center(
              child: CookieText(
                text: AppLocalizations.of(context)!.favoritePageErrorLoading,
              ),
            ),
          );
        }

        if (ct.recipes.isEmpty) {
          return SliverToBoxAdapter(
            child: Center(
              child: CookieText(
                text: AppLocalizations.of(context)!.favoritePageNoItemsFound,
              ),
            ),
          );
        }

        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              if (index < ct.recipes.length) {
                final recipe = ct.recipes[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    bottom: 10,
                    left: 16,
                    right: 16,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ViewRecipesPage.route,
                        arguments: {'id': recipe.recipeId},
                      );
                    },
                    child: RecipeSearchContainer(
                      image: recipe.thumb ?? Global.imageRecipeDefault,
                      title: recipe.title,
                      timePrepared: recipe.timePrepared,
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
                      text:
                          AppLocalizations.of(
                            context,
                          )!.favoritePageErrorLoading,
                    ),
                  ),
                );
              }
              return const SizedBox.shrink();
            },
            childCount:
                ct.recipes.length + (ct.isLoadingMore || ct.hasError ? 1 : 0),
          ),
        );
      },
    );
  }
}
