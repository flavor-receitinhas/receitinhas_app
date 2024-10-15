import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/choose_name_page.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/dietary_restriction_page.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/difficulty_recipe_page.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/protein_preference_page.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  static const route = '/onboarding';
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final OnBoardingController ct = di();

  @override
  void initState() {
    ct.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
    ct.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: (value) async {
        await ct.onChangedPage(value);
      },
      controller: ct.pageController,
      children: [
        ProteinPreferencePage(ct: ct),
        DietaryRestricionPage(ct: ct),
        DifficultRecipePage(ct: ct),
        ChooseNamePage(ct: ct),
      ],
    );
  }
}
