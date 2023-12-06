import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/leave_alert_dialog.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatelessWidget {
  static const route = 'config';
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            children: [
              const CookieText(
                text: 'Configurações',
                typography: CookieTypography.title,
              ),
              const SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const LeaveAlertDialog();
                    },
                  );
                },
                child: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10),
                    CookieText(
                      text: 'Sair da conta',
                    ),
                    Spacer(),
                    Icon(Icons.chevron_right)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
