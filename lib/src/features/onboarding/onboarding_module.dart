import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/features/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/features/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:domain_receitinhas/features/onboarding/data/repositories/user_omboarding_repository_imp.dart';
import 'package:domain_receitinhas/features/onboarding/domain/repositories/user_onboarding_repository.dart';
import 'package:flutter/material.dart';

class OnboardingModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {OnBoardingPage.route: const OnBoardingPage()};

  @override
  void inicialize() {
    //repository
    di.registerFactory<UserOnboardingRepository>(
      () => UserOmboardingRepositoryImp(),
    );

    //controller
    di.registerFactory<OnBoardingController>(() => OnBoardingController(di()));
  }
}
