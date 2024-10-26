import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/edit_account_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/about_team_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/changed_password_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/config_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/edit_account_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/privacy_policy_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/term_page.dart';
import 'package:flutter/widgets.dart';

class ConfigModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ConfigPage.route: const ConfigPage(),
    AboutTeamPage.route: const AboutTeamPage(),
    ChangedPasswordPage.route: const ChangedPasswordPage(),
    EditAccountPage.route: const EditAccountPage(),
    PrivacyPolicyPage.route: const PrivacyPolicyPage(),
    TermPage.route: const TermPage(),
  };

  @override
  void inicialize() {
    // Registrar outros controladores
    di.registerFactory<ConfigController>(
      () => ConfigController(
        di(),
        di(),
        di(),
        di(),
      ),
    );
    di.registerFactory<EditAccountController>(
      () => EditAccountController(
        di(),
      ),
    );
  }
}
