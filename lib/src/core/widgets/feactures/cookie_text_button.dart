import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:flutter/material.dart';

class CookieTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final CookieTypography? typography;
  const CookieTextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.color,
      this.typography});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: CookieText(
        text: text,
        color: color,
        typography: typography ?? CookieTypography.body,
      ),
    );
  }
}
