import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/image_profile_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/my_profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/appbar_profile.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:page_manager/manager_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewProfilePage extends StatefulWidget {
  static const route = '/view-profile';
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState
    extends ManagerPage<MyProfileController, ViewProfilePage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      done: () => SafeArea(
        child: ListView(
          controller: ct.scrollController,
          children: [
            AppBarProfile(
              title: AppLocalizations.of(context)!.profileViewProfilePageTitle,
              subTitle:
                  AppLocalizations.of(context)!.profileViewProfilePageSubtitle,
            ),
            CookieButton(
              label: AppLocalizations.of(context)!.profileViewProfilePageBack,
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            CookieText(
                              text: ct.profile!.name,
                              typography: CookieTypography.title,
                            ),
                            const SizedBox(height: 10),
                            CookieText(
                              text: ct.profile!.biography,
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundImage: ct.profile!.image != null &&
                                ct.profile!.image!.isNotEmpty
                            ? NetworkImage(ct.profile!.image!)
                            : AssetImage(ImageProfileEnum.avatar.path)
                                as ImageProvider,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CookieTextFieldSearch(
                    hintText: AppLocalizations.of(context)!
                        .profileViewProfilePageSearchHint,
                  ),
                  const SizedBox(height: 20),
                  if (ct.recipes.isEmpty)
                    CookieText(
                      text: AppLocalizations.of(context)!
                          .profileMyProfilePageNoRecipes,
                      typography: CookieTypography.button,
                    ),
                  MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
