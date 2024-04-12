import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/edit_profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/appbar_profile.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/moleculs/back_sheet.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/moleculs/container_privacy.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/moleculs/save_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditProfilePage extends StatefulWidget {
  static const route = '/edit-perfil';
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  EditProfileController ct = di();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ct.init(context));
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    ct.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ), // Bordas arredondadas
        ),
        child: SvgPicture.asset('assets/icons/save.svg'),
        onPressed: () {
          CookieSheetBottom(
            title: CookieText(
              text: 'Deseja salvar as alterações ?',
              color: Theme.of(context).colorScheme.onSecondary,
              typography: CookieTypography.title,
            ),
            body: SaveSheet(ct: ct),
          ).show(context);
        },
      ),
      done: (_) => ListView(
        children: [
          const AppBarProfile(
            title: 'Seu perfil',
            subTitle: 'Aqui fica suas receitas publicadas',
          ),
          CookieButton(
            label: 'Voltar',
            onPressed: () {
              CookieSheetBottom(
                title: CookieText(
                  text: 'Você deseja descartar as alterações?',
                  color: Theme.of(context).colorScheme.onSecondary,
                  typography: CookieTypography.title,
                ),
                body: const BackSheet(),
              ).show(context);
            },
          ).back(context),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        if (ct.image != null && ct.image!.path.isNotEmpty) {
                          return CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(ct.image!),
                          );
                        }
                        if (ct.profile?.image != null &&
                            ct.profile!.image!.isNotEmpty) {
                          return CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(ct.profile!.image!),
                          );
                        }
                        return const CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        );
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CookieButton(
                            label: 'Alterar avatar',
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              setState(() {
                                ct.pickImageLogo();
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          CookieTextButton(
                            text: 'Remover Imagem',
                            onPressed: () {
                              setState(() {
                                ct.removeImage();
                              });
                            },
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
                CookieTextField.outline(
                  hintText: 'Fale um pouco sobre você...',
                  maxLines: 6,
                  maxLength: 400,
                  controller: ct.biographyController,
                ),
                const SizedBox(height: 20),
                const CookieText(
                  text: 'Privacidade',
                ),
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
