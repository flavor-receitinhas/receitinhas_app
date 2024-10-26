import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_snack_bar.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/introduce_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/container_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/leave_alert_dialog.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/about_team_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/changed_password_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/edit_account_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/privacy_policy_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/term_page.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/manager_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ConfigPage extends StatefulWidget {
  static const route = 'config';
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends ManagerPage<ConfigController, ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      done: () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            const IntroduceConfig(),
            const SizedBox(height: 20),
            CookieText(
              text: AppLocalizations.of(context)!.configAccount,
              typography: CookieTypography.button,
              color: theme.onPrimary,
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.person,
              text: AppLocalizations.of(context)!.configEditAccount,
              action: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, EditAccountPage.route);
              },
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.key,
              text: AppLocalizations.of(context)!.configChangePassword,
              action: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ChangedPasswordPage.route,
                );
              },
            ),
            const SizedBox(height: 20),
            CookieText(
              text: AppLocalizations.of(context)!.configCustomization,
              typography: CookieTypography.button,
              color: theme.onPrimary,
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.moon,
              text: AppLocalizations.of(context)!.configNightMode,
              action: SizedBox(
                height: 20,
                child: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    thumbIcon: WidgetStateProperty.all(
                      ct.darkTheme
                          ? const Icon(
                              Icons.light_mode,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                            ),
                    ),
                    activeColor: theme.primary,
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
              text: AppLocalizations.of(context)!.configCustomization,
              typography: CookieTypography.button,
              color: theme.onPrimary,
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.eye,
              text: AppLocalizations.of(context)!.configPrivacyPolicy,
              action: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PrivacyPolicyPage.route,
                );
              },
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.eye, //TODO: Mudar para ícone de idioma, quando disponível.
              text: AppLocalizations.of(context)!.language,
              action: const Icon(Icons.chevron_right),
              onTap: () {
                CookieSheetBottom(
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  title: CookieText(
                    text: AppLocalizations.of(context)!.changeLanguage,
                  ),
                  body: Column(
                    children: ct.listLanguages.map((locale) {
                      return ListTile(
                        title: Text(
                          ct.formatLang(locale: locale, context),
                        ),
                        onTap: () {
                          ct.saveLanguagePref(locale: locale);
                          Navigator.pop(context);
                          CookieSnackBar(
                            text: AppLocalizations.of(context)!.languageChangeSuccess,
                          ).show(context);
                        },
                      );
                    }).toList(),
                  ),
                ).show(context);
              },
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.document,
              text: AppLocalizations.of(context)!.configTermsConditions,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TermPage.route,
                );
              },
              action: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.persons,
              text: AppLocalizations.of(context)!.configOurTeam,
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AboutTeamPage.route,
                );
              },
              action: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconsSvgEnum.logOut,
              text: AppLocalizations.of(context)!.configLogout,
              textColor: const Color(0xffFF5757),
              action: const Icon(Icons.chevron_right),
              onTap: () {
                LeaveAlertDialog(ct: ct).show(context);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: CookieText(
                text: AppLocalizations.of(context)!.configAppVersion,
                color: theme.onPrimary.withOpacity(0.5),
              ),
            ),
            Center(
              child: CookieText(
                text:
                    '${ct.packageInfo?.version} (${ct.packageInfo?.buildNumber})',
                color: theme.onPrimary.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
