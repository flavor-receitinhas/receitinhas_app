import 'dart:io';

import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/domain/mappers/ingredient_recipe_dto_mapper.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/view_details_recipe.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/view_introduce_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:page_manager/entities/state_manager.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class CreateViewRecipePage extends StatelessWidget {
  final CreateRecipeController ct;
  const CreateViewRecipePage({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: StateManager.done,
      error: ct.error.toString(),
      errorReload: () => ct.init({}),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CookieButton(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        label: AppLocalizations.of(context)!.recipeFinish,
        onPressed: () async {
          if (ct.isEditRecipe) {
            await ct.updateRecipe();
            if (context.mounted) {
              Navigator.pop(context, true);
            }
          } else {
            await ct.createRecipe();
            if (context.mounted) {
              Navigator.pop(context);
            }
          }
        },
      ),
      done:
          () => SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 10),
                CookieButton(
                  label:
                      AppLocalizations.of(context)!.profileViewProfilePageBack,
                  onPressed: () {
                    ct.pageController.previousPage(
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
                    children: [
                      FlutterCarousel(
                        options: FlutterCarouselOptions(
                          height: 250,
                          showIndicator: true,
                          autoPlay: true,
                          viewportFraction: 1,
                          autoPlayAnimationDuration: const Duration(
                            milliseconds: 500,
                          ),
                          padEnds: false,
                        ),
                        items:
                            ct.listImagesRecipe
                                .map(
                                  (e) =>
                                      ct.validateStringIsUrl(e)
                                          ? Image.network(e, fit: BoxFit.cover)
                                          : Image.file(
                                            File(e),
                                            fit: BoxFit.cover,
                                          ),
                                )
                                .toList(),
                      ),
                      const SizedBox(height: 10),
                      ViewIntroduceRecipe(
                        isCreate: true,
                        title: ct.titleController.text,
                        difficultyRecipe: ct.difficultyRecipeString,
                        portion: ct.portion,
                        subTitle: ct.subTitleController.text,
                        timePrepared: ct.timePreparedRecipe.inMinutes,
                        userName: Global.profile!.name,
                      ),
                      const SizedBox(height: 20),
                      ViewDetailsRecipe(
                        details: ct.detailsController.text,
                        ingredients:
                            ct.listIngredientSelect
                                .map(
                                  (e) => IngredientRecipeDtoMapper().toDto(e),
                                )
                                .toList(),
                        instruction:
                            QuillDeltaToHtmlConverter(
                              ct.quillInstructionController.document
                                  .toDelta()
                                  .toJson(),
                            ).convert(),
                        serveFood:
                            ct.quillServerController.document
                                    .toPlainText()
                                    .trim()
                                    .isEmpty
                                ? ''
                                : QuillDeltaToHtmlConverter(
                                  ct.quillServerController.document
                                      .toDelta()
                                      .toJson(),
                                ).convert(),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).padding.bottom + 50),
              ],
            ),
          ),
    );
  }
}
