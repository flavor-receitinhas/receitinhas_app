import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/favorite/domain/dtos/favorite_user_dto.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/controllers/favorite_controller.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/container_recipe.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/organize_recipes.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritePage extends StatefulWidget {
  static const route = '/favorite';
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController ct = di();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ct.addListener(() {
          setState(() {});
        });
        ct.init();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      done: () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomScrollView(
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
                      onEditingComplete: ct.refreshPage,
                    ),
                    const SizedBox(height: 10),
                    OrganizeRecipes(
                      onTapRecent: () {
                        setState(() {
                          ct.order = OrderFavoriteEnum.createdAtAsc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                      onTapOld: () {
                        setState(() {
                          ct.order = OrderFavoriteEnum.createdAtDesc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                      onTapAsc: () {
                        setState(() {
                          ct.order = OrderFavoriteEnum.nameAsc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                      onTapDesc: () async {
                        setState(() {
                          ct.order = OrderFavoriteEnum.nameDesc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              PagedSliverList<int, FavoriteUserDto>(
                pagingController: ct.pagingController,
                builderDelegate: PagedChildBuilderDelegate<FavoriteUserDto>(
                  animateTransitions: true,
                  firstPageErrorIndicatorBuilder: (context) {
                    return Center(
                      child: CookieText(
                        text: AppLocalizations.of(context)!
                            .favoritePageErrorLoading,
                      ),
                    );
                  },
                  noItemsFoundIndicatorBuilder: (context) {
                    return Center(
                      child: CookieText(
                        text: AppLocalizations.of(context)!
                            .favoritePageNoItemsFound,
                      ),
                    );
                  },
                  newPageErrorIndicatorBuilder: (context) {
                    return Center(
                      child: CookieText(
                        text: AppLocalizations.of(context)!
                            .favoritePageErrorLoading,
                      ),
                    );
                  },
                  itemBuilder: (context, favorite, idx) {
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
                                ct.refreshPage();
                                if (context.mounted) {
                                  Navigator.pop(context);
                                }
                              },
                            ).show(context);
                          },
                        ),
                      ),
                    );
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
