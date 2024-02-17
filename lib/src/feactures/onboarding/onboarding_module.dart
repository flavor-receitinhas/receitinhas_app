import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/onboarding/data/database/user_data.dart';
import 'package:app_receitas/src/feactures/onboarding/data/database/user_data_imp.dart';
import 'package:app_receitas/src/feactures/onboarding/data/mappers/user_food_pref_mapper.dart';
import 'package:app_receitas/src/feactures/onboarding/data/repositories/user_food_pref_repository_imp.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_food_pref_repository.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:flutter/material.dart';

class OnboardingModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    OnBoardingPage.route: const OnBoardingPage(),
  };

  @override
  void inicialize() {
    //data
    di.registerFactory<UserDatabase>(
      () => UserDatabaseImp(
        di(),
        di(),
        di(),
      ),
    );

    //Mapper
    di.registerFactory(() => UserFoodPrefMapper());

    //repository
    di.registerFactory<UserFoodPrefRepository>(
      () => UserFoodPrefRepositoryImp(
        di(),
        di(),
      ),
    );

    //controller
    di.registerFactory<OnBoardingController>(
      () => OnBoardingController(
        di(),
      ),
    );
  }
}
