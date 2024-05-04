import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:flutter/material.dart';

class SheetSelectIngredient extends StatelessWidget {
  const SheetSelectIngredient({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {},
              color: Theme.of(context).colorScheme.onSecondary,
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
              color: Theme.of(context).colorScheme.onSecondary,
              icon: const Icon(
                Icons.add_circle_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: Theme.of(context).colorScheme.onSecondary,
              style: BorderStyle.solid,
              width: 1,
            ),
          ),
          child: DropdownButton(
            iconEnabledColor: Theme.of(context).colorScheme.onSecondary,
            //  value: dropdownValue,
            dropdownColor: Theme.of(context).colorScheme.onPrimary,
            icon: const Icon(Icons.arrow_drop_down),
            underline: const SizedBox(),
            onChanged: (String? newValue) {
              // setState(() {
              //   dropdownValue = newValue!;
              // });
            },
            items: <String>['Unidade 1', 'Unidade 2', 'Unidade 3', 'Unidade 4']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: CookieText(
                  text: value,
                  color: Theme.of(context).colorScheme.onSecondary,
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
    );
  }
}
