import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/entities/state_manager.dart';

class IntructionCreatePage extends StatefulWidget {
  final CreateRecipeController ct;
  const IntructionCreatePage({super.key, required this.ct});

  @override
  State<IntructionCreatePage> createState() => _IntructionCreatePageState();
}

class _IntructionCreatePageState extends State<IntructionCreatePage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: StateManager.done,
      error: widget.ct.error.toString(),
      errorReload: () => widget.ct.init({}),
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.recipeDifficultyNext,
        margin: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
        onPressed: () {
          if (widget.ct.instructionController.text.length > 50) {
            widget.ct.pageController.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.ease,
            );
          } else {
            final snackBar = SnackBar(
              content: CookieText(
                text: AppLocalizations.of(context)!.recipeWriteAtLeast50Chars,
              ),
              backgroundColor: Theme.of(context).colorScheme.secondary,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
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
                            AppLocalizations.of(
                              context,
                            )!.recipeInstructionsTitle,
                        typography: CookieTypography.title,
                      ),

                      const SizedBox(height: 10),
                      Column(
                        children: [
                          ContainerCreateInfo(
                            svg: IconsSvgEnum.knife,
                            child: CookieTextField(
                              controller: widget.ct.instructionController,
                              maxLines: 10,
                              hintText:
                                  AppLocalizations.of(
                                    context,
                                  )!.recipeWriteInstructionsPlaceholder,
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
