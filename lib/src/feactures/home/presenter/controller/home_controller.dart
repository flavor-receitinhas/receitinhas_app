import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/order_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/export_manager.dart';

class HomeController extends ManagerStore {
  final RecipeRepository _recipeRepository;
  final UserOmboardingRepository _userFoodPrefRepository;
  final ProfileRepository _profileRepository;

  HomeController(this._recipeRepository, this._userFoodPrefRepository,
      this._profileRepository);

  List<RecipeDto> recipes = [];
  final _pageSize = 25;
  final PagingController<int, RecipeDto> pagingController =
      PagingController(firstPageKey: 0);
  bool? isDesc;
  OrderRecipeEnum? orderBy;
  int? timePreparedTo;
  int? timePreparedFrom;
  int? portionTo;
  int? portionFrom;
  List<DifficultyRecipe>? difficultyRecipe;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          await loadingProfile();
          pagingController.addPageRequestListener(_fetch);
        },
      );

  Future<List<RecipeDto>> listRecipe({
    required int page,
  }) async {
    state = StateManager.loading;

    return await _recipeRepository.listRecipe(
      page: page,
      isDesc: isDesc,
      orderBy: orderBy,
      timePreparedTo: timePreparedTo,
      timePreparedFrom: timePreparedFrom,
      portionTo: portionTo,
      portionFrom: portionFrom,
      difficultyRecipe: difficultyRecipe,
    );
  }

  Future<void> loadingProfile() async {
    Global.profile = await _profileRepository.getProfile(Global.user!.id);
    notifyListeners();
  }

  Future<bool> verifyOnboading() async {
    final result = await _userFoodPrefRepository.getUserPref(
      userId: Global.user!.id,
    );
    if (result.dietaryRestriction.isEmpty) {
      return true;
    }
    if (result.difficultyRecipe.isEmpty) {
      return true;
    }
    if (result.protein.isEmpty) {
      return true;
    }
    return false;
  }

  Future<void> _fetch(int pageKey) async {
    if (pageKey == 0) {
      state = StateManager.loading;
    }
    final result = await listRecipe(
      page: pageKey,
    );

    final isLastPage = result.length < _pageSize;
    if (isLastPage) {
      pagingController.appendLastPage(result);
    } else {
      pagingController.appendPage(result, ++pageKey);
    }
  }
}
