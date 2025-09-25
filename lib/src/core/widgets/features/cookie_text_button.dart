import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';

class CookieTextButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  final CookieTypography? typography;
  final Widget? suffix;
  const CookieTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.typography,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CookieText(
            text: text,
            color: color,
            typography: typography ?? CookieTypography.body,
          ),
          if (suffix != null) ...[const SizedBox(width: 6), suffix!],
        ],
      ),
    );
  }
}
