import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class MyProfileController extends ManagerStore {
  final ProfileRepository _repository;
  final RecipeRepository _recipeRepository;

  MyProfileController(this._repository, this._recipeRepository);

  String? id;
  ProfileEntity? profile;
  int page = 0;
  final int limit = 25;
  bool hasMore = true;
  bool isLoading = false;
  List<RecipeDto> recipes = [];
  final ScrollController scrollController = ScrollController();

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          id = arguments['id'] as String;
          profile = await getProfile(id!);

          await getMoreRecipes();
          _setupScrollController();
        },
      );

  Future<ProfileEntity> getProfile(String id) async =>
      await _repository.getProfile(id);

  void _setupScrollController() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        await getMoreRecipes();
      }
    });
  }

  Future<List<RecipeDto>> getUserRecipes(int page) async {
    final result = await _recipeRepository.getUserRecipes(
      userID: profile!.userId,
      page: page,
    );
    return result;
  }

  Future<void> getMoreRecipes() async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    final result = await getUserRecipes(page);

    if (result.length < limit) {
      hasMore = false;
    } else {
      page++;
    }
    recipes.addAll(result);

    isLoading = false;
    notifyListeners();
  }

  Future<void> refresh() => handleTry(
        call: () async {
          page = 0;
          hasMore = true;
          isLoading = false;
          recipes = [];
          await getMoreRecipes();
        },
      );
}
