import 'package:app_receitas/src/feactures/config/presenter/ui/pages/config_page.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/pages/favorite_page.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/home_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:flutter/material.dart';

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
    const CreateRecipePage(),
    const ConfigPage(),
  ];

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: BottomNavigationBar(
            showSelectedLabels: false,
            backgroundColor: Theme.of(context).colorScheme.primary,
            currentIndex: _index,
            unselectedItemColor: Colors.grey[300],
            selectedFontSize: 0,
            // enableFloatingNavBar: false,
            onTap: (value) {
              setState(
                () {
                  _index = value;
                },
              );
            },

            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: '',
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.favorite),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: ''),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.add_circle_outlined),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: ''),
              BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  label: ''),

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
      body: pages[_index],
    );
  }
}
