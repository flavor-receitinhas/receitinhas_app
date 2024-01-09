import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/back_container_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/introduce_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ChangedPasswordPage extends StatelessWidget {
  const ChangedPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: SvgPicture.asset('assets/icons/save.svg'),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: IntroduceConfig(),
            ),
            const BackContainerConfig(title: 'Alterar senha'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Senha antiga',
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  const CookieTextField.outline(
                    hintText: 'Escreva sua senha antiga',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Nova senha',
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  const CookieTextField.outline(
                    hintText: 'Digite sua nova senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Confirme a nova senha',
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  const CookieTextField.outline(
                    hintText: 'Confirme sua nova senha',
                    obscureText: true,
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: CookieText(
                      text:
                          'Você será notificado na sua caixa de emails\nsobre a mudança de senha.',
                      textAlign: TextAlign.center,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.5),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
