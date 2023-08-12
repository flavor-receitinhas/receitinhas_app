import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: CustomScreen(
        iconAppBar: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.sunny),
          iconSize: 36,
        ),
        backgroundImage:
            'https://th.bing.com/th/id/R.ded7c9955889b3c65d556eb77c034835?rik=KwZPTVaWsJNydw&pid=ImgRaw&r=0',
        image:
            'https://media.discordapp.net/attachments/1071892919633576117/1138544562135117974/image.png?width=615&height=539',
        body: Column(
          children: [
            CookieText(
              text: AppLocalizations.of(context)!.welcomeTitle,
              typography: CookieTypography.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            CookieText(
              text: AppLocalizations.of(context)!.welcomeBody,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        bottomBar: [
          CookieButton(
            label: AppLocalizations.of(context)!.welcomeBottomAppBar,
            onPressed: () => Navigator.pushNamed(
              context,
              '/choose-auth',
            ),
          ),
        ],
      ),
    );
  }
}
