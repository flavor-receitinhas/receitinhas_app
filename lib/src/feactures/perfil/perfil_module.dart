import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/perfil/presenter/ui/pages/my_perfil_page.dart';
import 'package:flutter/widgets.dart';

class PerfilModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    MyPerfilPage.route: const MyPerfilPage(),
  };

  @override
  void inicialize() {
    // TODO: implement inicialize
  }
}
