import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class CookiePageError extends StatelessWidget {
  final String errorMessage;
  final void Function()? onReload;
  const CookiePageError({
    super.key,
    required this.errorMessage,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                ImagesEnum.eggError.path,
                height: MediaQuery.sizeOf(context).height * 0.33,
              ),
              const SizedBox(height: 10),
              CookieText(text: errorMessage),
              if (onReload != null) ...[
                const SizedBox(height: 10),
                CookieButton(
                  label: AppLocalizations.of(context)!.errorPageReload,
                  onPressed: onReload,
                ),
              ],
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
