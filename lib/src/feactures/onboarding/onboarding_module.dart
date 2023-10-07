import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:flutter/src/widgets/framework.dart';

class OnboardingModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    OnBoardingPage.route: const OnBoardingPage(),
  };

  @override
  void inicialize() {
    //controller
    di.registerFactory<OnBoardingController>(
      () => OnBoardingController(
        di(),
      ),
    );
  }
}
