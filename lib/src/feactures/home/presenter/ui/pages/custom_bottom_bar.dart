import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_button.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/config_page.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/pages/favorite_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            currentIndex: _index,
            unselectedItemColor: Colors.grey[300],
            selectedFontSize: 0,
            onTap: (value) {
              setState(
                () {
                  _index = value;
                },
              );
            },
            items: [
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/home.svg'),
                label: '',
                activeIcon: SvgPicture.asset(
                  'assets/icons/home.svg',
                  colorFilter: const ColorFilter.mode(
                      Color(0xff222222), BlendMode.srcIn),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/favorite.svg'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: '',
                activeIcon: SvgPicture.asset(
                  'assets/icons/favorite.svg',
                  colorFilter: const ColorFilter.mode(
                      Color(0xff222222), BlendMode.srcIn),
                ),
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/icons/settings.svg'),
                backgroundColor: Theme.of(context).colorScheme.primary,
                label: '',
                activeIcon: SvgPicture.asset(
                  'assets/icons/settings.svg',
                  colorFilter: const ColorFilter.mode(
                      Color(0xff222222), BlendMode.srcIn),
                ),
              ),

              /// Profile
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // Ação ao pressionar o botão flutuante
      //   },
      //   child: Icon(Icons.add),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
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
        child: pages[_index],
      ),
    );
  }
}
