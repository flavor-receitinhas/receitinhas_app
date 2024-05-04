import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/profile/domain/mappers/profile_mapper.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository_imp.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/edit_profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/edit_profile_page.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/my_profile_page.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/view_profile_page.dart';
import 'package:flutter/widgets.dart';

class ProfileModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    MyProfilePage.route: const MyProfilePage(),
    EditProfilePage.route: const EditProfilePage(),
    ViewProfilePage.route: const ViewProfilePage(),
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
        di(),
      ),
    );

    //Controller
    di.registerFactory<ProfileController>(
      () => ProfileController(
        di(),
      ),
    );
    di.registerFactory<EditProfileController>(
      () => EditProfileController(
        di(),
      ),
    );
  }
}
