import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/library/api_client.dart';
import 'package:app_receitas/src/core/services/api/api_recipes.dart';
import 'package:app_receitas/src/core/services/api/api_response.dart';
import 'package:app_receitas/src/core/services/api/response_request_mapper.dart';
import 'package:app_receitas/src/core/services/preference/sembast/sembast_database.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/core/widgets/feactures/manager_dialog.dart';
import 'package:dio/dio.dart';
import 'package:page_manager/handles/manager_handle_dialog_error.dart';

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
    di.registerLazySingleton(() => ThemeService(di()));

    //Api
    di.registerFactory<Dio>(() => Dio());
    di.registerFactory<ApiClient>(() => ApiClient(di()));
    di.registerFactory(() => ResponseRequestMapper());
    di.registerFactory(() => ApiRecipes(di(), di(), di()));
    di.registerFactory(() => ApiResponseParser());

    //Dialog package Page Manager
    di.registerFactory<ManagerHandleDialogError>(
      () => ManagerDialog(),
    );
  }
}
