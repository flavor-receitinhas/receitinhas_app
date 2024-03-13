import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:duration_time_picker/duration_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InfoContainerTimePrepared extends StatefulWidget {
  final CreateRecipeController ct;
  const InfoContainerTimePrepared({super.key, required this.ct});

  @override
  State<InfoContainerTimePrepared> createState() =>
      _InfoContainerTimePreparedState();
}

class _InfoContainerTimePreparedState extends State<InfoContainerTimePrepared> {
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
          DurationTimePicker(
            size: 250,
            duration: widget.ct.durationRecipe,
            labelStyle: GoogleFonts.jetBrainsMono(
                textStyle: const TextStyle(
              fontSize: 50,
            )),
            progressColor: Theme.of(context).colorScheme.primary,
            onChange: (val) {
              setState(() => widget.ct.durationRecipe = val);
            },
          ),
          CookieButton(
            label: 'Proximo',
            onPressed: () {
              widget.ct.containerController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.ease,
              );
            },
          ),
        ],
      ),
    );
  }
}
