import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/select_container_preference.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/introduce_config.dart';
import 'package:flutter/material.dart';

class EditAccountPage extends StatefulWidget {
  const EditAccountPage({super.key});

  @override
  State<EditAccountPage> createState() => _EditAccountPageState();
}

class _EditAccountPageState extends State<EditAccountPage> {
  final List<String> optionPreference = [
    'Vegetariano',
    'Vegana',
    'Carne',
    'Peixe'
  ];
  final List<String> optionRestriction = ['Glúten', 'Lactose'];
  final List<String> select = [];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: IntroduceConfig(),
            ),
            Container(
              padding: const EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                color: theme.secondary,
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.chevron_left, size: 28),
                  ),
                  const SizedBox(width: 10),
                  const CookieText(
                    text: 'Editar conta',
                    typography: CookieTypography.button,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Nome',
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  const CookieTextField.outline(hintText: 'Escreva seu nome...'),
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Preferência alimentar',
                    typography: CookieTypography.button,
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 100,
                    child: GridView.builder(
                      itemCount: optionPreference.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        mainAxisExtent: 50,
                      ),
                      itemBuilder: (context, idx) {
                        return SelectContainerPreference(
                          title: optionPreference[idx],
                          listPreference: select,
                          preference: optionPreference[idx],
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text: 'Restrição alimentar',
                    typography: CookieTypography.button,
                  ),
                  SizedBox(
                    height: 50,
                    child: GridView.builder(
                      itemCount: optionRestriction.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 0,
                        mainAxisExtent: 50,
                      ),
                      itemBuilder: (context, idx) {
                        return SelectContainerPreference(
                          title: optionPreference[idx],
                          listPreference: select,
                          preference: optionPreference[idx],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
