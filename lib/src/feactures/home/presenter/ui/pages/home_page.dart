import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/home/presenter/controller/home_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/manager_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ManagerPage<HomeController, HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ct.verifyOnboading().then(
          (value) {
            if (value && mounted) {
              Navigator.pushNamed(context, OnBoardingPage.route);
            }
          },
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateRecipePage.route);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const CookieSvg(svg: IconsSvgEnum.edit),
      ),
      done: () => SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CookieText(
                          text:
                              '${AppLocalizations.of(context)!.homePageGreeting}, ${Global.profile?.name}',
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis,
                          typography: CookieTypography.title,
                        ),
                        CookieText(
                          text: AppLocalizations.of(context)!.homePageSubtitle,
                        ),
                      ],
                    ),
                  ),
                  const ContainerProfileImage(),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  CookieTextFieldSearch(
                    hintText: AppLocalizations.of(context)!.homePageSearchHint,
                    onTap: () {
                      Navigator.pushNamed(context, SearchPage.route);
                    },
                  ),
                  const SizedBox(height: 20),
                  CookieText(
                    text: AppLocalizations.of(context)!
                        .homePageLatestRecipesTitle,
                    typography: CookieTypography.title,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            PagedSliverList<int, RecipeDto>(
              pagingController: ct.pagingController,
              builderDelegate: PagedChildBuilderDelegate<RecipeDto>(
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
                itemBuilder: (context, recipe, idx) {
                  return MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: ct.recipes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            recipe.thumb ?? Global.imageRecipeDefault,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
