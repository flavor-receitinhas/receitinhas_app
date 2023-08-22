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

  const CookieButton({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor,
    this.border = false,
    required this.onPressed,
    this.margin,
    this.prefix,
  });

  const CookieButton.outline({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor = Colors.transparent,
    this.border = true,
    required this.onPressed,
    this.margin,
    this.prefix,
  });

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
                  color: labelColor ?? Theme.of(context).colorScheme.primary,
                )
              : const Border(),
        ),
        child: Row(
          mainAxisAlignment: prefix != null
              ? MainAxisAlignment.start
              : MainAxisAlignment.center,
          children: [
            prefix ?? const SizedBox.shrink(),
            prefix != null ? const SizedBox(width: 10) : const SizedBox.shrink(),
            CookieText(
              text: label,
              typography: CookieTypography.button,
              color: border
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
