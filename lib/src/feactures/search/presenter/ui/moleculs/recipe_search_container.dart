import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:flutter/material.dart';

class RecipeSearchContainer extends StatelessWidget {
  final String image;
  final String title;
  final int timePrepared;
  const RecipeSearchContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.timePrepared});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: const EdgeInsets.only(right: 10),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.network(
            image,
            height: 90,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CookieText(
                  text: title,
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                CookieText(
                  text: '$timePrepared min',
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
