import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum OrderByFilter {
  asc,
  desc;
  // relevance,
  // date,
  // rating,
  // title,
  // viewCount;

  String titleDescription(BuildContext context) {
    switch (this) {
      // case OrderByFilter.relevance:
      //   return AppLocalizations.of(context)!.;
      // case OrderByFilter.date:
      //   return 'Date';
      // case OrderByFilter.rating:
      //   return 'Rating';
      // case OrderByFilter.title:
      //   return 'Title';
      // case OrderByFilter.viewCount:
      //   return 'View Count';
      case OrderByFilter.asc:
        return AppLocalizations.of(context)!.searchRecipeOrderByAsc;
      case OrderByFilter.desc:
        return AppLocalizations.of(context)!.searchRecipeOrderByDesc;
    }
  }
}
