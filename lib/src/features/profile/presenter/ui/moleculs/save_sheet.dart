import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/features/profile/presenter/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

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
            ct.profile!.biography = ct.biographyController.text;
            if ((ct.image != null && ct.image!.path.isNotEmpty) ||
                ct.isRemoveImage) {
              await ct.updateImageProfile();
            }
            if (ct.profile!.biography != ct.biographyController.text) {
              await ct.updateProfile(ct.profile!);
            }
            if (ct.userNameController.text != Global.profile!.name) {
              await ct.updateNameProfile();
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
