import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/dietary_restriction_page.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/protein_preference_page.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  static const route = '/onboarding';
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final OnBoardingController ct = OnBoardingController();

  @override
  void initState() {
    ct.init();
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      onPageChanged: ct.onChangedPage,
      controller: ct.pageController,
      children: [
        ProteinPreferencePage(ct: ct),
        DietaryRestricionPage(ct: ct),
        Container(),
      ],
    );
  }
}
