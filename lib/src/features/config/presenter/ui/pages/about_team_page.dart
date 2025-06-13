import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class AboutTeamPage extends StatelessWidget {
  static const route = '/about-team';
  const AboutTeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(height: 10),
          CookieButton(
            label: AppLocalizations.of(context)!.configAboutOurTeam,
          ).back(context),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            child: CookieText(
              textAlign: TextAlign.start,
              text: AppLocalizations.of(context)!.configAboutTeamDescription,
            ),
          ),
        ],
      ),
    );
  }
}
