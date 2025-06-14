import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_snack_bar.dart';
import 'package:app_receitas/src/features/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/leave_recipe_sheet.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/select_image_recipe.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/moleculs/carousel_select_images_recipe.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class IntroduceCreatePage extends StatefulWidget {
  final CreateRecipeController ct;
  const IntroduceCreatePage({super.key, required this.ct});

  @override
  State<IntroduceCreatePage> createState() => _IntroduceCreatePageState();
}

class _IntroduceCreatePageState extends State<IntroduceCreatePage> {
  CreateRecipeController get ct => widget.ct;
  final formKey = GlobalKey<FormState>();
  final _carouselController = CarouselController();

  @override
  void dispose() {
    _carouselController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
        child: CookieButton(
          label: AppLocalizations.of(context)!.recipeDifficultyNext,
          margin: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
          onPressed: () {
            if (formKey.currentState!.validate() &&
                ct.listImagesRecipe.isNotEmpty) {
              ct.pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            }
            if (ct.listImagesRecipe.isEmpty) {
              CookieSnackBar(
                text: AppLocalizations.of(context)!.recipeAddImage,
              ).show(context);
              return;
            }
            if (ct.thumbImage == null) {
              CookieSnackBar(
                text: AppLocalizations.of(context)!.recipeAddCoverImage,
              ).show(context);
              return;
            }
            if (!formKey.currentState!.validate()) {
              CookieSnackBar(
                text: AppLocalizations.of(context)!.recipeFillAllFields,
              ).show(context);
              return;
            }
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                CookieButton(
                  prefix: const Icon(Icons.chevron_left, size: 28),
                  label: AppLocalizations.of(context)!.recipeDifficultyBack,
                  onPressed: () {
                    ct.showDialogDiscard()
                        ? CookieSheetBottom(
                          title: CookieText(
                            text:
                                AppLocalizations.of(
                                  context,
                                )!.recipeDiscardPrompt,
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
                        text: AppLocalizations.of(context)!.recipePhotosTitle,
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 10),
                      CarouselSelectImagesRecipe(
                        ct: ct,
                        carouselController: _carouselController,
                      ),
                      const SizedBox(height: 20),
                      CookieText(
                        text: AppLocalizations.of(context)!.recipeCoverTitle,
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 10),
                      SelectImageRecipe(
                        hasImage: ct.thumbImage != null,
                        onTap: () async {
                          await ct.pickThumb();
                          setState(() {});
                        },
                        image: ct.thumbImage,
                        child: Center(
                          child:
                              ct.thumbImage != null
                                  ? Image.file(ct.thumbImage!, height: 250)
                                  : const SizedBox.shrink(),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CookieTextField.outline(
                        hintText: AppLocalizations.of(context)!.recipeTitleHint,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        maxLength: 50,
                        maxLines: 1,
                        controller: ct.titleController,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 3) {
                            return AppLocalizations.of(
                              context,
                            )!.recipeTitleValidation;
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      CookieTextField.outline(
                        hintText:
                            AppLocalizations.of(context)!.recipeSubtitleHint,
                        controller: ct.subTitleController,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                          topLeft: Radius.circular(16),
                        ),
                        maxLength: 100,
                        maxLines: 3,
                      ),
                      const SizedBox(height: 20),
                      CookieText(
                        text: AppLocalizations.of(context)!.recipeAboutTitle,
                        typography: CookieTypography.title,
                      ),
                      const SizedBox(height: 20),
                      CookieTextField.outline(
                        hintText: AppLocalizations.of(context)!.recipeAboutHint,
                        controller: ct.detailsController,
                        minLines: 5,
                        maxLines: 10,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 10) {
                            return AppLocalizations.of(
                              context,
                            )!.recipeAboutValidation;
                          }
                          return null;
                        },
                      ),
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
