import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';

class ViewDetailsRecipe extends StatelessWidget {
  const ViewDetailsRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CookieText(
          text: 'Detalhes da receita',
          typography: CookieTypography.title,
        ),
        SizedBox(height: 20),
        CookieText(
          text:
              'Lorem ipsum dolor sit amet consectetur. Sodales donec non tortor augue eros massa feugiat. Odio vitae montes in pharetra ac. Pulvinar dignissim accumsan bibendum enim id enim eu vitae viverra. In massa erat tristique mauris consequat habitant aenean orci lacus.',
        ),
        SizedBox(height: 20),
        CustomContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                      text: 'Ingredientes', typography: CookieTypography.title),
                  Icon(Icons.accessible_forward, size: 30),
                ],
              ),
              SizedBox(height: 10),
              CookieText(text: '● banana 300ml'),
              CookieText(text: '● banana 300ml'),
              CookieText(text: '● banana 300ml'),
            ],
          ),
        ),
        SizedBox(height: 20),
        CustomContainer(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CookieText(
                    text: 'Instruções de preparo',
                    typography: CookieTypography.title,
                  ),
                  Icon(
                    Icons.access_alarm_outlined,
                    size: 30,
                  )
                ],
              ),
              SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CookieText(
                    text: '1.',
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: CookieText(
                      text:
                          'Enxágue o arroz basmati até que a água fique clara.',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
