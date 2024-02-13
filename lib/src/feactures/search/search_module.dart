import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/pages/search_page.dart';
import 'package:flutter/material.dart';

class SearchModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    SearchPage.route: const SearchPage(),
  };

  @override
  void inicialize() {
    di.registerFactory<ResearchController>(
      () => ResearchController(
        di(),
      ),
    );
  }
}
