// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get welcomeTitle =>
      '¡Déjate encantar con nuestras\nincreíbles obras culinarias!';

  @override
  String get language => 'Idioma';

  @override
  String get languageChangeSuccess => 'Idioma cambiado con éxito';

  @override
  String get changeLanguage => 'Cambiar idioma';

  @override
  String get languageEnglish => 'Inglés';

  @override
  String get languageSpanish => 'Español';

  @override
  String get languagePortuguese => 'Portugués';

  @override
  String get welcomeBody =>
      'Despierta tu pasión por la cocina y explora un mundo de sabores inolvidables con recetas inspiradoras.';

  @override
  String get welcomeBottomAppBar => 'Comenzar a cocinar';

  @override
  String get chooseAuthTitle => 'Antes de comenzar, queremos aclarar una duda.';

  @override
  String get chooseAuthBody =>
      '¿Eres un nuevo amante de la cocina o ya tienes una cuenta con nosotros?';

  @override
  String get chooseAuthRegisterButton => 'Soy nuevo(a) aquí';

  @override
  String get chooseAuthLoginButton => 'Ya tengo una cuenta';

  @override
  String get registerTitle =>
      '¡Nada mejor que convertirse en un Maestro de la Cocina!';

  @override
  String get registerEmail => 'Introducir correo electrónico';

  @override
  String get registerPassword => 'Introducir contraseña';

  @override
  String get registerTerms1 => 'Al crear la cuenta, aceptas los ';

  @override
  String get registerTerms2 => 'Términos de Uso ';

  @override
  String get registerTerms3 => 'y la ';

  @override
  String get registerTerms4 => 'Política de Privacidad.';

  @override
  String get registerButton => 'Crear cuenta';

  @override
  String get registerValidatorEmail => 'Introduce un correo electrónico válido';

  @override
  String get registerValidatorPassword1 => 'La contraseña es obligatoria';

  @override
  String get registerValidatorPassword2 =>
      'La contraseña debe tener al menos 8 caracteres';

  @override
  String get registerValidatorPassword3 =>
      'La contraseña debe contener al menos una letra mayúscula';

  @override
  String get registerValidatorPassword4 =>
      'La contraseña debe contener al menos una letra minúscula';

  @override
  String get registerValidatorPassword5 =>
      'La contraseña debe contener al menos un número';

  @override
  String get loginTitle => '¡Nos alegra tenerte de vuelta!';

  @override
  String get loginBody => '¿Listo(a) para crear nuevas recetas?';

  @override
  String get loginEmail => 'Introducir correo electrónico';

  @override
  String get loginPassword => 'Introducir contraseña';

  @override
  String get loginForgetPassword => '¿Olvidaste tu contraseña?';

  @override
  String get loginButton => 'Iniciar sesión';

  @override
  String get forgetPasswordTitle => '¿Olvidaste tu contraseña?';

  @override
  String get forgetPasswordBody => '¡No hay problema!';

  @override
  String get forgetPasswordHintFild => 'Introducir correo electrónico';

  @override
  String get forgetPasswordButton => 'Enviar enlace de recuperación';

  @override
  String get forgetPasswordValidatorEmail =>
      'Introduce un correo electrónico válido';

  @override
  String get forgetPasswordTextSnack => 'Enviado a tu correo electrónico';

  @override
  String get forgetPasswordOptionSnack => 'Volver';

  @override
  String get proteinPreferenceTitle =>
      '¿Tienes alguna preferencia de proteína?';

  @override
  String proteinPreferenceOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'vegetarian': 'Vegetariano',
      'vegan': 'Vegano',
      'meat': 'Carne',
      'fish': 'Pescado',
      'other': 'Error',
    });
    return '$_temp0';
  }

  @override
  String get proteinPreferenceConfirm => 'Siguiente paso';

  @override
  String get proteinPreferenceSnackBar => 'Selecciona una opción';

  @override
  String get dietaryRestrictionTitle =>
      '¿Tienes alguna restricción alimentaria?';

  @override
  String dietaryRestrictionOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'gluten': 'Gluten',
      'lactose': 'Lactosa',
      'noRestriction': 'Sin restricción',
      'other': 'Error',
    });
    return '$_temp0';
  }

  @override
  String get dietaryRestrictionConfirm => 'Siguiente paso';

  @override
  String get dietaryRestrictionSnackBar => 'Selecciona una opción';

  @override
  String get difficultyRecipesTitle => 'Nivel de dificultad deseado:';

  @override
  String difficultyRecipesOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'easy': 'Fácil y rápido',
      'medium': 'Moderado o casual',
      'hard': 'Desafiante, una pesadilla',
      'other': 'Error',
    });
    return '$_temp0';
  }

  @override
  String get difficultyRecipesConfirm => 'Siguiente paso';

  @override
  String get difficultyRecipesSnackBar => 'Selecciona una opción';

  @override
  String get chooseNameTitle => '¡Un chef debe tener un nombre memorable!';

  @override
  String get chooseNameBody => '¿Cómo podemos llamarte?';

  @override
  String get chooseNameHintText => 'Escribe tu nombre...';

  @override
  String get chooseNameConfirm => 'Siguiente paso';

  @override
  String get configSettings => 'Configuraciones';

  @override
  String get configCustomizePreference => 'Personaliza según tu preferencia';

  @override
  String get configLogoutPrompt =>
      '¿Realmente deseas cerrar sesión en tu cuenta?';

  @override
  String get configLogoutReminder =>
      'Recuerda que al cerrar sesión, podrás acceder nuevamente usando tus credenciales.';

  @override
  String get configDontLogout => 'No deseo cerrar sesión';

  @override
  String get configLogout => 'Cerrar sesión';

  @override
  String get configAboutOurTeam => 'Nuestro equipo';

  @override
  String get configAboutTeamDescription =>
      'Nuestro Equipo\n\nBienvenido al equipo dedicado detrás de Flavor. Estamos emocionados de presentar las mentes creativas que trabajan incansablemente para mejorar tu experiencia.\n\nEstamos comprometidos a crear una aplicación que satisfaga tus necesidades y expectativas. Gracias por ser parte de nuestro viaje, y esperamos continuar mejorando e innovando para ofrecerte la mejor experiencia posible.';

  @override
  String get configChangePassword => 'Cambiar contraseña';

  @override
  String get configOldPassword => 'Contraseña antigua';

  @override
  String get configOldPasswordHint => 'Escribe tu contraseña antigua';

  @override
  String get configNewPassword => 'Nueva contraseña';

  @override
  String get configNewPasswordHint => 'Introduce tu nueva contraseña';

  @override
  String get configConfirmNewPassword => 'Confirmar nueva contraseña';

  @override
  String get configConfirmNewPasswordHint => 'Confirma tu nueva contraseña';

  @override
  String get configPasswordChangeNotification =>
      'Serás notificado en tu correo electrónico\nsobre el cambio de contraseña.';

  @override
  String get configAccount => 'Cuenta';

  @override
  String get configEditAccount => 'Editar Preferencias';

  @override
  String get configCustomization => 'Personalización';

  @override
  String get configNightMode => 'Modo nocturno';

  @override
  String get configPrivacyPolicy => 'Política de privacidad';

  @override
  String get configTermsConditions => 'Términos y condiciones';

  @override
  String get configOurTeam => 'Nuestro equipo';

  @override
  String get configAppVersion => 'Versión de la aplicación';

  @override
  String get configMoreInformation => 'Más información';

  @override
  String get configName => 'Nombre';

  @override
  String get configNameHint => 'Escribe tu nombre...';

  @override
  String get configFoodPreference => 'Preferencia alimentaria';

  @override
  String get configDietaryRestriction => 'Restricción alimentaria';

  @override
  String get favoriteOrganizeRecipesTitle => 'Organizar por';

  @override
  String get favoriteOrganizeRecipesRecentFirst => 'Más reciente primero';

  @override
  String get favoriteOrganizeRecipesOldestFirst => 'Más antiguo primero';

  @override
  String get favoriteOrganizeRecipesNameAsc => 'Nombre de A a Z';

  @override
  String get favoriteOrganizeRecipesNameDesc => 'Nombre de Z a A';

  @override
  String get favoritePageTitle => 'Lista de Favoritos';

  @override
  String get favoritePageSubtitle => 'Administra tus recetas favoritas';

  @override
  String get favoritePageSearchHint => 'Busca tu receta favorita';

  @override
  String get favoritePageErrorLoading => 'Error al cargar recetas';

  @override
  String get favoritePageNoItemsFound => 'No se encontraron recetas';

  @override
  String get favoriteRemoveFavoritesTitle => 'Eliminar de favoritos';

  @override
  String get favoriteRemoveFavoritesContent =>
      '¿Realmente desea eliminar esta receta de favoritos?';

  @override
  String get customBottomBarExitAppTitle => '¿Deseas salir de la aplicación?';

  @override
  String get customBottomBarCancel => 'Cancelar';

  @override
  String get customBottomBarExit => 'Salir';

  @override
  String get homePageGreeting => 'Hola';

  @override
  String get homePageSubtitle => '¿Qué vamos a cocinar hoy?';

  @override
  String get homePageSearchHint => 'Busca algo para cocinar';

  @override
  String get homePageLatestRecipesTitle => 'Últimas recetas publicadas';

  @override
  String get profileBackSheetConfirmExit =>
      '¿Estás seguro de que deseas salir sin guardar los cambios?';

  @override
  String get profileBackSheetExitWithoutSaving => 'Salir sin guardar';

  @override
  String get profileBackSheetContinueEditing => 'Continuar editando';

  @override
  String get profileSaveSheetConfirmMessage =>
      '¡Asegúrate de estar seguro, así podremos mostrar al mundo tu nuevo perfil!';

  @override
  String get profileSaveSheetSaveChanges => 'Guardar cambios';

  @override
  String get profileSaveSheetContinueEditing => 'Continuar editando';

  @override
  String get profileEditProfilePageSaveChanges =>
      '¿Deseas guardar los cambios?';

  @override
  String get profileEditProfilePageTitle => 'Tu perfil';

  @override
  String get profileEditProfilePageSubtitle =>
      'Aquí están tus recetas publicadas';

  @override
  String get profileEditProfilePageBack => 'Volver';

  @override
  String get profileEditProfilePageConfirmExit =>
      '¿Deseas descartar los cambios?';

  @override
  String get profileEditProfilePageChangeProfilePicture => 'Cambiar avatar';

  @override
  String get profileEditProfilePageRemoveProfilePicture => 'Eliminar imagen';

  @override
  String get profileEditProfilePageImageRequirement =>
      'La imagen debe tener al menos 256x256px';

  @override
  String get profileEditProfilePageTitleLabel => 'Título';

  @override
  String get profileEditProfilePageTitleHint => 'Selecciona un título';

  @override
  String get profileEditProfilePageTitleDescription =>
      'Selecciona un título con el que más te identifiques';

  @override
  String get profileEditProfilePageAboutMe => 'Sobre mí';

  @override
  String get profileEditProfilePageAboutMeHint =>
      'Cuéntanos un poco sobre ti...';

  @override
  String get profileEditProfilePagePrivacy => 'Privacidad';

  @override
  String get profileEditProfilePageHideFollowers => 'Ocultar seguidores';

  @override
  String get profileEditProfilePageHideLikes => 'Ocultar me gusta';

  @override
  String get profileMyProfilePageTitle => 'Tu perfil';

  @override
  String get profileMyProfilePageSubtitle =>
      'Aquí están tus recetas publicadas';

  @override
  String get profileMyProfilePageBack => 'Volver';

  @override
  String get profileMyProfilePageEditProfile => 'Editar perfil';

  @override
  String get profileMyProfilePageSearchHint => 'Encuentra una receta';

  @override
  String get profileMyProfilePageNoRecipes =>
      'Aún no tienes recetas publicadas...';

  @override
  String get profileViewProfilePageTitle => 'Explorar perfil';

  @override
  String get profileViewProfilePageSubtitle =>
      'Descubre las creaciones culinarias de este usuario';

  @override
  String get profileViewProfilePageBack => 'Volver';

  @override
  String get profileViewProfilePageNoRecipes =>
      'Este chef no tiene recetas publicadas...';

  @override
  String get recipeLeaveRecipeSheetDiscardWarning =>
      'Al descartar, no podremos recuperar lo que escribiste en tu receta.';

  @override
  String get recipeLeaveRecipeSheetContinueWriting => 'Continuar escribiendo';

  @override
  String get recipeLeaveRecipeSheetDiscardRecipe => 'Descartar receta';

  @override
  String get recipeWriteTimePreparedMinutes => 'Minutos';

  @override
  String get recipeWriteTimePreparedHours => 'Horas';

  @override
  String get recipeCarouselSelectImagesRecipeMaxImages =>
      'Solo se permiten 10 imágenes por receta';

  @override
  String get recipeCreateBackEndSafeButtonPublishPrompt =>
      '¿Deseas publicar tu receta?';

  @override
  String get recipeCreateBackEndSafeButtonPublishConfirmation =>
      '¡Asegúrate de estar seguro, así podremos mostrar al mundo tu hermosa receta!';

  @override
  String get recipeCreateBackEndSafeButtonPublish => 'Publicar receta';

  @override
  String get recipeCreateBackEndSafeButtonSaveDraft =>
      'Guardar receta como borrador';

  @override
  String get recipeCreateBackEndSafeButtonContinueWriting =>
      'Continuar escribiendo';

  @override
  String get recipeCreateBackEndSafeButtonSave => 'Guardar';

  @override
  String get recipeDifficultyTitle => 'Dificultad';

  @override
  String get recipeDifficultyBack => 'Volver';

  @override
  String get recipeDifficultyNext => 'Siguiente';

  @override
  String get recipePortionSnackBarMessage =>
      'Indica cuántas porciones puede servir tu receta';

  @override
  String get recipePortionTitle => 'Porciones';

  @override
  String get recipePortionQuestion =>
      '¿Cuántas porciones\npuede servir tu receta?';

  @override
  String get recipeTimePreparedTitle => 'Tiempo de preparación';

  @override
  String get recipeTimePreparedSnackBarMessage =>
      'Indica el tiempo de preparación';

  @override
  String get recipeSelectIngredientHint => 'Elige la unidad';

  @override
  String get recipeSelectIngredientRequiredFields => 'Campos obligatorios';

  @override
  String get recipeSelectIngredientConfirm => 'Confirmar';

  @override
  String get recipeDetailsTitle => 'Detalles de la receta';

  @override
  String get recipeIngredientsTitle => 'Ingredientes';

  @override
  String get recipeInstructionsTitle => 'Instrucciones de preparación';

  @override
  String get recipeServeFoodTitle => '¡Hora de servir!';

  @override
  String get recipeIntroducePortionSingular => 'porción';

  @override
  String get recipeIntroducePortionPlural => 'porciones';

  @override
  String get recipeIntroduceTimePrepared => 'min';

  @override
  String get recipeLoadIngredientsError => 'Error al cargar ingredientes';

  @override
  String get recipeNoItemsFound => 'No se encontraron ingrediente';

  @override
  String get recipeAddIngredient => 'Agregar ingrediente';

  @override
  String get recipeIngredientNotFound => '¿No encontraste tu ingrediente?';

  @override
  String get recipeEnterIngredientBelow =>
      'Ingresa el ingrediente en el campo de abajo';

  @override
  String get recipeEnterIngredientHint => 'Ingresa el ingrediente';

  @override
  String get recipeConfirm => 'Confirmar';

  @override
  String get recipeSelectQuantity => 'Seleccionar cantidad';

  @override
  String get recipeSelectedIngredients => 'Ingredientes seleccionados';

  @override
  String get recipeCustomizeBasicInfoTitle => 'Personaliza información básica';

  @override
  String get recipeCustomizeBasicInfoDescription =>
      'Esta información ayudará a identificar aspectos básicos de tu receta, así que sé conciso.';

  @override
  String get recipePortions => 'porciones';

  @override
  String get recipeBasicInfoDescription =>
      'Esta información ayudará a identificar aspectos básicos de tu receta, así que sé conciso.';

  @override
  String get recipeAddAtLeastOneIngredient => 'Agrega al menos un ingrediente';

  @override
  String get recipeAddImage => 'Agrega una imagen de la receta';

  @override
  String get recipeAddCoverImage => 'Agrega una imagen de portada';

  @override
  String get recipeFillAllFields => 'Completa todos los campos correctamente';

  @override
  String get recipeDiscardPrompt => '¿Deseas descartar tu receta?';

  @override
  String get recipePhotosTitle => 'Fotos de la receta';

  @override
  String get recipeCoverTitle => 'Portada de la receta';

  @override
  String get recipeTitleHint => 'Título de la receta';

  @override
  String get recipeTitleValidation => 'Escribe un título con al menos 3 letras';

  @override
  String get recipeSubtitleHint => 'Subtítulo de la receta';

  @override
  String get recipeAboutTitle => 'Sobre la receta';

  @override
  String get recipeAboutHint => 'Cuéntanos un poco sobre tu receta aquí...';

  @override
  String get recipeAboutValidation => 'Escribe un poco más sobre la receta';

  @override
  String get recipeWriteAtLeast50Chars =>
      'Escribe al menos 50 caracteres para continuar.';

  @override
  String get recipeWriteInstructionsPlaceholder =>
      'Escribe las instrucciones de preparación...';

  @override
  String get recipeSelectIngredientsTitle => 'Seleccionar ingredientes';

  @override
  String get recipeSearchIngredientsHint => 'Busca tus ingredientes';

  @override
  String get recipeChooseOtherIngredients =>
      'Elige otros ingredientes a continuación';

  @override
  String get recipeFinish => 'Finalizar';

  @override
  String get recipeServeTimeTitle => '¡Hora de servir!';

  @override
  String get recipeFinalConsideration =>
      'Escribe una consideración final dando algún consejo o información útil para quienes estén completando o vayan a completar la receta.';

  @override
  String get recipeServeDetailsPlaceholder =>
      'Escribe en detalle cómo servir el plato...';

  @override
  String get recipeIntroduceBy => 'Por';

  @override
  String get recipeIntroduceFavorite => 'Favorito';

  @override
  String get searchRecipeSearchHint => 'Busca algo para cocinar';

  @override
  String get searchRecipeClearFilters => 'Limpiar filtros';

  @override
  String get searchRecipeSearchResults => 'Resultados de búsqueda';

  @override
  String get searchRecipeApplyFilter => 'Aplicar filtro';

  @override
  String get searchRecipeFilterBy => 'FILTRAR POR';

  @override
  String get searchRecipeOrderBy => 'Ordenar por';

  @override
  String get searchRecipePreparationTime => 'Tiempo de preparación';

  @override
  String get searchRecipeIngredients => 'Ingredientes';

  @override
  String get searchRecipePortions => 'Porciones';

  @override
  String get searchRecipeFoodPreference => 'Preferencia alimentaria';

  @override
  String get searchRecipeDifficulty => 'Dificultad';

  @override
  String get searchRecipeOrderByAsc => 'De A - Z';

  @override
  String get searchRecipeOrderByDesc => 'De Z - A';

  @override
  String get searchRecipeOrderDifficultyEasy => 'Fácil';

  @override
  String get searchRecipeOrderDifficultyMedium => 'Medio';

  @override
  String get searchRecipeOrderDifficultyHard => 'Difícil';

  @override
  String get searchLabel => 'Buscar';

  @override
  String get splashLoading => 'Cargando...';

  @override
  String get dialogUnexpectedError => '¡Ocurrió un error inesperado!';

  @override
  String get dialogOk => 'Ok';

  @override
  String get dialogYes => 'Sí';

  @override
  String get dialogNo => 'No';

  @override
  String get errorPageReload => 'Recargar';
}
