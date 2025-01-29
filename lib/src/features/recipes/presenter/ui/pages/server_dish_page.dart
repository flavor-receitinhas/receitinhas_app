import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';

import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ServerDishPage extends StatefulWidget {
  final CreateRecipeController ct;
  const ServerDishPage({super.key, required this.ct});

  @override
  State<ServerDishPage> createState() => _ServerDishPageState();
}

class _ServerDishPageState extends State<ServerDishPage> {
  @override
  Widget build(BuildContext context) {
    final colorText = Theme.of(context).colorScheme.onPrimary;
    TextStyle baseStyle = GoogleFonts.lexendDeca(
      color: colorText,
    );

    // Personaliza os estilos padrão para usar o baseStyle
    DefaultStyles defaultStyles = DefaultStyles(
      paragraph: DefaultTextBlockStyle(
          baseStyle.copyWith(
            fontSize: 16,
          ),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(0, 0),
          const VerticalSpacing(0, 0),
          null),
      placeHolder: DefaultTextBlockStyle(
        baseStyle.copyWith(color: colorText.withOpacity(0.5), fontSize: 16),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h1: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h2: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h3: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      lists: DefaultListBlockStyle(
        baseStyle.copyWith(
          color: colorText,
          fontSize: 16,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
        null,
      ),
    );
    // print(QuillDeltaToHtmlConverter(
    //         widget.ct.quillServerController.document.toDelta().toJson())
    //     .convert());
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.recipeFinish,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onPressed: () {
          widget.ct.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      body: SafeArea(
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CookieText(
                    text: AppLocalizations.of(context)!.recipeServeTimeTitle,
                    typography: CookieTypography.title,
                  ),
                  const SizedBox(height: 20),
                  CookieText(
                    text:
                        AppLocalizations.of(context)!.recipeFinalConsideration,
                  ),
                  const SizedBox(height: 10),
                  QuillToolbar.simple(
                    configurations: QuillSimpleToolbarConfigurations(
                      buttonOptions: QuillSimpleToolbarButtonOptions(
                        selectHeaderStyleDropdownButton:
                            QuillToolbarSelectHeaderStyleDropdownButtonOptions(
                          textStyle: baseStyle,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controller: widget.ct.quillServerController,
                      showAlignmentButtons: false,
                      showCodeBlock: false,
                      showDividers: false,
                      showFontFamily: false,
                      showFontSize: false,
                      showLink: false,
                      showColorButton: false,
                      showBackgroundColorButton: false,
                      showQuote: false,
                      showSubscript: false,
                      showSuperscript: false,
                      showListCheck: false,
                      showSearchButton: false,
                      showInlineCode: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      ContainerCreateInfo(
                        svg: IconsSvgEnum.pan,
                        child: QuillEditor.basic(
                          configurations: QuillEditorConfigurations(
                            customStyles: defaultStyles,
                            controller: widget.ct.quillServerController,
                            minHeight: 200,
                            placeholder: AppLocalizations.of(context)!
                                .recipeServeDetailsPlaceholder,
                          ),
                        ),
                      )
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
