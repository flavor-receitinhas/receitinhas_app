import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class RecipeSearchContainer extends StatelessWidget {
  const RecipeSearchContainer({super.key});

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
            'https://th.bing.com/th/id/R.7e56e5b04d0f210b3adcdee96586e6ba?rik=4jbCMSTYD9Dexw&pid=ImgRaw&r=0',
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CookieText(
                  text: 'Salada de Legume  asdasda  asd',
                  maxLine: 2,
                  overflow: TextOverflow.ellipsis,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                CookieText(
                  text: '5 min',
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
