import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:flutter/material.dart';

class SelectIngredientContainer extends StatelessWidget {
  const SelectIngredientContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: 90,
          padding: const EdgeInsets.only(
            right: 10,
            top: 10,
            bottom: 10,
          ),
          margin: const EdgeInsets.only(top: 20),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(width: 110),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CookieText(
                      text: 'Salada de Legume  asdasda  asd',
                      typography: CookieTypography.button,
                      maxLine: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CookieText(
                      text: '2 unidades',
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.create,
                  size: 34,
                ),
              ),
              const SizedBox(width: 5),
              GestureDetector(
                onTap: () {},
                child: const Icon(
                  Icons.delete,
                  size: 34,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Image.network(
            'https://media.discordapp.net/attachments/1071892919633576117/1174455155555586088/image.png?ex=6567a799&is=65553299&hm=e89afd78cf99f59bc2346946ae7355ba03fde27ad8a59c7cd50c6354835ed334&=&width=121&height=113',
            height: 100,
            width: 100,
          ),
        ),
      ],
    );
  }
}
