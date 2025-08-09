import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/config/presenter/controllers/edit_account_controller.dart';
import 'package:app_receitas/src/features/config/presenter/ui/atomic/select_container_preference.dart';
import 'package:app_receitas/src/features/onboarding/presenter/validator_onboarding.dart';
import 'package:domain_receitinhas/features/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:domain_receitinhas/features/onboarding/domain/enums/proteins_enum.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
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
      errorReload: () async => await ct.init(ct.currentArguments),
      error: ct.error.toString(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        child: const CookieSvg(svg: IconsSvgEnum.save),
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            return;
          }
          if (ct.selectProteins != ct.userPref!.protein ||
              ct.selectRestriction != ct.userPref!.dietaryRestriction) {
            await ct.updateOnBoarding();
          }
          if (context.mounted) {
            Navigator.pop(context);
          }
        },
      ),
      done:
          () => SafeArea(
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
                            text:
                                AppLocalizations.of(
                                  context,
                                )!.configFoodPreference,
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
                                title: AppLocalizations.of(
                                  context,
                                )!.proteinPreferenceOptions(
                                  Proteins.values[idx].name,
                                ),
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
                            text:
                                AppLocalizations.of(
                                  context,
                                )!.configDietaryRestriction,
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
                                title: AppLocalizations.of(
                                  context,
                                )!.dietaryRestrictionOptions(
                                  DietaryRestrictions.values[idx].name,
                                ),
                                listPreference: ct.selectRestriction,
                                preference: DietaryRestrictions.values[idx],
                                onTap: () {
                                  setState(() {
                                    ValidatorOnboarding.validateTapDietaryRestriction(
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
