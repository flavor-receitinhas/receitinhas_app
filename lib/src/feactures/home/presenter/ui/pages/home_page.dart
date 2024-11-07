import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/home/presenter/controller/home_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_manager/manager_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ManagerPage<HomeController, HomePage> {
  @override
  void initState() {
    ct.verifyOnboading().then(
      (value) {
        if (value && mounted) {
          Navigator.pushNamed(context, OnBoardingPage.route);
        }
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
      done: () => RefreshIndicator(
        onRefresh: () async {
          await ct.refresh();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomScrollView(
            controller: ct.scrollController,
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
                            text:
                                AppLocalizations.of(context)!.homePageSubtitle,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    CookieTextFieldSearch(
                      hintText:
                          AppLocalizations.of(context)!.homePageSearchHint,
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
              SliverToBoxAdapter(
                child: MasonryGridView.builder(
                  gridDelegate:
                      const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: ct.recipes.length + 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index < ct.recipes.length) {
                      final recipe = ct.recipes[index];
                      return InkWell(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            ViewRecipesPage.route,
                            arguments: {'id': recipe.recipeId},
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2),
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  recipe.thumb ?? Global.imageRecipeDefault,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16),
                                child: CookieText(
                                  text: recipe.title,
                                  color: Colors.white,
                                  maxLine: 2,
                                  overflow: TextOverflow.ellipsis,
                                  typography: CookieTypography.button,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                    if (index >= ct.recipes.length && ct.hasMore) {
                      return Center(
                        child: CircularProgressIndicator(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      );
                    }
                    return SizedBox.shrink();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
