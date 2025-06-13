import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class IntroduceConfig extends StatelessWidget {
  const IntroduceConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CookieText(
                text: AppLocalizations.of(context)!.configSettings,
                typography: CookieTypography.title,
                color: Theme.of(context).colorScheme.primary,
              ),
              CookieText(
                text: AppLocalizations.of(context)!.configCustomizePreference,
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        const ContainerProfileImage(),
      ],
    );
  }
}
