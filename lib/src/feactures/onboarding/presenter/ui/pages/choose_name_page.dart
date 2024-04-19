import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/controller/onboarding_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/validator_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ChooseNamePage extends StatefulWidget {
  final OnBoardingController ct;
  const ChooseNamePage({super.key, required this.ct});

  @override
  State<ChooseNamePage> createState() => _ChooseNamePageState();
}

class _ChooseNamePageState extends State<ChooseNamePage> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const LinearProgressIndicator(
          value: 4 / 4,
          minHeight: 10,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                widget.ct.pageController.animateToPage(
                  2,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              icon: const Icon(Icons.arrow_back_ios_new),
            ),
            Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CookieText(
                    text: AppLocalizations.of(context)!.chooseNameTitle,
                    typography: CookieTypography.title,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  CookieText(
                    text: AppLocalizations.of(context)!.chooseNameBody,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),
                  CookieTextField(
                    hintText: AppLocalizations.of(context)!.chooseNameHintText,
                    controller: widget.ct.userNameController,
                    validator: ValidatorOnboarding.validateName,
                  ),
                  const SizedBox(height: 20),
                  CookieButton(
                    label:
                        AppLocalizations.of(context)!.difficultyRecipesConfirm,
                    onPressed: () async {
                      await widget.ct.updateFoodPref();
                      await widget.ct.updateNameProfile();
                      if (context.mounted) {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          CustomBottomBar.route,
                          (route) => false,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
