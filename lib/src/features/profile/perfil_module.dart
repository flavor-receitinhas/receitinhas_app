import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/features/profile/domain/mappers/profile_mapper.dart';
import 'package:app_receitas/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/features/profile/domain/repositories/profile_repository_imp.dart';
import 'package:app_receitas/src/features/profile/presenter/controller/edit_profile_controller.dart';
import 'package:app_receitas/src/features/profile/presenter/controller/profile_controller.dart';
import 'package:app_receitas/src/features/profile/presenter/ui/pages/edit_profile_page.dart';
import 'package:app_receitas/src/features/profile/presenter/ui/pages/profile_page.dart';
import 'package:flutter/widgets.dart';

class ProfileModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ProfilePage.route: const ProfilePage(),
    EditProfilePage.route: const EditProfilePage(),
  };

  @override
  void inicialize() {
    //Mapper
    di.registerFactory(() => ProfileMappper());

    //Repository
    di.registerFactory<ProfileRepository>(
      () => ProfileRepositoryImp(
        di(),
        di(),
      ),
    );

    //Controller
    di.registerFactory<ProfileController>(
      () => ProfileController(
        di(),
        di(),
      ),
    );
    di.registerFactory<EditProfileController>(
      () => EditProfileController(
        di(),
        di(),
      ),
    );
  }
}
