import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:app_receitas/src/core/global/icon_enum.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/edit_account_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/select_container_preference.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/validator_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_manager/manager_page.dart';

class EditAccountPage extends StatefulWidget {
  static const route = '/edit-account';
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState
    extends ManagerPage<EditAccountController, EditAccountPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final formKey = GlobalKey<FormState>();
    return CookiePage(
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: CookieSvg(path: IconEnum.save.path),
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            return;
          }
          if (ct.selectProteins != ct.userPref!.protein ||
              ct.selectRestriction != ct.userPref!.dietaryRestriction) {
            await ct.updateOnBoarding();
          }
          if (ct.userNameController.text != Global.profile!.name) {
            await ct.updateNameProfile();
          }
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      ),
      done: () => SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              CookieButton(
                label: AppLocalizations.of(context)!.configEditAccount,
              ).back(context),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      CookieText(
                        text: AppLocalizations.of(context)!.configName,
                        typography: CookieTypography.button,
                      ),
                      const SizedBox(height: 10),
                      CookieTextField.outline(
                        hintText: AppLocalizations.of(context)!.configNameHint,
                        controller: ct.userNameController,
                        validator: ValidatorOnboarding.validateName,
                      ),
                      const SizedBox(height: 20),
                      CookieText(
                        text:
                            AppLocalizations.of(context)!.configFoodPreference,
                        typography: CookieTypography.button,
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        itemCount: Proteins.values.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          mainAxisExtent: 50,
                        ),
                        itemBuilder: (context, idx) {
                          return SelectContainerPreference(
                            title: AppLocalizations.of(context)!
                                .proteinPreferenceOptions(
                                    Proteins.values[idx].name),
                            listPreference: ct.selectProteins,
                            preference: Proteins.values[idx],
                            onTap: () {
                              setState(() {
                                ValidatorOnboarding.validateTapProtein(
                                  ct.selectProteins,
                                  Proteins.values[idx],
                                );
                              });
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 20),
                      CookieText(
                        text: AppLocalizations.of(context)!
                            .configDietaryRestriction,
                        typography: CookieTypography.button,
                      ),
                      const SizedBox(height: 10),
                      GridView.builder(
                        itemCount: DietaryRestrictions.values.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 0,
                          mainAxisExtent: 50,
                        ),
                        itemBuilder: (context, idx) {
                          return SelectContainerPreference(
                            title: AppLocalizations.of(context)!
                                .dietaryRestrictionOptions(
                                    DietaryRestrictions.values[idx].name),
                            listPreference: ct.selectRestriction,
                            preference: DietaryRestrictions.values[idx],
                            onTap: () {
                              setState(() {
                                ValidatorOnboarding
                                    .validateTapDietaryRestriction(
                                  ct.selectRestriction,
                                  DietaryRestrictions.values[idx],
                                );
                              });
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
