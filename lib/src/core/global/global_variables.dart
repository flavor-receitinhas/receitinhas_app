import 'package:app_receitas/src/core/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

String formatarTime(BuildContext context, int minutes) {
  final locations = AppLocalizations.of(context)!;
  if (minutes <= 0) {
    return '0${locations.recipeIntroduceTimePrepared}';
  }

  int days = minutes ~/ 1440;
  int remainingMinutesAfterDays = minutes % 1440;
  int hours = remainingMinutesAfterDays ~/ 60;
  int minutesRemaining = remainingMinutesAfterDays % 60;

  if (days > 0) {
    if (hours == 0) {
      return '$days${locations.recipeIntroduceTimeDays}';
    } else {
      return '$days${locations.recipeIntroduceTimeDays} $hours${locations.recipeIntroduceTimeHours}';
    }
  } else if (hours == 0) {
    return '$minutesRemaining${locations.recipeIntroduceTimePrepared}';
  } else if (minutesRemaining == 0) {
    return '$hours${locations.recipeIntroduceTimeHours}';
  } else {
    return '$hours${locations.recipeIntroduceTimeHours} $minutesRemaining${locations.recipeIntroduceTimePrepared}';
  }
}
