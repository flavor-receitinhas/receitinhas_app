enum UnitEnum {
  // Unidades de Volume
  milliliters('Mililitros'),
  liters('Litros'),
  cups('Xícaras'),
  tablespoons('Colheres de sopa'),
  teaspoons('Colheres de chá'),
  fluidOunces('Onças líquidas'),

  // Unidades de Peso
  grams('Gramas'),
  kilograms('Quilogramas'),
  milligrams('Miligramas'),
  pounds('Libras'),
  ounces('Onças'),

  // Unidades de Quantidade
  units('Unidades'),
  dozens('Dúzias'),
  pieces('Peças'),
  slices('Fatias'),

  // Unidades de Comprimento
  centimeters('Centímetros'),
  millimeters('Milímetros'),

  // Outras Unidades
  pinches('Pitadas'),
  bunches('Ramas'),
  cans('Latas');

  final String name;

  const UnitEnum(this.name);
}
