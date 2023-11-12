import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';

class CreateAdditionalInfo extends StatelessWidget {
  const CreateAdditionalInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const CustomContainer(
          child: Row(
            children: [
              Column(
                children: [Icon(Icons.lock_clock), CookieText(text: '5 min')],
              ),
              SizedBox(width: 16),
              Column(
                children: [Icon(Icons.lock_clock), CookieText(text: 'Dificil')],
              ),
              SizedBox(width: 16),
              Column(
                children: [
                  Icon(Icons.lock_clock),
                  CookieText(text: '5 porções')
                ],
              ),
            ],
          ),
        ),
        Column(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.pedal_bike),
            ),
            const CookieText(text: 'Editar seção')
          ],
        ),
      ],
    );
  }
}
