import 'dart:io';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateRecipeController extends ChangeNotifier {
  var listMultiMedia = [];

  final RecipeRepository _repository;

  CreateRecipeController(this._repository);

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController instructionController = TextEditingController();
  TextEditingController serveFoodController = TextEditingController();
  TextEditingController portionController = TextEditingController();
  List<IngredientsEntity> listIngredient = [];
  PageController pageController = PageController();
  PageController containerController = PageController();
  int currentPage = 0;
  Duration durationRecipe = const Duration(hours: 0, minutes: 0);
  DifficultyRecipe difficultyRecipe = DifficultyRecipe.easy;
  int portion = 0;

  void init() {
    pageController = PageController(initialPage: 0);
    containerController = PageController(initialPage: 0);
  }

  void onChangedPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  void pickMultiMedia() async {
    List<XFile> listImage =
        await ImagePicker().pickMultipleMedia(imageQuality: 50);
    for (var image in listImage) {
      listMultiMedia.add(File(image.path));
    }
    notifyListeners();
  }

  void removeImage(File image) {
    listMultiMedia.removeWhere((e) => e == image);
    notifyListeners();
  }

  // void sendImage() async {
  //   FormData imageData = FormData();
  //   for (var i = 0; i < listMultiMedia.length; i++) {
  //     imageData.files.add(MapEntry('images',
  //         await MultipartFile.fromFile(listMultiMedia[i], filename: '$i.jpg')));
  //   }
  //   dio.post('$url/$path', data: imageData);
  // }

  void addIngredient(IngredientsEntity ingredient) {
    listIngredient.add(ingredient);
  }

  void deleteIngredient(IngredientsEntity ingredient) {
    listIngredient.remove(ingredient);
    notifyListeners();
  }

  Future<void> createRecipe() async {
    RecipeEntity recipe = RecipeEntity(
      title: titleController.text,
      subTitle: subTitleController.text,
      details: detailsController.text,
      serveFood: serveFoodController.text,
      difficultyRecipe: DifficultyRecipe.easy,
      images: [],
      ingredients: [],
      instruction: instructionController.text,
      portion: 1,
      timePrepared: 1,
    );
    await _repository.createRecipe(recipe);
  }

  String get durationRecipeString {
    if (durationRecipe.inMinutes == 0) {
      return '';
    }
    if (durationRecipe.inHours == 0) {
      return '${durationRecipe.inMinutes}min';
    }
    return '${durationRecipe.inHours}h ${durationRecipe.inMinutes.remainder(60)}min';
  }

  String get difficultyRecipeString {
    if (difficultyRecipe.name == 'easy') {
      return 'Fácil';
    }
    if (difficultyRecipe.name == 'medium') {
      return 'Médio';
    }

    return 'Difícil';
  }
}
