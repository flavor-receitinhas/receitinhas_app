import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_line.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/features/home/presenter/controller/home_controller.dart';
import 'package:app_receitas/src/features/home/presenter/ui/moleculs/container_recipe_home.dart';
import 'package:app_receitas/src/features/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:app_receitas/src/features/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/create_and_edit_recipe_page.dart';
import 'package:app_receitas/src/features/search/presenter/ui/pages/search_page.dart';
import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:domain_receitinhas/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/manager_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ManagerPage<HomeController, HomePage> {
  @override
  void initState() {
    ct.verifyOnboading().then((value) {
      if (value && mounted) {
        Navigator.pushNamed(context, OnBoardingPage.route);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      error: ct.error.toString(),
      errorReload: () async => await ct.init({}),
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        onPressed:
            () => Navigator.pushNamed(context, CreateAndEditRecipePage.route),
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: const CookieSvg(svg: IconsSvgEnum.edit),
      ),
      done:
          () => SafeArea(
            child: RefreshIndicator(
              onRefresh: () async {
                await ct.refresh();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 10, right: 16),
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
                                      AppLocalizations.of(
                                        context,
                                      )!.homePageSubtitle,
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
                                AppLocalizations.of(
                                  context,
                                )!.homePageSearchHint,
                            onTap: () {
                              Navigator.pushNamed(context, SearchPage.route);
                            },
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CookieText(
                                text: 'Em alta!',
                                typography: CookieTypography.title,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              CookieTextButton(
                                text: 'Mais receitas',
                                typography: CookieTypography.body,

                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimary.withValues(alpha: 0.7),
                                suffix: Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.onPrimary
                                      .withValues(alpha: 0.7),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                    SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4,
                      ),
                      itemCount: 2,

                      itemBuilder: (context, index) {
                        final recipe = ct.recipes[index];
                        return ContainerRecipeHome(
                          recipe: recipe,
                          height: double.infinity,
                          width: MediaQuery.sizeOf(context).width / 2 - 16,
                        );
                      },
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CookieLine(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimary.withValues(alpha: 0.3),
                          ),
                          CookieText(
                            text: 'Receita do dia!',
                            typography: CookieTypography.title,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                          const SizedBox(height: 16),
                          ContainerRecipeHome(
                            recipe: RecipeDto(
                              timePrepared: 30,
                              recipeId: '1',
                              title: 'Frango ao Curry',
                              thumb:
                                  'https://www.receiteria.com.br/wp-content/uploads/bolo-de-cenoura-com-cobertura-de-chocolate.jpg',
                            ),
                            width: double.infinity,
                            height: 200,
                          ),
                          const SizedBox(height: 16),
                          CookieText(
                            text: 'Frango ao Curry com Arroz Basmati',
                            typography: CookieTypography.title,
                          ),
                          const SizedBox(height: 8),
                          CookieText(
                            text:
                                'Experimente esta iguaria servida com molho tailandês de amendoim imediatamente.',
                          ),
                          CookieLine(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            color: Theme.of(
                              context,
                            ).colorScheme.onPrimary.withValues(alpha: 0.3),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CookieText(
                                text: 'Novas receitas!',
                                typography: CookieTypography.title,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              CookieTextButton(
                                text: 'Mais receitas',
                                typography: CookieTypography.body,

                                color: Theme.of(
                                  context,
                                ).colorScheme.onPrimary.withValues(alpha: 0.7),
                                suffix: Icon(
                                  Icons.arrow_forward_outlined,
                                  size: 16,
                                  color: Theme.of(context).colorScheme.onPrimary
                                      .withValues(alpha: 0.7),
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 120,
                            child: ListView.builder(
                              itemCount: 4,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: ContainerRecipeHome(
                                    height: 120,
                                    width:
                                        MediaQuery.sizeOf(context).width * 0.5,
                                    recipe: RecipeDto(
                                      recipeId: '1',
                                      title:
                                          'Bolo de cenoura com cobertura de chocolate',
                                      thumb:
                                          'https://www.receiteria.com.br/wp-content/uploads/bolo-de-cenoura-com-cobertura-de-chocolate.jpg',
                                      timePrepared: 45,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}
