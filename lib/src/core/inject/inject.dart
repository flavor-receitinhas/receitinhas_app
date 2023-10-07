import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme_controller.dart';

class Inject {
  static void inicialize() {
    //Persistente
    di.registerLazySingleton(() => PersistentDatabaseSembast());
    //Preference
    di.registerFactory<Preference>(
      () => Preference(
        di(),
      ),
    );
    //Themas
    di.registerLazySingleton(() => ThemeController(di()));

  }
}
