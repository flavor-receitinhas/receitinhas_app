import 'package:app_receitas/src/core/widgets/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/select_ingredient_container.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SelectIngredientsPage extends StatefulWidget {
  const SelectIngredientsPage({super.key});

  @override
  State<SelectIngredientsPage> createState() => _SelectIngredientsPageState();
}

class _SelectIngredientsPageState extends State<SelectIngredientsPage> {
  String dropdownValue = 'Unidade 1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  const CookieButton(label: 'Voltar').back(context),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        CookieText(
                          text: 'Selecionar ingredientes',
                          typography: CookieTypography.title,
                        ),
                        SizedBox(height: 10),
                        CookieTextFieldSearch(
                            hintText: 'Pesquise seus ingredientes'),
                        SizedBox(height: 20),
                        CookieText(
                          text: 'Ingredientes selecionados (1)',
                          typography: CookieTypography.button,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Visibility(
                    visible: true,
                    child: DottedBorder(
                      dashPattern: const [4, 5],
                      borderPadding: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 32, vertical: 20),
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(10),
                      color: Theme.of(context).colorScheme.onPrimary,
                      strokeWidth: 1,
                      child: SizedBox(
                        height: 150,
                        child: ListView.builder(
                          itemCount: 3,
                          itemBuilder: (context, index) {
                            return const SelectIngredientContainer();
                          },
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 20, 16, 10),
                child: CookieText(
                  text: 'Escolha outros ingredientes abaixo',
                  typography: CookieTypography.button,
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              sliver: SliverList.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      CookieSheetBottom(
                        alignmentTitle: Alignment.center,
                        title: CookieText(
                          text: 'Selecionar quantidade',
                          typography: CookieTypography.title,
                          color: Theme.of(context).colorScheme.onSecondary,
                        ),
                        body: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  icon: const Icon(
                                    Icons.remove_circle_rounded,
                                    size: 30,
                                  ),
                                ),
                                const SizedBox(
                                  width: 60,
                                  child: TextField(
                                    // controller: ct.portionController,
                                    // onChanged: onChangedField,
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    decoration: InputDecoration(
                                      counterText: '',
                                      hintStyle: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  icon: const Icon(
                                    Icons.add_circle_rounded,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  style: BorderStyle.solid,
                                  width: 1,
                                ),
                              ),
                              child: DropdownButton(
                                iconEnabledColor:
                                    Theme.of(context).colorScheme.onSecondary,
                                value: dropdownValue,
                                dropdownColor:
                                    Theme.of(context).colorScheme.onPrimary,
                                icon: const Icon(Icons.arrow_drop_down),
                                underline: const SizedBox(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Unidade 1',
                                  'Unidade 2',
                                  'Unidade 3',
                                  'Unidade 4'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: CookieText(
                                      text: value,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSecondary,
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            const SizedBox(height: 20),
                            CookieButton(
                              label: 'Confirmar',
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                      ).show(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const CookieText(
                        text: 'Salada de Legume  asdasda  asd',
                        typography: CookieTypography.button,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
