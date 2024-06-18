import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class AboutTeamPage extends StatelessWidget {
  static const route = '/about-team';
  const AboutTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          const CookieButton(label: 'Nossa equipe').back(context),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: CookieText(textAlign: TextAlign.start, text: '''
Nossa Equipe

Bem-vindo à equipe dedicada por trás do Flavor. Estamos entusiasmados em apresentar as mentes criativas que trabalham incansavelmente para tornar a sua experiência ainda melhor.

Estamos comprometidos em criar um aplicativo que atenda às suas necessidades e expectativas. Agradecemos por fazer parte da nossa jornada e esperamos continuar aprimorando e inovando para oferecer a você a melhor experiência possível.
            '''),
          ),
        ],
      ),
    );
  }
}
