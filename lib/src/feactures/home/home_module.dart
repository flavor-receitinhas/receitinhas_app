import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/home_page.dart';
import 'package:flutter/widgets.dart';

class HomeModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    HomePage.route: const HomePage(),
  };

  @override
  void inicialize() {
    // TODO: implement inicialize
  }
}
