import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';

class OnboardingModule {
  static void inicialize() {
    //controller
    di.registerFactory<OnBoardingController>(
      () => OnBoardingController(
        di(),
      ),
    );
  }
}
