import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/edit_profile_controller.dart';
import 'package:flutter/material.dart';

class SaveSheet extends StatelessWidget {
  final EditProfileController ct;
  const SaveSheet({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CookieText(
          text:
              'Verifique bem se tem certeza, assim podemos mostrar ao mundo o seu novo perfil!',
          color: Theme.of(context).colorScheme.onSecondary,
        ),
        const SizedBox(height: 10),
        CookieButton(
          label: 'Salvar alterações',
          onPressed: () async {
            ct.profile!.biography = ct.biographyController.text;
            if ((ct.image != null && ct.image!.path.isNotEmpty) ||
                ct.isRemoveImage) {
              await ct.updateImageProfile();
            }
            if (ct.profile!.biography != ct.biographyController.text) {
              await ct.updateProfile(ct.profile!);
            }
            if (context.mounted) {
              Navigator.pop(context, true);
              Navigator.pop(context, true);
            }
          },
        ),
        const SizedBox(height: 10),
        CookieButton.outline(
          label: 'Continuar editando',
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
