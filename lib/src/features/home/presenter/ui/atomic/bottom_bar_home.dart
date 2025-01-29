import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/features/cookie_svg.dart';
import 'package:flutter/material.dart';

class BottomBarHome extends StatelessWidget {
  final int currentIndex;
  final void Function(int)? onTap;
  const BottomBarHome({super.key, required this.currentIndex, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: BottomNavigationBar(
          showSelectedLabels: false,
          backgroundColor: Theme.of(context).colorScheme.primary,
          currentIndex: currentIndex,
          unselectedItemColor: Theme.of(context).colorScheme.onSecondary,
          selectedFontSize: 0,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: CookieSvg(
                svg: IconsSvgEnum.home,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              label: '',
              activeIcon: const CookieSvg(
                svg: IconsSvgEnum.home,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            BottomNavigationBarItem(
              icon: CookieSvg(
                svg: IconsSvgEnum.favorite,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: '',
              activeIcon: const CookieSvg(
                svg: IconsSvgEnum.favorite,
              ),
            ),
            BottomNavigationBarItem(
              icon: CookieSvg(
                svg: IconsSvgEnum.settings,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: '',
              activeIcon: const CookieSvg(
                svg: IconsSvgEnum.settings,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
