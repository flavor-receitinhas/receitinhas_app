import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/leave_recipe_sheet.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/create_view_recipe_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/info_create_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/ingredient_create_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/introduce_create_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/intruction_create_page.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/pages/server_dish_page.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/manager_page.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class CreateAndEditRecipePage extends StatefulWidget {
  static const route = '/create-recipe';
  const CreateAndEditRecipePage({super.key});

  @override
  State<CreateAndEditRecipePage> createState() =>
      _CreateAndEditRecipePageState();
}

class _CreateAndEditRecipePageState
    extends ManagerPage<CreateRecipeController, CreateAndEditRecipePage> {
  final List<Widget> routes = [];

  @override
  void initState() {
    routes.addAll([
      IntroduceCreatePage(ct: ct),
      InfoCreatePage(ct: ct),
      IngredientCreatePage(ct: ct),
      IntructionCreatePage(ct: ct),
      ServerDishPage(ct: ct),
      CreateViewRecipePage(ct: ct),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      error: ct.error.toString(),
      errorReload: () => ct.init(ct.argumentsMap),
      done:
          () => PopScope(
            canPop: false,
            onPopInvokedWithResult: (didPop, result) {
              if (didPop) {
                return;
              }
              ct.showDialogDiscard()
                  ? CookieSheetBottom(
                    title: CookieText(
                      text: AppLocalizations.of(context)!.recipeDiscardPrompt,
                      color: Theme.of(context).colorScheme.onSecondary,
                      typography: CookieTypography.title,
                    ),
                    body: const LeaveRecipeSheet(),
                  ).show(context)
                  : Navigator.pushNamedAndRemoveUntil(
                    context,
                    CustomBottomBar.route,
                    (route) => false,
                  );
            },
            child: PageView(
              onPageChanged: ct.onChangedPage,
              controller: ct.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: routes,
            ),
          ),
    );
  }
}
