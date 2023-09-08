import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/splash/presenter/controller/splash_controller.dart';

class SplashModule {
  static void inicialize() {
    //controller
    di.registerFactory<SplashController>(
      () => SplashController(
        di(),
      ),
    );
  }
}
