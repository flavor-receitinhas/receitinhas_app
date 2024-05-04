import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:flutter/material.dart';

class IntroduceConfig extends StatelessWidget {
  const IntroduceConfig({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CookieText(
              text: 'Configurações',
              typography: CookieTypography.title,
              color: Theme.of(context).colorScheme.primary,
            ),
            const CookieText(
              text: 'Personalize conforme sua preferência',
            ),
          ],
        ),
        const ContainerProfileImage(),
      ],
    );
  }
}
