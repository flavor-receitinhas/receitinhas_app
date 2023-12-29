import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SearchPage extends StatefulWidget {
  static const route = '/search';
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CookieTextFieldSearch(
          hintText: 'Procure algo para cozinhar',
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          Container(
            height: 50,
            width: 50,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.primary,
            ),
            child: SvgPicture.asset(
              'assets/icons/menu.svg',
            ),
          ),
        ],
      ),
    );
  }
}
