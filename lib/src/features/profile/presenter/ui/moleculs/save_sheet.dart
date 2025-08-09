import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/profile/presenter/controller/edit_profile_controller.dart';
import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:page_manager/entities/state_manager.dart';

class SaveSheet extends StatelessWidget {
  final EditProfileController ct;
  final GlobalKey<FormState> formKey;
  const SaveSheet({super.key, required this.ct, required this.formKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CookieText(
          text: AppLocalizations.of(context)!.profileSaveSheetConfirmMessage,
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(height: 10),
        CookieButton(
          label: AppLocalizations.of(context)!.profileSaveSheetSaveChanges,
          onPressed: () async {
            if (!formKey.currentState!.validate()) {
              return;
            }
            if ((ct.image != null && ct.image!.path.isNotEmpty) ||
                ct.isRemoveImage) {
              await ct.updateImageProfile();
            }
            if (ct.profile!.biography != ct.biographyController.text ||
                ct.userNameController.text != Global.profile!.name) {
              await ct.updateProfile(ct.profile!);
            }

            if (ct.stateUpdateProfile == StateManager.error &&
                    context.mounted ||
                ct.stateUpdateImage == StateManager.error && context.mounted) {
              CookieDialog(
                title: CookieText(text: ct.errorUpdateMessage),
              ).show(context);
              return;
            }

            if (context.mounted) {
              Navigator.pop(context, true);
              Navigator.pop(context, true);
            }
          },
        ),
        const SizedBox(height: 10),
        CookieButton.outline(
          label: AppLocalizations.of(context)!.profileSaveSheetContinueEditing,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
