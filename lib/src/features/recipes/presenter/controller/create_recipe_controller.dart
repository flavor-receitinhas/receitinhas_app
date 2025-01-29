import 'dart:io';
import 'package:app_receitas/src/features/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_manager/export_manager.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';

class CreateRecipeController extends ManagerStore {
  final RecipeRepository _repository;

  CreateRecipeController(
    this._repository,
  );

  TextEditingController titleController = TextEditingController();
  TextEditingController subTitleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController portionController = TextEditingController();
  List<IngredientEntity> listIngredient = [];
  PageController pageController = PageController();
  PageController containerController = PageController();
  int currentPage = 0;
  Duration timePreparedRecipe = const Duration(hours: 0, minutes: 0);
  DifficultyRecipe difficultyRecipe = DifficultyRecipe.easy;
  int portion = 0;
  final quillInstructionController = QuillController.basic();
  final quillServerController = QuillController.basic();
  File? thumbImage;
  bool isWriteTime = false;
  final hourController = TextEditingController();
  final minuteController = TextEditingController();
  List<IngredientRecipeEntity> listIngredientSelect = [];
  List<File> listImagesRecipe = [];

  @override
  void init(Map<String, dynamic> arguments) {
    pageController = PageController(initialPage: 0);
    containerController = PageController(initialPage: 0);
  }

  void onChangedPage(int value) {
    currentPage = value;
    notifyListeners();
  }

  Future<void> pickThumb() async {
    final XFile? image =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      thumbImage = File(image.path);
    }
    notifyListeners();
  }

  Future<List<File>> pickMultiImagesRecipe() async {
    List<XFile> listImage = await ImagePicker().pickMultiImage();
    final List<File> listImagesRecipe = [];
    for (var image in listImage) {
      listImagesRecipe.add(File(image.path));
    }

    return listImagesRecipe;
  }

  bool showDialogDiscard() {
    return titleController.text.isNotEmpty ||
        subTitleController.text.isNotEmpty ||
        detailsController.text.isNotEmpty ||
        listImagesRecipe.isNotEmpty;
  }

  void removeImage(File image) {
    listImagesRecipe.removeWhere((e) => e == image);
    notifyListeners();
  }

  // void sendImage() async {
  //   FormData imageData = FormData();
  //   for (var i = 0; i < listImagesRecipe.length; i++) {
  //     imageData.files.add(MapEntry('images',
  //         await MultipartFile.fromFile(listImagesRecipe[i], filename: '$i.jpg')));
  //   }
  //   dio.post('$url/$path', data: imageData);
  // }

  void addIngredient(IngredientEntity ingredient) {
    listIngredient.add(ingredient);
  }

  void deleteIngredient(IngredientEntity ingredient) {
    listIngredient.remove(ingredient);
    notifyListeners();
  }

  Future<void> createRecipe() async {
    handleTry(
      call: () async {
        RecipeEntity recipe = RecipeEntity(
          title: titleController.text,
          subTitle: subTitleController.text,
          details: detailsController.text,
          serveFood: QuillDeltaToHtmlConverter(
            quillServerController.document.toDelta().toJson(),
          ).convert(),
          difficultyRecipe: DifficultyRecipe.easy,
          instruction: QuillDeltaToHtmlConverter(
            quillInstructionController.document.toDelta().toJson(),
          ).convert(),
          portion: portion,
          timePrepared: timePreparedRecipe.inMinutes,
          //TODO Ver sobre os status depois
        );

        final result = await _repository.createRecipe(recipe);

        for (var image in listImagesRecipe) {
          await _repository.createImages(
            recipeId: result.id!,
            filePath: image.path,
          );
        }

        if (listIngredientSelect.isNotEmpty) {
          await _repository.insertIngredient(
            recipeId: result.id!,
            ingredient: listIngredientSelect,
          );
        }

        if (thumbImage != null) {
          await _repository.createThumb(
            recipeId: result.id!,
            filePath: thumbImage!.path,
          );
        }
      },
    );
  }

  String get durationRecipeString {
    if (timePreparedRecipe.inMinutes == 0) {
      return '';
    }
    if (timePreparedRecipe.inHours == 0) {
      return '${timePreparedRecipe.inMinutes}min';
    }
    return '${timePreparedRecipe.inHours}h ${timePreparedRecipe.inMinutes.remainder(60)}min';
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

  void deleteIngredientSelect(IngredientRecipeEntity ingredient) {
    listIngredientSelect.remove(ingredient);
    notifyListeners();
  }
}
