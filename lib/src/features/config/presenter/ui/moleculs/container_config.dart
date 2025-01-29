import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';

class ContainerConfig extends StatelessWidget {
  final IconsSvgEnum icon;
  final String text;
  final Color? textColor;
  final Widget? action;

  final void Function()? onTap;
  const ContainerConfig(
      {super.key,
      required this.icon,
      required this.text,
      this.action,
      this.onTap,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: theme.secondary,
        ),
        child: Row(
          children: [
            CookieSvg(
              svg: icon,
              height: 20,
            ),
            const SizedBox(width: 15),
            CookieText(
                text: text,
                color: textColor ?? theme.onPrimary.withOpacity(0.7)),
            const Spacer(),
            action ?? const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
