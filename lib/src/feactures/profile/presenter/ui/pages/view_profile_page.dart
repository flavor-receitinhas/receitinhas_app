import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/appbar_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ViewProfilePage extends StatefulWidget {
  static const route = '/view-profile';
  const ViewProfilePage({super.key});

  @override
  State<ViewProfilePage> createState() => _ViewProfilePageState();
}

class _ViewProfilePageState extends State<ViewProfilePage> {
  final ProfileController ct = di();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ct.init());
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      done: (_) => SafeArea(
        child: ListView(
          children: [
            const AppBarProfile(title: 'Explorar Perfil', subTitle: 'Descubra as criações culinárias deste usuário',),
            const CookieButton(label: 'Voltar').back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            CookieText(
                              text: ct.profile.name,
                              typography: CookieTypography.title,
                            ),
                            CookieText(
                              text: 'mestre-cuca',
                              color: theme.primary,
                              typography: CookieTypography.button,
                            ),
                            const SizedBox(height: 10),
                            CookieText(
                              text: ct.profile.biography,
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: ct.profile.image != null &&
                                ct.profile.image!.isNotEmpty
                            ? NetworkImage(ct.profile.image!)
                            : const AssetImage('assets/images/avatar.png')
                                as ImageProvider,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Column(
                  //       children: [
                  //         CookieText(text: '8'),
                  //         CookieText(text: 'Receitas'),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         CookieText(text: '315'),
                  //         CookieText(text: 'Likes'),
                  //       ],
                  //     ),
                  //     Column(
                  //       children: [
                  //         CookieText(text: '20'),
                  //         CookieText(text: 'Seguidores'),
                  //       ],
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 20),
                  const CookieTextFieldSearch(
                    hintText: 'Pesquise sua receita favorita',
                  ),
                  const SizedBox(height: 20),
                  MasonryGridView.builder(
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    mainAxisSpacing: 6,
                    crossAxisSpacing: 6,
                    itemCount: 6,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                          ),
                        ),
                      );
                    },
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
