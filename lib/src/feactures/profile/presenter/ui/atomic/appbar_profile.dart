import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class AppBarProfile extends StatelessWidget {
  const AppBarProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CookieText(
            text: 'Seu perfil',
            typography: CookieTypography.title,
            color: theme.primary,
          ),
          const CookieText(text: 'Aqui fica suas receitas publicadas'),
        ],
      ),
    );
  }
}
