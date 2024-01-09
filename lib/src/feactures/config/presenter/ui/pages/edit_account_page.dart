import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/back_container_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/select_container_preference.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/introduce_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ), // Bordas arredondadas
        ),
        child: SvgPicture.asset('assets/icons/save.svg'),
        onPressed: () {},
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: IntroduceConfig(),
            ),
            const BackContainerConfig(title: 'Editar conta'),
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
                  const CookieTextField.outline(
                      hintText: 'Escreva seu nome...'),
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
