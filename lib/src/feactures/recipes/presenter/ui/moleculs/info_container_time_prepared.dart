import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:duration_time_picker/duration_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContainerTimePrepared extends StatelessWidget {
  final CreateRecipeController ct;
  final void Function(Duration) onChange;
  const InfoContainerTimePrepared(
      {super.key, required this.ct, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        children: [
          CookieText(
            text: 'Tempo de preparo',
            typography: CookieTypography.title,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const Spacer(),
          DurationTimePicker(
            size: 190,
            duration: ct.timePreparedRecipe,
            labelStyle: GoogleFonts.jetBrainsMono(
                textStyle: const TextStyle(
              fontSize: 45,
            )),
            progressColor: Theme.of(context).colorScheme.primary,
            onChange: onChange,
          ),
          const Spacer(),
          CookieButton(
            label: 'Proximo',
            onPressed: () {
              if (ct.timePreparedRecipe.inMinutes > 0) {
                ct.containerController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                final snackBar = SnackBar(
                  content: const CookieText(text: 'Informe o tempo de preparo'),
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
          ),
        ],
      ),
    );
  }
}
