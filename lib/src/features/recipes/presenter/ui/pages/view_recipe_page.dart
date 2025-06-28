import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_page.dart';
import 'package:app_receitas/src/features/profile/presenter/ui/pages/profile_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/view_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/view_details_recipe.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/view_introduce_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:page_manager/export_manager.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ViewRecipesPage extends StatefulWidget {
  static const route = '/view-recipe';
  const ViewRecipesPage({super.key});

  @override
  State<ViewRecipesPage> createState() => _ViewRecipesPageState();
}

class _ViewRecipesPageState
    extends ManagerPage<ViewRecipeController, ViewRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      error: ct.error.toString(),
      errorReload: () async => await ct.init(ct.argumentsMap),
      state: ct.state,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: CookieButton(
          label: AppLocalizations.of(context)!.recipeDifficultyBack,
        ).back(context),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: CookieButton(
      //     label: 'Preparar esta receita',
      //     onPressed: () {},
      //   ),
      // ),
      done: () => SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 10),
            FlutterCarousel(
                options: FlutterCarouselOptions(
                  height: 250,
                  showIndicator: true,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  padEnds: false,
                ),
                items: ct.images
                    .map((e) => Image.network(e.link, fit: BoxFit.cover))
                    .toList()),
            const SizedBox(height: 10),
            ViewIntroduceRecipe(
              title: ct.recipe.recipe.title,
              difficultyRecipe: ct.recipe.recipe.difficultyRecipe.name,
              portion: ct.recipe.recipe.portion,
              subTitle: ct.recipe.recipe.subTitle,
              timePrepared: ct.recipe.recipe.timePrepared,
              isCreate: ct.recipe.recipe.userId == Global.user!.id,
              isFavorite: ct.favoriteRecipeDto!.exists,
              userName: ct.recipe.authorName,
              onPressedUser: () {
                ct.recipe.recipe.userId == Global.user!.id
                    ? Navigator.pushNamed(
                        context,
                        ProfilePage.route,
                      )
                    : Navigator.pushNamed(
                        context,
                        ProfilePage.route,
                        arguments: {'id': ct.recipe.recipe.userId},
                      );
              },
              onPressedFavorite: () {
                ct.addAndRemoveFavorite();
              },
            ),
            const SizedBox(height: 20),
            ViewDetailsRecipe(
              details: ct.recipe.recipe.details!,
              ingredients: ct.ingredients,
              serveFood: ct.recipe.recipe.serveFood!,
              instruction: ct.recipe.recipe.instruction,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
