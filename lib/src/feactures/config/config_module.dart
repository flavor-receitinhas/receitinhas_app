import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/config_page.dart';
import 'package:flutter/widgets.dart';

class ConfigModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ConfigPage.route: const ConfigPage(),
  };

  @override
  void inicialize() {}
}
