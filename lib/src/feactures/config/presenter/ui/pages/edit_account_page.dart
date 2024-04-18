import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/edit_account_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/select_container_preference.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final EditAccountController ct = di();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ct.init());
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: SvgPicture.asset('assets/icons/save.svg'),
        onPressed: () {
          if (ct.selectProteins != ct.userPref!.protein ||
              ct.selectRestriction != ct.userPref!.dietaryRestriction) {
            ct.updateOnBoarding();
          }
          if (ct.userNameController.text != Global.user!.name) {
            ct.updateNameProfile();
          }
          Navigator.pop(context);
        },
      ),
      done: (_) => SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const CookieButton(label: 'Editar conta').back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Nome',
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  CookieTextField.outline(
                    hintText: 'Escreva seu nome...',
                    controller: ct.userNameController,
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Preferência alimentar',
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
                            ct.selectProteins.contains(Proteins.values[idx])
                                ? ct.selectProteins.remove(Proteins.values[idx])
                                : ct.selectProteins.add(Proteins.values[idx]);
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Restrição alimentar',
                    typography: CookieTypography.button,
                  ),
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
                            ct.selectRestriction.contains(
                              DietaryRestrictions.values[idx],
                            )
                                ? ct.selectRestriction.remove(
                                    DietaryRestrictions.values[idx],
                                  )
                                : ct.selectRestriction.add(
                                    DietaryRestrictions.values[idx],
                                  );
                            if (ct.selectRestriction.contains(
                                    DietaryRestrictions.noRestriction) &&
                                DietaryRestrictions.values[idx] ==
                                    DietaryRestrictions.noRestriction) {
                              ct.selectRestriction
                                  .remove(DietaryRestrictions.gluten);
                              ct.selectRestriction
                                  .remove(DietaryRestrictions.lactose);
                            }
                            if (DietaryRestrictions.values[idx] !=
                                DietaryRestrictions.noRestriction) {
                              ct.selectRestriction
                                  .remove(DietaryRestrictions.noRestriction);
                            }
                          });
                        },
                      );
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
