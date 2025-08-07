// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get welcomeTitle =>
      'Encante-se com nossas\nobras culinárias incríveis!';

  @override
  String get language => 'Idioma';

  @override
  String get languageChangeSuccess => 'Idioma alterado com sucesso';

  @override
  String get changeLanguage => 'Mudar idioma';

  @override
  String get languageEnglish => 'Inglês';

  @override
  String get languageSpanish => 'Espanhol';

  @override
  String get languagePortuguese => 'Português';

  @override
  String get welcomeBody =>
      'Desperte sua paixão pela culinária e explore um mundo de sabores inesquecíveis com receitas inspiradoras.';

  @override
  String get welcomeBottomAppBar => 'Começar a Cozinhar';

  @override
  String get chooseAuthTitle => 'Antes de começar, queremos tirar uma dúvida.';

  @override
  String get chooseAuthBody =>
      'Você é um novo amante da culinária ou já tem uma conta por aqui?';

  @override
  String get chooseAuthRegisterButton => 'Sou novo(a) aqui';

  @override
  String get chooseAuthLoginButton => 'Já tenho uma conta';

  @override
  String get registerTitle =>
      'Nada melhor que se tornar um Mestre da Culinária!';

  @override
  String get registerEmail => 'Inserir e-mail';

  @override
  String get registerPassword => 'Inserir senha';

  @override
  String get registerTerms1 => 'Ao criar a conta, você concorda com os ';

  @override
  String get registerTerms2 => 'Termos de Uso ';

  @override
  String get registerTerms3 => 'e ';

  @override
  String get registerTerms4 => 'Política de Privacidade.';

  @override
  String get registerButton => 'Criar conta';

  @override
  String get registerValidatorEmail => 'Digite um email válido';

  @override
  String get registerValidatorPassword1 => 'Senha é obrigatória';

  @override
  String get registerValidatorPassword2 =>
      'A senha deve conter pelo menos 8 caracteres';

  @override
  String get registerValidatorPassword3 =>
      'A senha deve conter pelo menos uma letra maiúscula';

  @override
  String get registerValidatorPassword4 =>
      'A senha deve conter pelo menos uma letra minúscula';

  @override
  String get registerValidatorPassword5 =>
      'A senha deve conter pelo menos um número';

  @override
  String get loginTitle => 'Ficamos felizes com seu retorno!';

  @override
  String get loginBody => 'Pronto(a) para criar novas receitas?';

  @override
  String get loginEmail => 'Inserir e-mail';

  @override
  String get loginPassword => 'Inserir senha';

  @override
  String get loginForgetPassword => 'Esqueceu a senha?';

  @override
  String get loginButton => 'Entrar';

  @override
  String get forgetPasswordTitle => 'Esqueceu sua senha?';

  @override
  String get forgetPasswordBody => 'Sem problemas!';

  @override
  String get forgetPasswordHintFild => 'Inserir e-mail';

  @override
  String get forgetPasswordButton => 'Enviar link de recuperação';

  @override
  String get forgetPasswordValidatorEmail => 'Digite um email válido';

  @override
  String get forgetPasswordTextSnack => 'Enviado para o seu email';

  @override
  String get forgetPasswordOptionSnack => 'Voltar';

  @override
  String get proteinPreferenceTitle => 'Tem alguma Preferência de Proteína?';

  @override
  String proteinPreferenceOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'vegetarian': 'Vegetariano',
      'vegan': 'Vegano',
      'meat': 'Carne',
      'fish': 'Peixe',
      'other': 'Erro',
    });
    return '$_temp0';
  }

  @override
  String get proteinPreferenceConfirm => 'Próxima etapa';

  @override
  String get proteinPreferenceSnackBar => 'Selecione uma opção';

  @override
  String get dietaryRestrictionTitle => 'Possui alguma Restrição Alimentar?';

  @override
  String dietaryRestrictionOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'gluten': 'Glúten',
      'lactose': 'Lactose',
      'noRestriction': 'Nenhuma restrição',
      'other': 'Erro',
    });
    return '$_temp0';
  }

  @override
  String get dietaryRestrictionConfirm => 'Próxima etapa';

  @override
  String get dietaryRestrictionSnackBar => 'Selecione uma opção';

  @override
  String get difficultyRecipesTitle => 'Nivel de dificuldade desejado:';

  @override
  String difficultyRecipesOptions(String choice) {
    String _temp0 = intl.Intl.selectLogic(choice, {
      'easy': 'Fácil e rápido',
      'medium': 'Moderado, ou casual',
      'hard': 'Desafiador, um pesadelo',
      'other': 'Erro',
    });
    return '$_temp0';
  }

  @override
  String get difficultyRecipesConfirm => 'Próxima etapa';

  @override
  String get difficultyRecipesSnackBar => 'Selecione uma opção';

  @override
  String get chooseNameTitle => 'Um chefe deve ter um nome memóravel!';

  @override
  String get chooseNameBody => 'Como podemos te chamar ?';

  @override
  String get chooseNameHintText => 'Escreva seu nome...';

  @override
  String get chooseNameConfirm => 'Próxima etapa';

  @override
  String get configSettings => 'Configurações';

  @override
  String get configCustomizePreference =>
      'Personalize conforme sua preferência';

  @override
  String get configLogoutPrompt => 'Deseja realmente sair da sua conta?';

  @override
  String get configLogoutReminder =>
      'Lembrando que ao sair da sua conta, poderá acessar ela novamente usando suas credenciais.';

  @override
  String get configDontLogout => 'Não desejo sair da conta';

  @override
  String get configLogout => 'Sair da conta';

  @override
  String get configAboutOurTeam => 'Nossa equipe';

  @override
  String get configAboutTeamDescription =>
      'Nossa Equipe\n\nBem-vindo à equipe dedicada por trás do Flavor. Estamos entusiasmados em apresentar as mentes criativas que trabalham incansavelmente para tornar a sua experiência ainda melhor.\n\nEstamos comprometidos em criar um aplicativo que atenda às suas necessidades e expectativas. Agradecemos por fazer parte da nossa jornada e esperamos continuar aprimorando e inovando para oferecer a você a melhor experiência possível.';

  @override
  String get configChangePassword => 'Alterar senha';

  @override
  String get configOldPassword => 'Senha antiga';

  @override
  String get configOldPasswordHint => 'Escreva sua senha antiga';

  @override
  String get configNewPassword => 'Nova senha';

  @override
  String get configNewPasswordHint => 'Digite sua nova senha';

  @override
  String get configConfirmNewPassword => 'Confirme a nova senha';

  @override
  String get configConfirmNewPasswordHint => 'Confirme sua nova senha';

  @override
  String get configPasswordChangeNotification =>
      'Você será notificado na sua caixa de emails\nsobre a mudança de senha.';

  @override
  String get configAccount => 'Conta';

  @override
  String get configEditAccount => 'Editar Preferências';

  @override
  String get configCustomization => 'Personalização';

  @override
  String get configNightMode => 'Modo noturno';

  @override
  String get configPrivacyPolicy => 'Políticas de privacidade';

  @override
  String get configTermsConditions => 'Termos e condições';

  @override
  String get configOurTeam => 'Nossa equipe';

  @override
  String get configAppVersion => 'Versão do Aplicativo';

  @override
  String get configName => 'Nome';

  @override
  String get configNameHint => 'Escreva seu nome...';

  @override
  String get configFoodPreference => 'Preferência alimentar';

  @override
  String get configDietaryRestriction => 'Restrição alimentar';

  @override
  String get favoriteOrganizeRecipesTitle => 'Organizar por';

  @override
  String get favoriteOrganizeRecipesRecentFirst => 'Mais recente primeiro';

  @override
  String get favoriteOrganizeRecipesOldestFirst => 'Mais antigo primeiro';

  @override
  String get favoriteOrganizeRecipesNameAsc => 'Nome de A a Z';

  @override
  String get favoriteOrganizeRecipesNameDesc => 'Nome de Z a A';

  @override
  String get favoritePageTitle => 'Lista de Favoritos';

  @override
  String get favoritePageSubtitle => 'Gerencie suas receitas favoritas';

  @override
  String get favoritePageSearchHint => 'Pesquise sua receita favorita';

  @override
  String get favoritePageErrorLoading => 'Erro ao carregar receitas';

  @override
  String get favoritePageNoItemsFound => 'Nenhuma receita encontrada';

  @override
  String get favoriteRemoveFavoritesTitle => 'Remover dos favoritos';

  @override
  String get favoriteRemoveFavoritesContent =>
      'Deseja realmente remover essa receita dos favoritos?';

  @override
  String get customBottomBarExitAppTitle => 'Deseja sair do app?';

  @override
  String get customBottomBarCancel => 'Cancelar';

  @override
  String get customBottomBarExit => 'Sair';

  @override
  String get homePageGreeting => 'Olá';

  @override
  String get homePageSubtitle => 'O que vamos cozinhar hoje?';

  @override
  String get homePageSearchHint => 'Procure algo para cozinhar';

  @override
  String get homePageLatestRecipesTitle => 'Últimas receitas postadas';

  @override
  String get profileBackSheetConfirmExit =>
      'Você tem certeza que deseja sair sem salvar as alterações?';

  @override
  String get profileBackSheetExitWithoutSaving => 'Sair sem salvar';

  @override
  String get profileBackSheetContinueEditing => 'Continuar editando';

  @override
  String get profileSaveSheetConfirmMessage =>
      'Verifique bem se tem certeza, assim podemos mostrar ao mundo o seu novo perfil!';

  @override
  String get profileSaveSheetSaveChanges => 'Salvar alterações';

  @override
  String get profileSaveSheetContinueEditing => 'Continuar editando';

  @override
  String get profileEditProfilePageSaveChanges =>
      'Deseja salvar as alterações?';

  @override
  String get profileEditProfilePageTitle => 'Seu perfil';

  @override
  String get profileEditProfilePageSubtitle =>
      'Aqui fica suas receitas publicadas';

  @override
  String get profileEditProfilePageBack => 'Voltar';

  @override
  String get profileEditProfilePageConfirmExit =>
      'Você deseja descartar as alterações?';

  @override
  String get profileEditProfilePageChangeProfilePicture => 'Alterar avatar';

  @override
  String get profileEditProfilePageRemoveProfilePicture => 'Remover Imagem';

  @override
  String get profileEditProfilePageImageRequirement =>
      'A imagem tem que ter no minimo 256x256px';

  @override
  String get profileEditProfilePageTitleLabel => 'Título';

  @override
  String get profileEditProfilePageTitleHint => 'Selecione um título';

  @override
  String get profileEditProfilePageTitleDescription =>
      'Selecione um título na qual você mais se indentifica';

  @override
  String get profileEditProfilePageAboutMe => 'Sobre mim';

  @override
  String get profileEditProfilePageAboutMeHint => 'Fale um pouco sobre você...';

  @override
  String get profileEditProfilePagePrivacy => 'Privacidade';

  @override
  String get profileEditProfilePageHideFollowers => 'Ocultar seguidores';

  @override
  String get profileEditProfilePageHideLikes => 'Ocultar likes';

  @override
  String get profileMyProfilePageTitle => 'Seu perfil';

  @override
  String get profileMyProfilePageSubtitle =>
      'Aqui fica suas receitas publicadas';

  @override
  String get profileMyProfilePageBack => 'Voltar';

  @override
  String get profileMyProfilePageEditProfile => 'Editar perfil';

  @override
  String get profileMyProfilePageSearchHint => 'Encontre uma receita';

  @override
  String get profileMyProfilePageNoRecipes =>
      'Você ainda não tem receitas publicadas...';

  @override
  String get profileViewProfilePageTitle => 'Explorar Perfil';

  @override
  String get profileViewProfilePageSubtitle =>
      'Descubra as criações culinárias deste usuário';

  @override
  String get profileViewProfilePageBack => 'Voltar';

  @override
  String get profileViewProfilePageNoRecipes =>
      'Esse chefe não tem receitas publicadas...';

  @override
  String get recipeLeaveRecipeSheetDiscardWarning =>
      'Ao descartar, não podemos recuperar o que foi escrito na sua receita.';

  @override
  String get recipeLeaveRecipeSheetContinueWriting => 'Continuar escrevendo';

  @override
  String get recipeLeaveRecipeSheetDiscardRecipe => 'Descartar receita';

  @override
  String get recipeWriteTimePreparedMinutes => 'Minutos';

  @override
  String get recipeWriteTimePreparedHours => 'Horas';

  @override
  String get recipeCarouselSelectImagesRecipeMaxImages =>
      'Só é permitido 10 imagens por receita';

  @override
  String get recipeCreateBackEndSafeButtonPublishPrompt =>
      'Deseja públicar sua receita?';

  @override
  String get recipeCreateBackEndSafeButtonPublishConfirmation =>
      'Verifique bem se tem certeza, assim podemos mostrar ao mundo sua linda receita!';

  @override
  String get recipeCreateBackEndSafeButtonPublish => 'Publicar receita';

  @override
  String get recipeCreateBackEndSafeButtonSaveDraft =>
      'Salvar receita como rascunho';

  @override
  String get recipeCreateBackEndSafeButtonContinueWriting =>
      'Continuar escrevendo';

  @override
  String get recipeCreateBackEndSafeButtonSave => 'Salvar';

  @override
  String get recipeDifficultyTitle => 'Dificuldade';

  @override
  String get recipeDifficultyBack => 'Voltar';

  @override
  String get recipeDifficultyNext => 'Próximo';

  @override
  String get recipePortionSnackBarMessage =>
      'Informe quantas porções sua receita pode servir';

  @override
  String get recipePortionTitle => 'Porções';

  @override
  String get recipePortionQuestion =>
      'Quantas porções sua\nreceita pode servir?';

  @override
  String get recipeTimePreparedTitle => 'Tempo de preparo';

  @override
  String get recipeTimePreparedSnackBarMessage => 'Informe o tempo de preparo';

  @override
  String get recipeSelectIngredientHint => 'Escolha a unidade';

  @override
  String get recipeSelectIngredientRequiredFields => 'Campos obrigatórios';

  @override
  String get recipeSelectIngredientConfirm => 'Confirmar';

  @override
  String get recipeDetailsTitle => 'Detalhes da receita';

  @override
  String get recipeIngredientsTitle => 'Ingredientes';

  @override
  String get recipeInstructionsTitle => 'Instruções de preparo';

  @override
  String get recipeServeFoodTitle => 'Hora de se servir!';

  @override
  String get recipeIntroducePortionSingular => 'porção';

  @override
  String get recipeIntroducePortionPlural => 'porções';

  @override
  String get recipeIntroduceTimePrepared => 'min';

  @override
  String get recipeLoadIngredientsError => 'Erro ao carregar ingredientes';

  @override
  String get recipeNoItemsFound => 'Nenhum ingrediente encontrado';

  @override
  String get recipeAddIngredient => 'Adicionar ingrediente';

  @override
  String get recipeIngredientNotFound => 'Não encontrou seu ingrediente?';

  @override
  String get recipeEnterIngredientBelow => 'Digite ele no campo abaixo';

  @override
  String get recipeEnterIngredientHint => 'Digite o ingrediente';

  @override
  String get recipeConfirm => 'Confirmar';

  @override
  String get recipeSelectQuantity => 'Selecionar quantidade';

  @override
  String get recipeSelectedIngredients => 'Ingredientes selecionados';

  @override
  String get recipeCustomizeBasicInfoTitle => 'Personalize informações básicas';

  @override
  String get recipeCustomizeBasicInfoDescription =>
      'Essas informações vão ajudar a indentificar coisas básicas da sua receita, então seja bem consiso.';

  @override
  String get recipePortions => 'porções';

  @override
  String get recipeBasicInfoDescription =>
      'Essas informações vão ajudar a indentificar coisas básicas da sua receita, então seja bem consiso.';

  @override
  String get recipeAddAtLeastOneIngredient =>
      'Adicione pelo menos um ingrediente';

  @override
  String get recipeAddImage => 'Adicione uma imagem da receita';

  @override
  String get recipeAddCoverImage => 'Adicione uma imagem de capa';

  @override
  String get recipeFillAllFields => 'Preencha todos os campos corretamente';

  @override
  String get recipeDiscardPrompt => 'Deseja descartar sua receita?';

  @override
  String get recipePhotosTitle => 'Fotos da receita';

  @override
  String get recipeCoverTitle => 'Capa da receita';

  @override
  String get recipeTitleHint => 'Titulo da receita';

  @override
  String get recipeTitleValidation =>
      'Escreva um titulo com no mínimo 3 letras';

  @override
  String get recipeSubtitleHint => 'Subtitulo da receita';

  @override
  String get recipeAboutTitle => 'Sobre a receita';

  @override
  String get recipeAboutHint => 'Fale um pouco da sua receita aqui...';

  @override
  String get recipeAboutValidation => 'Escreva um pouco mais sobre a receita';

  @override
  String get recipeWriteAtLeast50Chars =>
      'Escreva no minimo 50 caracteres para avançar.';

  @override
  String get recipeWriteInstructionsPlaceholder =>
      'Escreva as instruções de preparo...';

  @override
  String get recipeSelectIngredientsTitle => 'Selecionar ingredientes';

  @override
  String get recipeSearchIngredientsHint => 'Pesquise seus ingredientes';

  @override
  String get recipeChooseOtherIngredients =>
      'Escolha outros ingredientes abaixo';

  @override
  String get recipeFinish => 'Finalizar';

  @override
  String get recipeServeTimeTitle => 'Hora de se servir!';

  @override
  String get recipeFinalConsideration =>
      'Escreva um consideração final dando alguma dica ou informação útil para quem estiver concluindo ou concluir a receita.';

  @override
  String get recipeServeDetailsPlaceholder =>
      'Escreva em detalhes como servir o prato...';

  @override
  String get recipeIntroduceBy => 'Por';

  @override
  String get recipeIntroduceFavorite => 'Favoritar';

  @override
  String get searchRecipeSearchHint => 'Procure algo para cozinhar';

  @override
  String get searchRecipeClearFilters => 'Limpar filtros';

  @override
  String get searchRecipeSearchResults => 'Resultados da pesquisa';

  @override
  String get searchRecipeApplyFilter => 'Aplicar filtro';

  @override
  String get searchRecipeFilterBy => 'FILTRAR POR';

  @override
  String get searchRecipeOrderBy => 'Ordernar por';

  @override
  String get searchRecipePreparationTime => 'Tempo de preparo';

  @override
  String get searchRecipeIngredients => 'Ingredientes';

  @override
  String get searchRecipePortions => 'Porções';

  @override
  String get searchRecipeFoodPreference => 'Preferência alimentar';

  @override
  String get searchRecipeDifficulty => 'Dificuldade';

  @override
  String get searchRecipeOrderByAsc => 'De A - Z';

  @override
  String get searchRecipeOrderByDesc => 'De Z - A';

  @override
  String get searchRecipeOrderDifficultyEasy => 'Fácil';

  @override
  String get searchRecipeOrderDifficultyMedium => 'Médio';

  @override
  String get searchRecipeOrderDifficultyHard => 'Difícil';

  @override
  String get searchLabel => 'Pesquisa';

  @override
  String get splashLoading => 'Carregando...';

  @override
  String get dialogUnexpectedError => 'Ocorreu um erro inesperado!';

  @override
  String get dialogOk => 'Ok';

  @override
  String get dialogYes => 'Sim';

  @override
  String get dialogNo => 'Não';

  @override
  String get errorPageReload => 'Recarregar';
}
