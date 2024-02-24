import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/perfil/presenter/ui/atomic/appbar_perfil.dart';
import 'package:app_receitas/src/feactures/perfil/presenter/ui/moleculs/container_privacy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditPerfilPage extends StatelessWidget {
  const EditPerfilPage({super.key});

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
      body: ListView(
        children: [
          const AppBarPerfil(),
          const CookieButton(label: 'Voltar').back(context),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 60,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CookieButton(
                            label: 'Alterar avatar',
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {},
                          ),
                          const SizedBox(height: 10),
                          CookieTextButton(
                            text: 'Remover Imagem',
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: CookieText(
                    text: 'A imagem tem que ter no minimo 256x256px',
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                const CookieText(
                  text: 'Título',
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  isExpanded: true,
                  dropdownColor: theme.secondary,
                  borderRadius: BorderRadius.circular(10),
                  decoration: InputDecoration(
                    hintText: 'Selecione um título',
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.4),
                        ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: CookieText(text: 'data'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: CookieText(text: 'data'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: CookieText(text: 'data'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                Center(
                  child: CookieText(
                    text:
                        'Selecione um título na qual você mais se indentifica',
                    textAlign: TextAlign.center,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                const CookieText(
                  text: 'Sobre mim',
                ),
                const SizedBox(height: 10),
                const CookieTextField.outline(
                  hintText: 'Fale um pouco sobre você...',
                  maxLines: 6,
                  maxLength: 400,
                ),
                const SizedBox(height: 20),
                const CookieText(
                  text: 'Privacidade',
                ),
                const SizedBox(height: 10),
                const ContainerPrivacy(text: 'Ocultar receitas'),
                const SizedBox(height: 10),
                const ContainerPrivacy(text: 'Ocultar seguidores'),
                const SizedBox(height: 10),
                const ContainerPrivacy(text: 'Ocultar likes'),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
