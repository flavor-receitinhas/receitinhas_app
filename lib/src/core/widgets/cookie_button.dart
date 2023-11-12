import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class CookieButton extends StatelessWidget {
  ///Texto do Botão
  final String label;

  ///Cor do texto do botão
  final Color? labelColor;

  ///Cor de fundo do botão
  final Color? backgroundColor;

  ///Se o botão vai ter borda
  final bool border;

  ///O que o botão ira fazer ao pressionar
  final void Function() onPressed;

  ///Margem do botão
  final EdgeInsets? margin;

  ///Vem antes do label
  final Widget? prefix;

  ///Caso for selecionado
  final bool isSelect;

  final Color? bordeColor;

  const CookieButton({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor,
    required this.onPressed,
    this.margin,
    this.prefix,
    this.isSelect = false,
  }) : border = false, bordeColor = Colors.transparent;

  const CookieButton.outline({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor = Colors.transparent,
    required this.onPressed,
    this.margin,
    this.prefix,
    this.isSelect = false,
    this.bordeColor 
  }) : border = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(14),
          border: border
              ? Border.all(
                  width: 2,
                  color: bordeColor ?? Theme.of(context).colorScheme.primary,
                )
              : const Border(),
        ),
        child: Row(
          mainAxisAlignment: prefix != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            isSelect
                ? Container(
                    height: 25,
                    width: 25,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  )
                : const SizedBox.shrink(),
            prefix ?? const SizedBox.shrink(),
            prefix != null
                ? const SizedBox(width: 10)
                : const SizedBox.shrink(),
            CookieText(
              text: label,
              typography: CookieTypography.button,
              color: labelColor,
            ),
          ],
        ),
      ),
    );
  }
}
