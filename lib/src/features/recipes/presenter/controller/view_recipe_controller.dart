import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/features/favorite/domain/dtos/favorite_dto.dart';
import 'package:app_receitas/src/features/favorite/domain/dtos/favorite_recipe_dto.dart';
import 'package:app_receitas/src/features/favorite/domain/repositories/favorite_repository.dart';
import 'package:app_receitas/src/features/recipes/domain/dtos/recipe_get_dto.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/entities/ingredient_recipe_entity.dart';
import 'package:app_receitas/src/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:page_manager/export_manager.dart';

class ViewRecipeController extends ManagerStore {
  final RecipeRepository _recipeRepository;
  final FavoriteRepository _favoriteRepository;

  ViewRecipeController(this._recipeRepository, this._favoriteRepository);

  String id = '';
  RecipeGetDto recipe = RecipeGetDto.empty;
  List<ImageEntity> images = [];
  List<IngredientRecipeEntity> ingredients = [];
  FavoriteRecipeDto? favoriteRecipeDto;

  Map<String, dynamic> argumentsMap = {};

  @override
  Future<void> init(Map<String, dynamic> arguments) => handleTry(
    call: () async {
      argumentsMap = arguments;
      id = arguments['id'] as String;
      recipe = await getRecipe();
      images = await getImages();
      ingredients = await getIngredientsRecipe();
      favoriteRecipeDto = await getFavoriteRecipe();
      viewRecipe();
    },
  );

  Future<RecipeGetDto> getRecipe() async {
    return await _recipeRepository.getRecipe(id);
  }

  Future<List<ImageEntity>> getImages() async {
    final images = await _recipeRepository.getImages(id);
    return images.where((e) => !e.thumb).toList();
  }

  Future<List<IngredientRecipeEntity>> getIngredientsRecipe() async {
    return await _recipeRepository.getIngredientsRecipe(id);
  }

  Future<FavoriteRecipeDto> getFavoriteRecipe() async {
    return await _favoriteRepository.getFavoriteRecipe(id);
  }

  Future<void> deleteRecipe(String recipeId) => handleTry(
    call: () async {
      await _recipeRepository.deleteRecipe(recipeId);
      notifyListeners();
    },
  );

  Future<void> refresh() => handleTry(
    call: () async {
      recipe = await getRecipe();
      images = await getImages();
      ingredients = await getIngredientsRecipe();
      favoriteRecipeDto = await getFavoriteRecipe();
      notifyListeners();
    },
  );

  bool get isEditRecipe => recipe.recipe.userId == Global.user!.id;

  Future<void> addAndRemoveFavorite() => handleTry(
    call: () async {
      if (favoriteRecipeDto!.exists) {
        await _favoriteRepository.removeFavorite(
          favoriteRecipeDto!.favoriteId!,
        );
        favoriteRecipeDto = favoriteRecipeDto!.copyWith(
          exists: false,
          favoriteId: null,
        );
      } else {
        final favoriteResult = await _favoriteRepository.addFavorite(
          FavoriteDto(recipeId: id),
        );
        favoriteRecipeDto = favoriteRecipeDto!.copyWith(
          exists: true,
          favoriteId: favoriteResult.id,
        );
      }
      notifyListeners();
    },
  );

  Future<void> viewRecipe() async {
    await _recipeRepository.viewRecipe(id);
  }
}
