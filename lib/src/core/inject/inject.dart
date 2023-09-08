import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme_controller.dart';
import 'package:app_receitas/src/feactures/auth/auth_module.dart';
import 'package:app_receitas/src/feactures/splash/splash_module.dart';
import 'package:get_it/get_it.dart';

class Inject {
  static void inicialize() {
    GetIt getIt = GetIt.instance;

    //Persistente
    getIt.registerLazySingleton(() => PersistentDatabaseSembast());
    //Preference
    getIt.registerFactory<Preference>(
      () => Preference(
        getIt(),
      ),
    );
    //Themas
    getIt.registerSingleton(() => ThemeController());

    //Authentication
    AuthModule.inicialize();

    //Splash
    SplashModule.inicialize();
  }
}
