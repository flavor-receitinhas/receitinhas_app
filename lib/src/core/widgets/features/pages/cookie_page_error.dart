import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class CookiePageError extends StatelessWidget {
  final String errorMessage;
  final void Function() onReload;
  const CookiePageError({
    super.key,
    required this.errorMessage,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            const CookieText(text: '404', typography: CookieTypography.title),
            CookieText(text: errorMessage),
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.errorPageReload,
              onPressed: onReload,
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
