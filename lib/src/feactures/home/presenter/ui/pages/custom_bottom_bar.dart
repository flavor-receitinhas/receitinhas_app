import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_button.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/config_page.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/pages/favorite_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/controller/home_controller.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/atomic/bottom_bar_home.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomBottomBar extends StatefulWidget {
  static const route = '/home';
  const CustomBottomBar({super.key});

  @override
  State<CustomBottomBar> createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  List<Widget> pages = [
    const HomePage(),
    const FavoritePage(),
    const ConfigPage(),
  ];

  final HomeController ct = di();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => ct.init(context));
    ct.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarHome(
        currentIndex: ct.indexPage,
        onTap: ct.changePage,
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) {
            return;
          }
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const CookieText(text: 'Deseja sair do app?'),
              actions: [
                CookieTextButton(
                  text: 'Cancelar',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                ),
                const SizedBox(width: 10),
                CookieTextButton(
                  text: 'Sair',
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                ),
              ],
            ),
          );
        },
        child: PageView(
          controller: ct.pageController,
          onPageChanged: ct.changePage,
          children: pages,
        ),
      ),
    );
  }
}
