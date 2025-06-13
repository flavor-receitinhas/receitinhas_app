import 'package:app_receitas/src/core/widgets/features/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_text_button.dart';
import 'package:app_receitas/src/features/config/presenter/ui/pages/config_page.dart';
import 'package:app_receitas/src/features/favorite/presenter/ui/pages/favorite_page.dart';
import 'package:app_receitas/src/features/home/presenter/ui/atomic/bottom_bar_home.dart';
import 'package:app_receitas/src/features/home/presenter/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app_receitas/src/core/l10n/app_localizations.dart';

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

  PageController pageController = PageController();
  int indexPage = 0;
  void changePage(int page) {
    setState(() {
      pageController.jumpToPage(page);
      indexPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomBarHome(
        currentIndex: indexPage,
        onTap: changePage,
      ),
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) {
            return;
          }
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: CookieText(
                text: AppLocalizations.of(context)!.customBottomBarExitAppTitle,
              ),
              actions: [
                CookieTextButton(
                  text: AppLocalizations.of(context)!.customBottomBarCancel,
                  color: Theme.of(context).colorScheme.primary,
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                ),
                const SizedBox(width: 10),
                CookieTextButton(
                  text: AppLocalizations.of(context)!.customBottomBarExit,
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
          controller: pageController,
          onPageChanged: changePage,
          children: pages,
        ),
      ),
    );
  }
}
