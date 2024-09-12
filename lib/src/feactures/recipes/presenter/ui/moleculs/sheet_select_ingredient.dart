import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/unit_enum.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/ingredient_select_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

class SheetSelectIngredient extends StatefulWidget {
  final IngredientSelectController ct;
  final IngredientEntity ingredient;
  const SheetSelectIngredient(
      {super.key, required this.ct, required this.ingredient});

  @override
  State<SheetSelectIngredient> createState() => _SheetSelectIngredientState();
}

class _SheetSelectIngredientState extends State<SheetSelectIngredient> {
  bool isFieldsEmpty = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: widget.ct.decreaseQuantity,
              color: Theme.of(context).colorScheme.onSecondary,
              icon: const Icon(
                Icons.remove_circle_rounded,
                size: 30,
              ),
            ),
            SizedBox(
              width: 60,
              child: TextField(
                controller: widget.ct.quantityController,
                // onChanged: onChangedField,
                maxLength: 3,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
                decoration: const InputDecoration(
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
              onPressed: widget.ct.increaseQuantity,
              color: Theme.of(context).colorScheme.onSecondary,
              icon: const Icon(
                Icons.add_circle_rounded,
                size: 30,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        DottedBorder(
          dashPattern: const [4, 5],
          borderType: BorderType.RRect,
          radius: const Radius.circular(10),
          color: Theme.of(context).colorScheme.onSecondary,
          strokeWidth: 1,
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: DropdownButton<UnitEnum>(
            iconEnabledColor: Theme.of(context).colorScheme.onSecondary,
            value: widget.ct.unit,
            hint: CookieText(
              text: 'Escolha a unidade',
              color: Theme.of(context).colorScheme.onSecondary,
            ),
            dropdownColor: Theme.of(context).colorScheme.onPrimary,
            icon: const Icon(Icons.arrow_drop_down),
            underline: const SizedBox(),
            onChanged: (UnitEnum? newValue) {
              setState(() {
                widget.ct.unit = newValue!;
              });
            },
            items: UnitEnum.values
                .map<DropdownMenuItem<UnitEnum>>((UnitEnum value) {
              return DropdownMenuItem<UnitEnum>(
                value: value,
                child: CookieText(
                  text: value.name,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              );
            }).toList(),
          ),
        ),
        if (isFieldsEmpty)
          const CookieText(
            text: 'Campos obrigatórios',
            color: Colors.red,
          ),
        const SizedBox(height: 20),
        CookieButton(
          label: 'Confirmar',
          onPressed: () {
            if (widget.ct.quantityController.text.isEmpty &&
                widget.ct.unit == null) {
              setState(() {
                isFieldsEmpty = true;
              });
              return;
            }
            setState(() {
              widget.ct.addIngredientSelect(widget.ingredient);
              widget.ct.quantityController.clear();
              widget.ct.unit = null;
            });
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
