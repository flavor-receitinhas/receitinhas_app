// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get welcomeTitle =>
      'Delight yourself with our\namazing culinary masterpieces!';

  @override
  String get language => 'Language';

  @override
  String get languageChangeSuccess => 'Language changed successfully';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get languageEnglish => 'English';

  @override
  String get languageSpanish => 'Spanish';

  @override
  String get languagePortuguese => 'Portuguese';

  @override
  String get welcomeBody =>
      'Awaken your passion for cooking and explore a world of unforgettable flavors with inspiring recipes.';

  @override
  String get welcomeBottomAppBar => 'Start Cooking';

  @override
  String get chooseAuthTitle => 'Before starting, we have a question.';

  @override
  String get chooseAuthBody =>
      'Are you a new culinary lover or do you already have an account with us?';

  @override
  String get chooseAuthRegisterButton => 'I\'m new here';

  @override
  String get chooseAuthLoginButton => 'I already have an account';

  @override
  String get registerTitle =>
      'Nothing better than becoming a Master of Culinary Arts!';

  @override
  String get registerEmail => 'Enter email';

  @override
  String get registerPassword => 'Enter password';

  @override
  String get registerTerms1 => 'By creating an account, you agree to the ';

  @override
  String get registerTerms2 => 'Terms of Use ';

  @override
  String get registerTerms3 => 'and ';

  @override
  String get registerTerms4 => 'Privacy Policy.';

  @override
  String get registerButton => 'Create account';

  @override
  String get registerValidatorEmail => 'Enter a valid email';

  @override
  String get registerValidatorPassword1 => 'Password is required';

  @override
  String get registerValidatorPassword2 =>
      'Password must be at least 8 characters';

  @override
  String get registerValidatorPassword3 =>
      'Password must contain at least one uppercase letter';

  @override
  String get registerValidatorPassword4 =>
      'Password must contain at least one lowercase letter';

  @override
  String get registerValidatorPassword5 =>
      'Password must contain at least one number';

  @override
  String get loginTitle => 'We\'re happy to have you back!';

  @override
  String get loginBody => 'Ready to create new recipes?';

  @override
  String get loginEmail => 'Enter email';

  @override
  String get loginPassword => 'Enter password';

  @override
  String get loginForgetPassword => 'Forgot password?';

  @override
  String get loginButton => 'Login';

  @override
  String get forgetPasswordTitle => 'Forgot your password?';

  @override
  String get forgetPasswordBody => 'No problem!';

  @override
  String get forgetPasswordHintFild => 'Enter email';

  @override
  String get forgetPasswordButton => 'Send recovery link';

  @override
  String get forgetPasswordValidatorEmail => 'Enter a valid email';

  @override
  String get forgetPasswordTextSnack => 'Sent to your email';

  @override
  String get forgetPasswordOptionSnack => 'Back';

  @override
  String get proteinPreferenceTitle => 'Do you have any Protein Preference?';

  @override
  String proteinPreferenceOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'vegetarian': 'Vegetarian',
      'vegan': 'Vegan',
      'meat': 'Meat',
      'fish': 'Fish',
      'other': 'Error',
    });
    return '$_temp0';
  }

  @override
  String get proteinPreferenceConfirm => 'Next step';

  @override
  String get proteinPreferenceSnackBar => 'Select an option';

  @override
  String get dietaryRestrictionTitle => 'Do you have any Dietary Restrictions?';

  @override
  String dietaryRestrictionOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'gluten': 'Gluten',
      'lactose': 'Lactose',
      'noRestriction': 'No restriction',
      'other': 'Error',
    });
    return '$_temp0';
  }

  @override
  String get dietaryRestrictionConfirm => 'Next step';

  @override
  String get dietaryRestrictionSnackBar => 'Select an option';

  @override
  String get difficultyRecipesTitle => 'Desired difficulty level:';

  @override
  String difficultyRecipesOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'easy': 'Easy and quick',
      'medium': 'Moderate or casual',
      'hard': 'Challenging, a nightmare',
      'other': 'Error',
    });
    return '$_temp0';
  }

  @override
  String get difficultyRecipesConfirm => 'Next step';

  @override
  String get difficultyRecipesSnackBar => 'Select an option';

  @override
  String get chooseNameTitle => 'A chef must have a memorable name!';

  @override
  String get chooseNameBody => 'What can we call you?';

  @override
  String get chooseNameHintText => 'Write your name...';

  @override
  String get chooseNameConfirm => 'Next step';

  @override
  String get configSettings => 'Settings';

  @override
  String get configCustomizePreference =>
      'Customize according to your preference';

  @override
  String get configLogoutPrompt =>
      'Do you really want to log out of your account?';

  @override
  String get configLogoutReminder =>
      'Remember that by logging out, you can access it again using your credentials.';

  @override
  String get configDontLogout => 'I don\'t want to log out';

  @override
  String get configLogout => 'Log out';

  @override
  String get configAboutOurTeam => 'Our team';

  @override
  String get configAboutTeamDescription =>
      'Our Team\n\nWelcome to the dedicated team behind Flavor. We are excited to introduce the creative minds who work tirelessly to make your experience even better.\n\nWe are committed to creating an app that meets your needs and expectations. Thank you for being part of our journey, and we hope to continue improving and innovating to offer you the best possible experience.';

  @override
  String get configChangePassword => 'Change password';

  @override
  String get configOldPassword => 'Old password';

  @override
  String get configOldPasswordHint => 'Write your old password';

  @override
  String get configNewPassword => 'New password';

  @override
  String get configNewPasswordHint => 'Enter your new password';

  @override
  String get configConfirmNewPassword => 'Confirm new password';

  @override
  String get configConfirmNewPasswordHint => 'Confirm your new password';

  @override
  String get configPasswordChangeNotification =>
      'You will be notified in your email inbox\nabout the password change.';

  @override
  String get configAccount => 'Account';

  @override
  String get configEditAccount => 'Edit Preferences';

  @override
  String get configCustomization => 'Customization';

  @override
  String get configNightMode => 'Night mode';

  @override
  String get configPrivacyPolicy => 'Privacy Policy';

  @override
  String get configTermsConditions => 'Terms and conditions';

  @override
  String get configOurTeam => 'Our team';

  @override
  String get configAppVersion => 'App Version';

  @override
  String get configName => 'Name';

  @override
  String get configNameHint => 'Write your name...';

  @override
  String get configFoodPreference => 'Food preference';

  @override
  String get configDietaryRestriction => 'Dietary restriction';

  @override
  String get favoriteOrganizeRecipesTitle => 'Organize by';

  @override
  String get favoriteOrganizeRecipesRecentFirst => 'Most recent first';

  @override
  String get favoriteOrganizeRecipesOldestFirst => 'Oldest first';

  @override
  String get favoriteOrganizeRecipesNameAsc => 'Name A to Z';

  @override
  String get favoriteOrganizeRecipesNameDesc => 'Name Z to A';

  @override
  String get favoritePageTitle => 'Favorites List';

  @override
  String get favoritePageSubtitle => 'Manage your favorite recipes';

  @override
  String get favoritePageSearchHint => 'Search your favorite recipe';

  @override
  String get favoritePageErrorLoading => 'Error loading recipes';

  @override
  String get favoritePageNoItemsFound => 'No recipes found';

  @override
  String get favoriteRemoveFavoritesTitle => 'Remove from favorites';

  @override
  String get favoriteRemoveFavoritesContent =>
      'Do you really want to remove this recipe from favorites?';

  @override
  String get customBottomBarExitAppTitle => 'Do you want to exit the app?';

  @override
  String get customBottomBarCancel => 'Cancel';

  @override
  String get customBottomBarExit => 'Exit';

  @override
  String get homePageGreeting => 'Hello';

  @override
  String get homePageSubtitle => 'What are we cooking today?';

  @override
  String get homePageSearchHint => 'Search for something to cook';

  @override
  String get homePageLatestRecipesTitle => 'Latest posted recipes';

  @override
  String get profileBackSheetConfirmExit =>
      'Are you sure you want to exit without saving changes?';

  @override
  String get profileBackSheetExitWithoutSaving => 'Exit without saving';

  @override
  String get profileBackSheetContinueEditing => 'Continue editing';

  @override
  String get profileSaveSheetConfirmMessage =>
      'Make sure you are certain, so we can show the world your new profile!';

  @override
  String get profileSaveSheetSaveChanges => 'Save changes';

  @override
  String get profileSaveSheetContinueEditing => 'Continue editing';

  @override
  String get profileEditProfilePageSaveChanges =>
      'Do you want to save the changes?';

  @override
  String get profileEditProfilePageTitle => 'Your profile';

  @override
  String get profileEditProfilePageSubtitle =>
      'Here are your published recipes';

  @override
  String get profileEditProfilePageBack => 'Back';

  @override
  String get profileEditProfilePageConfirmExit =>
      'Do you want to discard the changes?';

  @override
  String get profileEditProfilePageChangeProfilePicture => 'Change avatar';

  @override
  String get profileEditProfilePageRemoveProfilePicture => 'Remove Image';

  @override
  String get profileEditProfilePageImageRequirement =>
      'The image must be at least 256x256px';

  @override
  String get profileEditProfilePageTitleLabel => 'Title';

  @override
  String get profileEditProfilePageTitleHint => 'Select a title';

  @override
  String get profileEditProfilePageTitleDescription =>
      'Select a title with which you most identify';

  @override
  String get profileEditProfilePageAboutMe => 'About me';

  @override
  String get profileEditProfilePageAboutMeHint =>
      'Tell us a bit about yourself...';

  @override
  String get profileEditProfilePagePrivacy => 'Privacy';

  @override
  String get profileEditProfilePageHideFollowers => 'Hide followers';

  @override
  String get profileEditProfilePageHideLikes => 'Hide likes';

  @override
  String get profileMyProfilePageTitle => 'Your profile';

  @override
  String get profileMyProfilePageSubtitle => 'Here are your published recipes';

  @override
  String get profileMyProfilePageBack => 'Back';

  @override
  String get profileMyProfilePageEditProfile => 'Edit profile';

  @override
  String get profileMyProfilePageSearchHint => 'Find a recipe';

  @override
  String get profileMyProfilePageNoRecipes =>
      'You don\'t have any published recipes yet...';

  @override
  String get profileViewProfilePageTitle => 'Explore Profile';

  @override
  String get profileViewProfilePageSubtitle =>
      'Discover this user\'s culinary creations';

  @override
  String get profileViewProfilePageBack => 'Back';

  @override
  String get profileViewProfilePageNoRecipes =>
      'This chef doesn\'t have any published recipes...';

  @override
  String get recipeLeaveRecipeSheetDiscardWarning =>
      'By discarding, we cannot recover what was written in your recipe.';

  @override
  String get recipeLeaveRecipeSheetContinueWriting => 'Continue writing';

  @override
  String get recipeLeaveRecipeSheetDiscardRecipe => 'Discard recipe';

  @override
  String get recipeWriteTimePreparedMinutes => 'Minutes';

  @override
  String get recipeWriteTimePreparedHours => 'Hours';

  @override
  String get recipeCarouselSelectImagesRecipeMaxImages =>
      'Only 10 images are allowed per recipe';

  @override
  String get recipeCreateBackEndSafeButtonPublishPrompt =>
      'Do you want to publish your recipe?';

  @override
  String get recipeCreateBackEndSafeButtonPublishConfirmation =>
      'Make sure you are certain, so we can show the world your beautiful recipe!';

  @override
  String get recipeCreateBackEndSafeButtonPublish => 'Publish recipe';

  @override
  String get recipeCreateBackEndSafeButtonSaveDraft => 'Save recipe as draft';

  @override
  String get recipeCreateBackEndSafeButtonContinueWriting => 'Continue writing';

  @override
  String get recipeCreateBackEndSafeButtonSave => 'Save';

  @override
  String get recipeDifficultyTitle => 'Difficulty';

  @override
  String get recipeDifficultyBack => 'Back';

  @override
  String get recipeDifficultyNext => 'Next';

  @override
  String get recipePortionSnackBarMessage =>
      'Indicate how many servings your recipe can serve';

  @override
  String get recipePortionTitle => 'Servings';

  @override
  String get recipePortionQuestion =>
      'How many servings can your\nrecipe serve?';

  @override
  String get recipeTimePreparedTitle => 'Preparation time';

  @override
  String get recipeTimePreparedSnackBarMessage =>
      'Indicate the preparation time';

  @override
  String get recipeSelectIngredientHint => 'Choose the unit';

  @override
  String get recipeSelectIngredientRequiredFields => 'Required fields';

  @override
  String get recipeSelectIngredientConfirm => 'Confirm';

  @override
  String get recipeDetailsTitle => 'Recipe details';

  @override
  String get recipeIngredientsTitle => 'Ingredients';

  @override
  String get recipeInstructionsTitle => 'Preparation instructions';

  @override
  String get recipeServeFoodTitle => 'Time to serve!';

  @override
  String get recipeIntroducePortionSingular => 'serving';

  @override
  String get recipeIntroducePortionPlural => 'servings';

  @override
  String get recipeIntroduceTimePrepared => 'min';

  @override
  String get recipeLoadIngredientsError => 'Error loading ingredients';

  @override
  String get recipeNoItemsFound => 'No ingredient found';

  @override
  String get recipeAddIngredient => 'Add ingredient';

  @override
  String get recipeIngredientNotFound => 'Didn\'t find your ingredient?';

  @override
  String get recipeEnterIngredientBelow => 'Enter it in the field below';

  @override
  String get recipeEnterIngredientHint => 'Enter the ingredient';

  @override
  String get recipeConfirm => 'Confirm';

  @override
  String get recipeSelectQuantity => 'Select quantity';

  @override
  String get recipeSelectedIngredients => 'Selected ingredients';

  @override
  String get recipeCustomizeBasicInfoTitle => 'Customize basic information';

  @override
  String get recipeCustomizeBasicInfoDescription =>
      'This information will help identify basic things about your recipe, so be concise.';

  @override
  String get recipePortions => 'servings';

  @override
  String get recipeBasicInfoDescription =>
      'This information will help identify basic things about your recipe, so be concise.';

  @override
  String get recipeAddAtLeastOneIngredient => 'Add at least one ingredient';

  @override
  String get recipeAddImage => 'Add an image of the recipe';

  @override
  String get recipeAddCoverImage => 'Add a cover image';

  @override
  String get recipeFillAllFields => 'Fill in all fields correctly';

  @override
  String get recipeDiscardPrompt => 'Do you want to discard your recipe?';

  @override
  String get recipePhotosTitle => 'Recipe photos';

  @override
  String get recipeCoverTitle => 'Recipe cover';

  @override
  String get recipeTitleHint => 'Recipe title';

  @override
  String get recipeTitleValidation => 'Write a title with at least 3 letters';

  @override
  String get recipeSubtitleHint => 'Recipe subtitle';

  @override
  String get recipeAboutTitle => 'About the recipe';

  @override
  String get recipeAboutHint => 'Tell us a bit about your recipe here...';

  @override
  String get recipeAboutValidation => 'Write a bit more about the recipe';

  @override
  String get recipeWriteAtLeast50Chars =>
      'Write at least 50 characters to proceed.';

  @override
  String get recipeWriteInstructionsPlaceholder =>
      'Write the preparation instructions...';

  @override
  String get recipeSelectIngredientsTitle => 'Select ingredients';

  @override
  String get recipeSearchIngredientsHint => 'Search your ingredients';

  @override
  String get recipeChooseOtherIngredients => 'Choose other ingredients below';

  @override
  String get recipeFinish => 'Finish';

  @override
  String get recipeServeTimeTitle => 'Time to serve!';

  @override
  String get recipeFinalConsideration =>
      'Write a final consideration giving some tip or useful information for those who are completing or will complete the recipe.';

  @override
  String get recipeServeDetailsPlaceholder =>
      'Write in detail how to serve the dish...';

  @override
  String get recipeIntroduceBy => 'By';

  @override
  String get recipeIntroduceFavorite => 'Favorite';

  @override
  String get searchRecipeSearchHint => 'Search for something to cook';

  @override
  String get searchRecipeClearFilters => 'Clear filters';

  @override
  String get searchRecipeSearchResults => 'Search results';

  @override
  String get searchRecipeApplyFilter => 'Apply filter';

  @override
  String get searchRecipeFilterBy => 'FILTER BY';

  @override
  String get searchRecipeOrderBy => 'Order by';

  @override
  String get searchRecipePreparationTime => 'Preparation time';

  @override
  String get searchRecipeIngredients => 'Ingredients';

  @override
  String get searchRecipePortions => 'Servings';

  @override
  String get searchRecipeFoodPreference => 'Food preference';

  @override
  String get searchRecipeDifficulty => 'Difficulty';

  @override
  String get searchRecipeOrderByAsc => 'From A - Z';

  @override
  String get searchRecipeOrderByDesc => 'From Z - A';

  @override
  String get searchRecipeOrderDifficultyEasy => 'Easy';

  @override
  String get searchRecipeOrderDifficultyMedium => 'Medium';

  @override
  String get searchRecipeOrderDifficultyHard => 'Hard';

  @override
  String get searchLabel => 'Search';

  @override
  String get splashLoading => 'Loading...';

  @override
  String get dialogUnexpectedError => 'An unexpected error occurred!';

  @override
  String get dialogOk => 'Ok';

  @override
  String get dialogYes => 'Yes';

  @override
  String get dialogNo => 'No';

  @override
  String get errorPageReload => 'Reload';
}
