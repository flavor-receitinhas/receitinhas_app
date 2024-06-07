import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/introduce_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/container_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/leave_alert_dialog.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/changed_password_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/edit_account_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/privacy_policy_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/term_page.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  static const route = 'config';
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final ConfigController ct = di();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              const IntroduceConfig(),
              const SizedBox(height: 20),
              CookieText(
                text: 'Conta',
                typography: CookieTypography.button,
                color: theme.onPrimary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/person.svg',
                text: 'Editar Conta',
                action: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditAccountPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/key.svg',
                text: 'Alterar senha',
                action: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChangedPasswordPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 20),
              CookieText(
                text: 'Personalização',
                typography: CookieTypography.button,
                color: theme.onPrimary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/moon.svg',
                text: 'Modo notuno',
                action: SizedBox(
                  height: 20,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: ct.darkTheme,
                      onChanged: (value) {
                        ct.changeTheme();
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CookieText(
                text: 'Personalização',
                typography: CookieTypography.button,
                color: theme.onPrimary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/eye.svg',
                text: 'Politicas de privacidade',
                action: const Icon(Icons.chevron_right),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyPage(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/document.svg',
                text: 'Termos e condições',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TermPage(),
                    ),
                  );
                },
                action: Icon(Icons.chevron_right),
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/sing_out.svg',
                text: 'Sair da conta',
                textColor: const Color(0xffFF5757),
                action: const Icon(Icons.chevron_right),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return LeaveAlertDialog(ct: ct);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: CookieText(
                  text: 'Versão do Aplicativo',
                  color: theme.secondary,
                ),
              ),
              Center(
                child: CookieText(
                  text: '0.0.1',
                  color: theme.secondary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
