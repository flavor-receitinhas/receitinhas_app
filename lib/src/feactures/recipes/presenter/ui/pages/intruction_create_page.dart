import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

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
    TextStyle baseStyle = GoogleFonts.lexendDeca(
      color: colorText,
    );

    // Personaliza os estilos padrão para usar o baseStyle
    DefaultStyles defaultStyles = DefaultStyles(
      paragraph: DefaultTextBlockStyle(
          baseStyle.copyWith(
            fontSize: 16,
          ),
          const VerticalSpacing(0, 0),
          const VerticalSpacing(0, 0),
          null),
      placeHolder: DefaultTextBlockStyle(
        baseStyle.copyWith(color: colorText.withOpacity(0.5), fontSize: 16),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h1: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h2: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h3: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      lists: DefaultListBlockStyle(
        baseStyle.copyWith(
          color: colorText,
          fontSize: 16,
        ),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
        null,
      ),
    );
    print(QuillDeltaToHtmlConverter(
            widget.ct.quillController.document.toDelta().toJson())
        .convert());
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: 'Próximo',
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
            CookieButton(
              label: 'Voltar',
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
                  const CookieText(
                    text: 'Instruções de preparo',
                    typography: CookieTypography.title,
                  ),
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
                      controller: widget.ct.quillController,
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
                        iconSvg: 'assets/icons/knife.svg',
                        child: QuillEditor.basic(
                          configurations: QuillEditorConfigurations(
                            customStyles: defaultStyles,
                            controller: widget.ct.quillController,
                            minHeight: 200,
                            placeholder: 'Escreva as instruções de preparo...',
                          ),
                        ),
                      )
                    ],
                  ),
                  // ContainerCreateInfo(
                  //   iconSvg: 'assets/icons/knife.svg',
                  //   child:

                  // child: CookieTextField.outline(
                  //   controller: ct.instructionController,
                  //   hintText: 'Escreva as instruções de preparo...',
                  //   minLines: 5,
                  //   validator: (value) {
                  //     if (value != null && value.length < 30) {
                  //       return "Escreva mais algumas instruções";
                  //     }
                  //     return null;
                  //   },
                  // ),
                  //  ),
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
