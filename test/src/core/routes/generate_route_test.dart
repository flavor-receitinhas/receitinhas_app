import 'package:app_receitas/src/core/routes/generate_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final routes = GenerateRoute().routes;
  test(
    'Se se ta voltando um widget',
    () {
      final mapModule = routes.firstWhere(
        (map) => map.routers.containsKey('/home'),
      );
      print(mapModule);
      final mapperFilter = mapModule.routers['/home'];
      print(mapperFilter);
      expect(
        mapperFilter,
        isA<Widget>(),
      );
    },
  );
  test(
    'O que estar retornando na função',
    () {
      print(GenerateRoute().generateRoute(
        const RouteSettings(name: '/home'),
      ));


    },
  );
}
