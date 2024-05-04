import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/edit_account_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/config_page.dart';
import 'package:flutter/widgets.dart';

class ConfigModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ConfigPage.route: const ConfigPage(),
  };

  @override
  void inicialize() {
    //Controller
    di.registerFactory<ConfigController>(
      () => ConfigController(
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
