import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class CookieButton extends StatelessWidget {
  ///Texto do Botão
  final String label;

  ///Cor do texto do botão
  final Color? labelColor;

  ///Altura do botão
  final double? height;

  //Largura do botão
  final double? width;

  ///Cor de fundo do botão
  final Color? backgroundColor;

  ///Se o botão vai ter borda
  final bool border;

  ///O que o botão ira fazer ao pressionar
  final void Function()? onPressed;

  ///Margem do botão
  final EdgeInsets? margin;

  ///Vem antes do label
  final Widget? prefix;

  ///Caso for selecionado
  final bool isSelect;

  ///Cor da borda
  final Color? borderColor;

  //Define raio da borda
  final BorderRadiusGeometry? borderRadius;

  const CookieButton({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor,
    this.onPressed,
    this.margin,
    this.prefix,
    this.isSelect = false,
    this.borderRadius,
    this.height = 50,
    this.width,
  })  : border = false,
        borderColor = Colors.transparent;

  const CookieButton.outline({
    super.key,
    required this.label,
    this.labelColor,
    this.backgroundColor = Colors.transparent,
    this.onPressed,
    this.margin,
    this.prefix,
    this.isSelect = false,
    this.borderColor,
    this.borderRadius,
    this.height = 50,
    this.width,
  }) : border = true;

  /// CookieButton com Navigator.pop(context)
  ///
  /// Criado para ser usado como um [BackButton]
  /// Deve ser usado sempre no topo da página e deve cobrir toda largura da tela
  ///
  /// `USO: para voltar para página anterior`
  Widget back(BuildContext context) => Row(
        children: [
          CookieButton(
            label: label,
            onPressed: onPressed ?? () => Navigator.pop(context),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            prefix: const Icon(Icons.chevron_left, size: 28),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            labelColor: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        height: height,
        width: width,
        margin: margin,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor ?? Theme.of(context).colorScheme.primary,
          borderRadius: borderRadius ?? BorderRadius.circular(14),
          border: border
              ? Border.all(
                  width: 2,
                  color: borderColor ?? Theme.of(context).colorScheme.primary,
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
              color: labelColor ?? Theme.of(context).colorScheme.onSecondary,
            ),
          ],
        ),
      ),
    );
  }
}
