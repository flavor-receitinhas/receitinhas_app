import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget {
  final String title;
  final String subTitle;

  const AppBarProfile({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CookieText(
            text: title,
            typography: CookieTypography.title,
            color: theme.primary,
          ),
          CookieText(text: subTitle),
        ],
      ),
    );
  }
}
