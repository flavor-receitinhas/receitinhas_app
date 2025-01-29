import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:app_receitas/src/features/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/features/search/presenter/ui/moleculs/recipe_search_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ResultRecipes extends StatelessWidget {
  final ResearchController ct;
  const ResultRecipes({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return PagedSliverList<int, RecipeDto>(
      pagingController: ct.pagingController,
      builderDelegate: PagedChildBuilderDelegate<RecipeDto>(
        animateTransitions: true,
        firstPageErrorIndicatorBuilder: (context) {
          return Center(
            child: CookieText(
              text: AppLocalizations.of(context)!.favoritePageErrorLoading,
            ),
          );
        },
        noItemsFoundIndicatorBuilder: (context) {
          return Center(
            child: CookieText(
              text: AppLocalizations.of(context)!.favoritePageNoItemsFound,
            ),
          );
        },
        newPageErrorIndicatorBuilder: (context) {
          return Center(
            child: CookieText(
              text: AppLocalizations.of(context)!.favoritePageErrorLoading,
            ),
          );
        },
        itemBuilder: (context, recipe, idx) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
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
        },
      ),
    );
  }
}
