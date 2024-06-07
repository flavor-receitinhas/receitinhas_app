import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/splash/presenter/controller/splash_controller.dart';
import 'package:app_receitas/src/feactures/splash/presenter/ui/pages/splash_page.dart';
import 'package:flutter/widgets.dart';

class SplashModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    SplashPage.route: const SplashPage(),
  };

  @override
  void inicialize() {
    //controller
    di.registerFactory<SplashController>(
      () => SplashController(
        di(),
      ),
    );
  }
}
