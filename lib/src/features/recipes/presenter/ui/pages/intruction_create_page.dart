import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final colorText = Theme.of(context).colorScheme.onPrimary;
    TextStyle baseStyle = GoogleFonts.lexendDeca(color: colorText);

    // Personaliza os estilos padrão para usar o baseStyle
    DefaultStyles defaultStyles = DefaultStyles(
      paragraph: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 16),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      placeHolder: DefaultTextBlockStyle(
        baseStyle.copyWith(
          color: colorText.withValues(alpha: 0.5),
          fontSize: 16,
        ),
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
        baseStyle.copyWith(color: colorText, fontSize: 16),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
        null,
      ),
    );

    return CookiePage(
      state: StateManager.done,
      error: widget.ct.error.toString(),
      errorReload: () => widget.ct.init({}),
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.recipeDifficultyNext,
        margin: const EdgeInsets.only(left: 16, bottom: 10, right: 16),
        onPressed: () {
          if (widget.ct.quillInstructionController.document
                  .toPlainText()
                  .length >
              50) {
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
                      QuillSimpleToolbar(
                        controller: widget.ct.quillInstructionController,
                        config: QuillSimpleToolbarConfig(
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
                            svg: IconsSvgEnum.knife,
                            child: QuillEditor.basic(
                              controller: widget.ct.quillInstructionController,
                              config: QuillEditorConfig(
                                customStyles: defaultStyles,
                                minHeight: 200,
                                placeholder:
                                    AppLocalizations.of(
                                      context,
                                    )!.recipeWriteInstructionsPlaceholder,
                              ),
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
