import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
          unselectedItemColor: Colors.grey[300],
          selectedFontSize: 0,
          onTap: onTap,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/home.svg'),
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/home.svg',
                colorFilter:
                    const ColorFilter.mode(Color(0xff222222), BlendMode.srcIn),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/favorite.svg'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/favorite.svg',
                colorFilter:
                    const ColorFilter.mode(Color(0xff222222), BlendMode.srcIn),
              ),
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/settings.svg'),
              backgroundColor: Theme.of(context).colorScheme.primary,
              label: '',
              activeIcon: SvgPicture.asset(
                'assets/icons/settings.svg',
                colorFilter:
                    const ColorFilter.mode(Color(0xff222222), BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
