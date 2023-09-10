import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_service_firebase.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';

class AuthModule {
  static void inicialize() {
    //Service
    di.registerFactory<AuthService>(() => AuthServiceFirebase());

    //controller
    di.registerFactory<AuthController>(
      () => AuthController(
        di(),
        di(),
      ),
    );
  }
}
