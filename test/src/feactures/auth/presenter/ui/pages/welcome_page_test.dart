import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/key_preference.dart';
import 'package:app_receitas/src/core/services/preference/user_preference/preference_service.dart';
import 'package:app_receitas/src/core/themes/theme.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/choose_auth_page.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/pages/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreferenceMock extends Mock implements Preference {}

void main() {
  late Preference preference = PreferenceMock();
  group(
    "Contexto: Dado que componentes estejam funcional",
    () {
      setUp(() {
        di.registerFactory<ThemeController>(() => ThemeController(preference));
      });
      tearDown(() {
        di.reset();
        resetMocktailState();
      });
      testWidgets(
        '\nDado que a page esteja aberta'
        '\nQuando clicar no botão alterar tema'
        '\nEntão deve alterar o tema de light_mode para dark_mode',
        (tester) async {
          when(
            () => preference.put(
              value: false,
              keyPreferences: KeyPreferences.isThemeLight,
            ),
          ).thenAnswer((_) => Future.value());
          await tester.pumpWidget(
            const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              home: WelcomePage(),
            ),
          );
          expect(find.byIcon(Icons.light_mode), findsOneWidget);
          await tester.tap(find.byIcon(Icons.light_mode));
          await tester.pumpAndSettle();
          expect(find.byIcon(Icons.dark_mode), findsOneWidget);
        },
      );

      testWidgets(
        '\nDado que a page esteja aberta'
        '\nQuando clicar no botão welcomeBottomAppBar'
        '\nEntão deve redirecionar para rota ChooseAuthPage',
        (tester) async {
          await tester.pumpWidget(
            MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              routes: {
                ChooseAuthPage.route: (context) => Container(
                      key: const Key('ChooseAuthPage'),
                    )
              },
              home: const WelcomePage(),
            ),
          );
          final context = tester.element(find.byType(WelcomePage));
          expect(find.text(AppLocalizations.of(context)!.welcomeBottomAppBar),
              findsOneWidget);
          await tester.tap(
              find.text(AppLocalizations.of(context)!.welcomeBottomAppBar));
          await tester.pumpAndSettle();
          expect(find.byKey(const Key('ChooseAuthPage')), findsOneWidget);
        },
      );
    },
  );
}
