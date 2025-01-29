import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/features/favorite/presenter/controllers/favorite_controller.dart';
import 'package:app_receitas/src/features/favorite/presenter/ui/moleculs/container_recipe.dart';
import 'package:app_receitas/src/features/favorite/presenter/ui/moleculs/organize_recipes.dart';
import 'package:app_receitas/src/features/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_manager/manager_page.dart';

class FavoritePage extends StatefulWidget {
  static const route = '/favorite';
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends ManagerPage<FavoriteController, FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      done: () => RefreshIndicator(
        onRefresh: () async {
          await ct.refreshPage();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomScrollView(
            controller: ct.scrollController,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CookieText(
                          text: AppLocalizations.of(context)!.favoritePageTitle,
                          typography: CookieTypography.title,
                        ),
                        CookieText(
                          text: AppLocalizations.of(context)!
                              .favoritePageSubtitle,
                        ),
                      ],
                    ),
                    const ContainerProfileImage()
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CookieTextFieldSearch(
                      hintText:
                          AppLocalizations.of(context)!.favoritePageSearchHint,
                      controller: ct.favoriteController,
                      onEditingComplete: ct.refreshList,
                    ),
                    const SizedBox(height: 10),
                    OrganizeRecipes(
                      onTapRecent: () {
                        setState(() {
                          ct.order = OrderFavoriteEnum.createdAtAsc;
                          ct.refreshList();
                        });
                        Navigator.pop(context);
                      },
                      onTapOld: () {
                        setState(() {
                          ct.order = OrderFavoriteEnum.createdAtDesc;
                          ct.refreshList();
                        });
                        Navigator.pop(context);
                      },
                      onTapAsc: () {
                        setState(() {
                          ct.order = OrderFavoriteEnum.nameAsc;
                          ct.refreshList();
                        });
                        Navigator.pop(context);
                      },
                      onTapDesc: () async {
                        setState(() {
                          ct.order = OrderFavoriteEnum.nameDesc;
                          ct.refreshList();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              if (ct.listFavorite.isEmpty && !ct.isLoadingSearch)
                SliverToBoxAdapter(
                  child: Center(
                    child: CookieText(
                      text: AppLocalizations.of(context)!
                          .favoritePageNoItemsFound,
                    ),
                  ),
                ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: ct.listFavorite.length + 1,
                  (context, index) {
                    if (ct.isLoadingSearch) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                    if (index < ct.listFavorite.length) {
                      final favorite = ct.listFavorite[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              ViewRecipesPage.route,
                              arguments: {
                                'id': favorite.favorite.recipeId,
                              },
                            );
                          },
                          child: ContainerRecipe(
                            nameRecipe: favorite.favorite.name,
                            imageRecipe: favorite.thumb,
                            timePrepared: favorite.timePrepared,
                            onPressedFavorite: () {
                              CookieDialog(
                                title: CookieText(
                                  text: AppLocalizations.of(context)!
                                      .favoriteRemoveFavoritesTitle,
                                  typography: CookieTypography.title,
                                ),
                                content: CookieText(
                                  text: AppLocalizations.of(context)!
                                      .favoriteRemoveFavoritesContent,
                                ),
                                onPressedConfirm: () async {
                                  await ct.removeFavorite(favorite.favorite.id);
                                  ct.refreshList();
                                  if (context.mounted) {
                                    Navigator.pop(context);
                                  }
                                },
                              ).show(context);
                            },
                          ),
                        ),
                      );
                    }
                    if (index >= ct.listFavorite.length &&
                        ct.hasMore &&
                        ct.listFavorite.isNotEmpty) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
