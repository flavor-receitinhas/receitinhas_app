import 'package:domain_receitinhas/core/global/global_variables.dart';
import 'package:domain_receitinhas/features/profile/domain/dtos/profile_dto.dart';
import 'package:domain_receitinhas/features/profile/domain/entities/profile_entity.dart';
import 'package:domain_receitinhas/features/profile/domain/repositories/profile_repository.dart';
import 'package:domain_receitinhas/features/recipes/domain/dtos/recipe_dto.dart';
import 'package:domain_receitinhas/features/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class ProfileController extends ManagerStore {
  final ProfileRepository _repository;
  final RecipeRepository _recipeRepository;
  ProfileController(this._repository, this._recipeRepository);

  late ProfileEntity profile;
  String? id;
  List<RecipeDto> recipes = [];
  final ScrollController scrollController = ScrollController();
  int page = 0;
  final int limit = 25;
  bool hasMore = true;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  Map<String, dynamic> currentArguments = {};

  @override
  Future<void> init(Map<String, dynamic> arguments) => handleTry(
    call: () async {
      currentArguments = arguments;
      if (arguments['id'] is String) {
        id = arguments['id'] as String;
      }

      if (id != null) {
        profile = (await getProfile(id!))!;
      } else {
        profile = await _repository.getProfile(Global.user!.id);
      }

      await getMoreRecipes();
      _setupScrollController();
    },
  );

  Future<ProfileEntity?> getProfile(String id) async => await handleTry(
    call: () async {
      final profile = await _repository.getProfile(id);
      return profile;
    },
  );

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
      userID: profile.userId,
      page: page,
      search: searchController.text,
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
      profileDto: ProfileDto(name: profile.name, biography: profile.biography),
    );
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
