import 'dart:convert';

import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/recipes/domain/dtos/ingredient_recipe_dto.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:flutter_quill/quill_delta.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart'
    hide DefaultStyles;
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class ViewDetailsRecipe extends StatelessWidget {
  final String details;
  final List<IngredientRecipeDto> ingredients;
  final String instruction;
  final String serveFood;
  const ViewDetailsRecipe({
    super.key,
    required this.details,
    required this.ingredients,
    required this.instruction,
    required this.serveFood,
  });

  bool _isHtmlEmpty(String html) {
    if (html.isEmpty) return true;

    final RegExp htmlTagRegex = RegExp(r'<[^>]*>');
    final String textOnly = html.replaceAll(htmlTagRegex, '').trim();

    final String cleanText = textOnly.replaceAll(RegExp(r'\s+'), '');

    return cleanText.isEmpty;
  }

  bool _isValidJson(String str) {
    try {
      jsonDecode(str);
      return true;
    } catch (e) {
      return false;
    }
  }

  bool _isQuillContentEmpty(String jsonStr) {
    if (!_isValidJson(jsonStr)) return false;

    try {
      final List<dynamic> delta = jsonDecode(jsonStr);

      for (var operation in delta) {
        if (operation is Map<String, dynamic> && operation['insert'] != null) {
          final String insert = operation['insert'].toString();
          final String cleanInsert = insert.replaceAll(RegExp(r'\s+'), '');
          if (cleanInsert.isNotEmpty) {
            return false;
          }
        }
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CookieText(
          text: AppLocalizations.of(context)!.recipeDetailsTitle,
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        CookieText(text: details),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                    text: AppLocalizations.of(context)!.recipeIngredientsTitle,
                    typography: CookieTypography.title,
                  ),
                  const CookieSvg(svg: IconsSvgEnum.carrot),
                ],
              ),
              const SizedBox(height: 10),
              ListView.builder(
                itemCount: ingredients.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var quantity = ingredients[index].quantity;
                  var formattedQuantity =
                      quantity % 1 == 0 ? quantity.toInt() : quantity;
                  return CookieText(
                    text:
                        '${ingredients[index].ingredientName} - $formattedQuantity ${ingredients[index].unit}',
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: CookieText(
                      text:
                          AppLocalizations.of(context)!.recipeInstructionsTitle,
                      typography: CookieTypography.title,
                    ),
                  ),
                  const CookieSvg(svg: IconsSvgEnum.knife),
                ],
              ),
              const SizedBox(height: 20),
              Visibility(
                visible:
                    !_isHtmlEmpty(instruction) &&
                    !(_isValidJson(instruction) &&
                        _isQuillContentEmpty(instruction)),
                child:
                    _isValidJson(instruction)
                        ? QuillEditor.basic(
                          controller: QuillController(
                            document: Document.fromDelta(
                              Delta.fromJson(jsonDecode(instruction)),
                            ),
                            selection: const TextSelection.collapsed(offset: 0),
                          ),
                          config: QuillEditorConfig(
                            enableScribble: false,
                            enableInteractiveSelection: false,
                            padding: EdgeInsets.zero,
                            customStyles: DefaultStyles(
                              paragraph: DefaultTextBlockStyle(
                                TextStyle(color: theme.onPrimary),
                                HorizontalSpacing.zero,
                                VerticalSpacing.zero,
                                VerticalSpacing.zero,
                                null,
                              ),
                            ),
                          ),
                        )
                        : HtmlWidget(
                          instruction,
                          textStyle: TextStyle(color: theme.onPrimary),
                        ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Visibility(
          visible:
              !_isHtmlEmpty(serveFood) &&
              !(_isValidJson(serveFood) && _isQuillContentEmpty(serveFood)),
          child: CustomContainer(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CookieText(
                      text: AppLocalizations.of(context)!.recipeServeFoodTitle,
                      typography: CookieTypography.title,
                    ),
                    const CookieSvg(svg: IconsSvgEnum.pan),
                  ],
                ),
                const SizedBox(height: 20),
                _isValidJson(serveFood)
                    ? QuillEditor.basic(
                      controller: QuillController(
                        document: Document.fromDelta(
                          Delta.fromJson(jsonDecode(serveFood)),
                        ),
                        selection: const TextSelection.collapsed(offset: 0),
                      ),
                      config: QuillEditorConfig(
                        enableScribble: false,
                        enableInteractiveSelection: false,
                        padding: EdgeInsets.zero,
                        customStyles: DefaultStyles(
                          paragraph: DefaultTextBlockStyle(
                            TextStyle(color: theme.onPrimary),
                            HorizontalSpacing.zero,
                            VerticalSpacing.zero,
                            VerticalSpacing.zero,
                            null,
                          ),
                        ),
                      ),
                    )
                    : HtmlWidget(
                      serveFood,
                      textStyle: TextStyle(color: theme.onPrimary),
                    ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
