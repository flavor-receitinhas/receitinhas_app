import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CookieTextSpan extends TextSpan {
  final CookieTypography typography;
  final Color? color;

  const CookieTextSpan(
      {this.typography = CookieTypography.body,
      this.color,
      super.text,
      super.recognizer,
      super.children});
  @override
  TextStyle? get style => GoogleFonts.lexendDecaTextTheme().bodySmall!.copyWith(
        color: color,
        fontSize: typography.size,
        fontWeight: typography.isBold ? FontWeight.bold : FontWeight.normal,
      );
}
