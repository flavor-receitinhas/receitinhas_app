import 'package:app_receitas/src/feactures/profile/domain/dtos/profile_dto.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class ProfileController extends ManagerStore {
  final ProfileRepository _repository;
  final RecipeRepository _recipeRepository;
  ProfileController(this._repository, this._recipeRepository);

  late ProfileEntity profile;
  List<RecipeDto> recipes = [];
  final ScrollController scrollController = ScrollController();
  int page = 0;
  final int limit = 25;
  bool hasMore = true;
  bool isLoading = false;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          profile = arguments['profile'] as ProfileEntity;

          await getMoreRecipes();

          scrollController.addListener(() async {
            if (scrollController.position.pixels ==
                    scrollController.position.maxScrollExtent &&
                hasMore &&
                !isLoading) {
              await getMoreRecipes();
            }
          });
        },
      );

  Future<void> getProfile(String id) => handleTry(
        call: () async {
          profile = await _repository.getProfile(id);
        },
      );

  Future<List<RecipeDto>> getUserRecipes(int page) async {
    final result = await _recipeRepository.getUserRecipes(
      userID: profile.userId,
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

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(
      userId: profile.userId,
      profileDto: ProfileDto(
        name: profile.name,
        biography: profile.biography,
      ),
    );
  }
}
