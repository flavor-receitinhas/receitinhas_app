import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/my_profile_page.dart';
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
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, MyProfilePage.route);
          },
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    );
  }
}
