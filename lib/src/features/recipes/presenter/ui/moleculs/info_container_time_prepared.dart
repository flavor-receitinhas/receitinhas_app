import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/features/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/features/recipes/presenter/ui/atomic/write_time_prepared.dart';
import 'package:duration_time_picker/duration_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

class InfoContainerTimePrepared extends StatefulWidget {
  final CreateRecipeController ct;
  final void Function(Duration) onChange;
  final void Function(String) onChangedHour;
  final void Function(String) onChangedMinute;
  const InfoContainerTimePrepared(
      {super.key,
      required this.ct,
      required this.onChange,
      required this.onChangedHour,
      required this.onChangedMinute});

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
            text: AppLocalizations.of(context)!.recipeTimePreparedTitle,
            typography: CookieTypography.title,
            color: Theme.of(context).colorScheme.onSecondary,
          ),
          const Spacer(),
          Stack(
            alignment: Alignment.topRight,
            children: [
              widget.ct.isWriteTime
                  ? WriteTimePrepared(
                      hourController: widget.ct.hourController,
                      minuteController: widget.ct.minuteController,
                      onChangedHour: widget.onChangedHour,
                      onChangedMinute: widget.onChangedMinute,
                    )
                  : DurationTimePicker(
                      size: 190,
                      duration: widget.ct.timePreparedRecipe,
                      labelStyle: GoogleFonts.jetBrainsMono(
                        textStyle: TextStyle(
                          fontSize: 45,
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                      progressColor: Theme.of(context).colorScheme.primary,
                      onChange: widget.onChange,
                    ),
              IconButton(
                color: Theme.of(context).colorScheme.onSecondary,
                onPressed: () {
                  setState(() {
                    widget.ct.isWriteTime = !widget.ct.isWriteTime;
                  });
                },
                icon: const Icon(
                  Icons.change_circle,
                  size: 40,
                ),
              ),
            ],
          ),
          const Spacer(),
          CookieButton(
            label: AppLocalizations.of(context)!.recipeDifficultyNext,
            onPressed: () {
              if (widget.ct.timePreparedRecipe.inMinutes > 0) {
                widget.ct.containerController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              } else {
                final snackBar = SnackBar(
                  content: CookieText(
                      text: AppLocalizations.of(context)!
                          .recipeTimePreparedSnackBarMessage),
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
