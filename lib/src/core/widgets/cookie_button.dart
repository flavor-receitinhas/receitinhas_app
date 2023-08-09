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
  final bool enableBorder;

  ///O que o botão ira fazer ao pressionar
  final void Function() onPressed;

  ///Margem do botão
  final EdgeInsets? margin;

  const CookieButton({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor,
    this.enableBorder = false,
    required this.onPressed,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 50,
        margin: margin,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.black,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(width: enableBorder ? 0 : 2, color: Colors.black),
        ),
        child: CookieText(
          text: label,
          color: labelColor ?? Colors.white,
        ),
      ),
    );
  }
}
