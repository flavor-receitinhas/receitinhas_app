import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/entities/state_manager.dart';

class ServerDishPage extends StatefulWidget {
  final CreateRecipeController ct;
  const ServerDishPage({super.key, required this.ct});

  @override
  State<ServerDishPage> createState() => _ServerDishPageState();
}

class _ServerDishPageState extends State<ServerDishPage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: StateManager.done,
      error: widget.ct.error.toString(),
      errorReload: () => widget.ct.init({}),
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.recipeFinish,
        margin: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
        onPressed: () {
          widget.ct.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      done:
          () => SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                CookieButton(
                  label: AppLocalizations.of(context)!.recipeDifficultyBack,
                  onPressed: () {
                    widget.ct.pageController.previousPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease,
                    );
                  },
                ).back(context),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CookieText(
                        text:
                            AppLocalizations.of(context)!.recipeServeTimeTitle,
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 20),
                      CookieText(
                        text:
                            AppLocalizations.of(
                              context,
                            )!.recipeFinalConsideration,
                      ),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ContainerCreateInfo(
                            svg: IconsSvgEnum.pan,
                            child: CookieTextField(
                              controller: widget.ct.serverController,
                              maxLines: 10,
                              hintText:
                                  AppLocalizations.of(
                                    context,
                                  )!.recipeServeDetailsPlaceholder,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
