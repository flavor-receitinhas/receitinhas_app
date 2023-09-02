import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_service_firebase.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:get_it/get_it.dart';

class AuthModule {
  static void inicialize() {
    GetIt getIt = GetIt.instance;

    //Service
    getIt.registerFactory<AuthService>(() => AuthServiceFirebase());

    //controller
    getIt.registerFactory<AuthController>(
      () => AuthController(
        getIt(),
      ),
    );
  }
}
