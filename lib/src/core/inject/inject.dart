import 'package:api_manager/api/api_manager.dart';
import 'package:app_receitas/src/core/global/global_variables.dart'; 
import 'package:app_receitas/src/core/services/language/language_controller.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/core/widgets/features/manager_dialog.dart';
import 'package:dio/dio.dart';
import 'package:domain_receitinhas/core/api/api_recipes.dart';
import 'package:page_manager/handles/manager_handle_dialog_error.dart';

class Inject {
  static void inicialize() {
    //Persistente
    di.registerLazySingleton(() => PersistentDatabaseSembast());

    //Preference
    di.registerFactory<Preference>(() => Preference(di()));

    //Themas
    di.registerLazySingleton(() => ThemeService(di()));

    //Language
    di.registerLazySingleton(() => LanguageController(di()));

    //Api
    di.registerFactory<Dio>(() => Dio());
    di.registerFactory<ApiManager>(() => ApiManager());
    di.registerFactory(() => ApiRecipes());

    //Dialog package Page Manager
    di.registerFactory<ManagerHandleDialogError>(() => ManagerDialog());
  }
}
