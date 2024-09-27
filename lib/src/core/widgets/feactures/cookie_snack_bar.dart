import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class CookieSnackBar {
  final String text;
  final Color? backgroundColor;
  const CookieSnackBar({required this.text, this.backgroundColor});

  void show(BuildContext context) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: CookieText(text: text),
      backgroundColor:
          backgroundColor ?? Theme.of(context).colorScheme.secondary,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
