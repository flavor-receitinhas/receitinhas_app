import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];

  /// No description provided for @welcomeTitle.
  ///
  /// In pt, this message translates to:
  /// **'Encante-se com nossas\nobras culinárias incríveis!'**
  String get welcomeTitle;

  /// No description provided for @language.
  ///
  /// In pt, this message translates to:
  /// **'Idioma'**
  String get language;

  /// No description provided for @languageChangeSuccess.
  ///
  /// In pt, this message translates to:
  /// **'Idioma alterado com sucesso'**
  String get languageChangeSuccess;

  /// No description provided for @changeLanguage.
  ///
  /// In pt, this message translates to:
  /// **'Mudar idioma'**
  String get changeLanguage;

  /// No description provided for @languageEnglish.
  ///
  /// In pt, this message translates to:
  /// **'Inglês'**
  String get languageEnglish;

  /// No description provided for @languageSpanish.
  ///
  /// In pt, this message translates to:
  /// **'Espanhol'**
  String get languageSpanish;

  /// No description provided for @languagePortuguese.
  ///
  /// In pt, this message translates to:
  /// **'Português'**
  String get languagePortuguese;

  /// No description provided for @welcomeBody.
  ///
  /// In pt, this message translates to:
  /// **'Desperte sua paixão pela culinária e explore um mundo de sabores inesquecíveis com receitas inspiradoras.'**
  String get welcomeBody;

  /// No description provided for @welcomeBottomAppBar.
  ///
  /// In pt, this message translates to:
  /// **'Começar a Cozinhar'**
  String get welcomeBottomAppBar;

  /// No description provided for @chooseAuthTitle.
  ///
  /// In pt, this message translates to:
  /// **'Antes de começar, queremos tirar uma dúvida.'**
  String get chooseAuthTitle;

  /// No description provided for @chooseAuthBody.
  ///
  /// In pt, this message translates to:
  /// **'Você é um novo amante da culinária ou já tem uma conta por aqui?'**
  String get chooseAuthBody;

  /// No description provided for @chooseAuthRegisterButton.
  ///
  /// In pt, this message translates to:
  /// **'Sou novo(a) aqui'**
  String get chooseAuthRegisterButton;

  /// No description provided for @chooseAuthLoginButton.
  ///
  /// In pt, this message translates to:
  /// **'Já tenho uma conta'**
  String get chooseAuthLoginButton;

  /// No description provided for @registerTitle.
  ///
  /// In pt, this message translates to:
  /// **'Nada melhor que se tornar um Mestre da Culinária!'**
  String get registerTitle;

  /// No description provided for @registerEmail.
  ///
  /// In pt, this message translates to:
  /// **'Inserir e-mail'**
  String get registerEmail;

  /// No description provided for @registerPassword.
  ///
  /// In pt, this message translates to:
  /// **'Inserir senha'**
  String get registerPassword;

  /// No description provided for @registerTerms1.
  ///
  /// In pt, this message translates to:
  /// **'Ao criar a conta, você concorda com os '**
  String get registerTerms1;

  /// No description provided for @registerTerms2.
  ///
  /// In pt, this message translates to:
  /// **'Termos de Uso '**
  String get registerTerms2;

  /// No description provided for @registerTerms3.
  ///
  /// In pt, this message translates to:
  /// **'e '**
  String get registerTerms3;

  /// No description provided for @registerTerms4.
  ///
  /// In pt, this message translates to:
  /// **'Política de Privacidade.'**
  String get registerTerms4;

  /// No description provided for @registerButton.
  ///
  /// In pt, this message translates to:
  /// **'Criar conta'**
  String get registerButton;

  /// No description provided for @registerValidatorEmail.
  ///
  /// In pt, this message translates to:
  /// **'Digite um email válido'**
  String get registerValidatorEmail;

  /// No description provided for @registerValidatorPassword1.
  ///
  /// In pt, this message translates to:
  /// **'Senha é obrigatória'**
  String get registerValidatorPassword1;

  /// No description provided for @registerValidatorPassword2.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve conter pelo menos 8 caracteres'**
  String get registerValidatorPassword2;

  /// No description provided for @registerValidatorPassword3.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve conter pelo menos uma letra maiúscula'**
  String get registerValidatorPassword3;

  /// No description provided for @registerValidatorPassword4.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve conter pelo menos uma letra minúscula'**
  String get registerValidatorPassword4;

  /// No description provided for @registerValidatorPassword5.
  ///
  /// In pt, this message translates to:
  /// **'A senha deve conter pelo menos um número'**
  String get registerValidatorPassword5;

  /// No description provided for @loginTitle.
  ///
  /// In pt, this message translates to:
  /// **'Ficamos felizes com seu retorno!'**
  String get loginTitle;

  /// No description provided for @loginBody.
  ///
  /// In pt, this message translates to:
  /// **'Pronto(a) para criar novas receitas?'**
  String get loginBody;

  /// No description provided for @loginEmail.
  ///
  /// In pt, this message translates to:
  /// **'Inserir e-mail'**
  String get loginEmail;

  /// No description provided for @loginPassword.
  ///
  /// In pt, this message translates to:
  /// **'Inserir senha'**
  String get loginPassword;

  /// No description provided for @loginForgetPassword.
  ///
  /// In pt, this message translates to:
  /// **'Esqueceu a senha?'**
  String get loginForgetPassword;

  /// No description provided for @loginButton.
  ///
  /// In pt, this message translates to:
  /// **'Entrar'**
  String get loginButton;

  /// No description provided for @forgetPasswordTitle.
  ///
  /// In pt, this message translates to:
  /// **'Esqueceu sua senha?'**
  String get forgetPasswordTitle;

  /// No description provided for @forgetPasswordBody.
  ///
  /// In pt, this message translates to:
  /// **'Sem problemas!'**
  String get forgetPasswordBody;

  /// No description provided for @forgetPasswordHintFild.
  ///
  /// In pt, this message translates to:
  /// **'Inserir e-mail'**
  String get forgetPasswordHintFild;

  /// No description provided for @forgetPasswordButton.
  ///
  /// In pt, this message translates to:
  /// **'Enviar link de recuperação'**
  String get forgetPasswordButton;

  /// No description provided for @forgetPasswordValidatorEmail.
  ///
  /// In pt, this message translates to:
  /// **'Digite um email válido'**
  String get forgetPasswordValidatorEmail;

  /// No description provided for @forgetPasswordTextSnack.
  ///
  /// In pt, this message translates to:
  /// **'Enviado para o seu email'**
  String get forgetPasswordTextSnack;

  /// No description provided for @forgetPasswordOptionSnack.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get forgetPasswordOptionSnack;

  /// No description provided for @proteinPreferenceTitle.
  ///
  /// In pt, this message translates to:
  /// **'Tem alguma Preferência de Proteína?'**
  String get proteinPreferenceTitle;

  /// No description provided for @proteinPreferenceOptions.
  ///
  /// In pt, this message translates to:
  /// **'{choice, select, vegetarian{Vegetariano} vegan{Vegano} meat{Carne} fish{Peixe} other{Erro}}'**
  String proteinPreferenceOptions(String choice);

  /// No description provided for @proteinPreferenceConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Próxima etapa'**
  String get proteinPreferenceConfirm;

  /// No description provided for @proteinPreferenceSnackBar.
  ///
  /// In pt, this message translates to:
  /// **'Selecione uma opção'**
  String get proteinPreferenceSnackBar;

  /// No description provided for @dietaryRestrictionTitle.
  ///
  /// In pt, this message translates to:
  /// **'Possui alguma Restrição Alimentar?'**
  String get dietaryRestrictionTitle;

  /// No description provided for @dietaryRestrictionOptions.
  ///
  /// In pt, this message translates to:
  /// **'{choice, select, gluten{Glúten} lactose{Lactose} noRestriction{Nenhuma restrição} other{Erro}}'**
  String dietaryRestrictionOptions(String choice);

  /// No description provided for @dietaryRestrictionConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Próxima etapa'**
  String get dietaryRestrictionConfirm;

  /// No description provided for @dietaryRestrictionSnackBar.
  ///
  /// In pt, this message translates to:
  /// **'Selecione uma opção'**
  String get dietaryRestrictionSnackBar;

  /// No description provided for @difficultyRecipesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Nivel de dificuldade desejado:'**
  String get difficultyRecipesTitle;

  /// No description provided for @difficultyRecipesOptions.
  ///
  /// In pt, this message translates to:
  /// **'{choice, select, easy{Fácil e rápido} medium{Moderado, ou casual} hard{Desafiador, um pesadelo} other{Erro}}'**
  String difficultyRecipesOptions(String choice);

  /// No description provided for @difficultyRecipesConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Próxima etapa'**
  String get difficultyRecipesConfirm;

  /// No description provided for @difficultyRecipesSnackBar.
  ///
  /// In pt, this message translates to:
  /// **'Selecione uma opção'**
  String get difficultyRecipesSnackBar;

  /// No description provided for @chooseNameTitle.
  ///
  /// In pt, this message translates to:
  /// **'Um chefe deve ter um nome memóravel!'**
  String get chooseNameTitle;

  /// No description provided for @chooseNameBody.
  ///
  /// In pt, this message translates to:
  /// **'Como podemos te chamar ?'**
  String get chooseNameBody;

  /// No description provided for @chooseNameHintText.
  ///
  /// In pt, this message translates to:
  /// **'Escreva seu nome...'**
  String get chooseNameHintText;

  /// No description provided for @chooseNameConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Próxima etapa'**
  String get chooseNameConfirm;

  /// No description provided for @configSettings.
  ///
  /// In pt, this message translates to:
  /// **'Configurações'**
  String get configSettings;

  /// No description provided for @configCustomizePreference.
  ///
  /// In pt, this message translates to:
  /// **'Personalize conforme sua preferência'**
  String get configCustomizePreference;

  /// No description provided for @configLogoutPrompt.
  ///
  /// In pt, this message translates to:
  /// **'Deseja realmente sair da sua conta?'**
  String get configLogoutPrompt;

  /// No description provided for @configLogoutReminder.
  ///
  /// In pt, this message translates to:
  /// **'Lembrando que ao sair da sua conta, poderá acessar ela novamente usando suas credenciais.'**
  String get configLogoutReminder;

  /// No description provided for @configDontLogout.
  ///
  /// In pt, this message translates to:
  /// **'Não desejo sair da conta'**
  String get configDontLogout;

  /// No description provided for @configLogout.
  ///
  /// In pt, this message translates to:
  /// **'Sair da conta'**
  String get configLogout;

  /// No description provided for @configAboutOurTeam.
  ///
  /// In pt, this message translates to:
  /// **'Nossa equipe'**
  String get configAboutOurTeam;

  /// No description provided for @configAboutTeamDescription.
  ///
  /// In pt, this message translates to:
  /// **'Nossa Equipe\n\nBem-vindo à equipe dedicada por trás do Flavor. Estamos entusiasmados em apresentar as mentes criativas que trabalham incansavelmente para tornar a sua experiência ainda melhor.\n\nEstamos comprometidos em criar um aplicativo que atenda às suas necessidades e expectativas. Agradecemos por fazer parte da nossa jornada e esperamos continuar aprimorando e inovando para oferecer a você a melhor experiência possível.'**
  String get configAboutTeamDescription;

  /// No description provided for @configChangePassword.
  ///
  /// In pt, this message translates to:
  /// **'Alterar senha'**
  String get configChangePassword;

  /// No description provided for @configOldPassword.
  ///
  /// In pt, this message translates to:
  /// **'Senha antiga'**
  String get configOldPassword;

  /// No description provided for @configOldPasswordHint.
  ///
  /// In pt, this message translates to:
  /// **'Escreva sua senha antiga'**
  String get configOldPasswordHint;

  /// No description provided for @configNewPassword.
  ///
  /// In pt, this message translates to:
  /// **'Nova senha'**
  String get configNewPassword;

  /// No description provided for @configNewPasswordHint.
  ///
  /// In pt, this message translates to:
  /// **'Digite sua nova senha'**
  String get configNewPasswordHint;

  /// No description provided for @configConfirmNewPassword.
  ///
  /// In pt, this message translates to:
  /// **'Confirme a nova senha'**
  String get configConfirmNewPassword;

  /// No description provided for @configConfirmNewPasswordHint.
  ///
  /// In pt, this message translates to:
  /// **'Confirme sua nova senha'**
  String get configConfirmNewPasswordHint;

  /// No description provided for @configPasswordChangeNotification.
  ///
  /// In pt, this message translates to:
  /// **'Você será notificado na sua caixa de emails\nsobre a mudança de senha.'**
  String get configPasswordChangeNotification;

  /// No description provided for @configAccount.
  ///
  /// In pt, this message translates to:
  /// **'Conta'**
  String get configAccount;

  /// No description provided for @configEditAccount.
  ///
  /// In pt, this message translates to:
  /// **'Editar Preferências'**
  String get configEditAccount;

  /// No description provided for @configCustomization.
  ///
  /// In pt, this message translates to:
  /// **'Personalização'**
  String get configCustomization;

  /// No description provided for @configNightMode.
  ///
  /// In pt, this message translates to:
  /// **'Modo noturno'**
  String get configNightMode;

  /// No description provided for @configPrivacyPolicy.
  ///
  /// In pt, this message translates to:
  /// **'Políticas de privacidade'**
  String get configPrivacyPolicy;

  /// No description provided for @configTermsConditions.
  ///
  /// In pt, this message translates to:
  /// **'Termos e condições'**
  String get configTermsConditions;

  /// No description provided for @configOurTeam.
  ///
  /// In pt, this message translates to:
  /// **'Nossa equipe'**
  String get configOurTeam;

  /// No description provided for @configAppVersion.
  ///
  /// In pt, this message translates to:
  /// **'Versão do Aplicativo'**
  String get configAppVersion;

  /// No description provided for @configName.
  ///
  /// In pt, this message translates to:
  /// **'Nome'**
  String get configName;

  /// No description provided for @configNameHint.
  ///
  /// In pt, this message translates to:
  /// **'Escreva seu nome...'**
  String get configNameHint;

  /// No description provided for @configFoodPreference.
  ///
  /// In pt, this message translates to:
  /// **'Preferência alimentar'**
  String get configFoodPreference;

  /// No description provided for @configDietaryRestriction.
  ///
  /// In pt, this message translates to:
  /// **'Restrição alimentar'**
  String get configDietaryRestriction;

  /// No description provided for @favoriteOrganizeRecipesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Organizar por'**
  String get favoriteOrganizeRecipesTitle;

  /// No description provided for @favoriteOrganizeRecipesRecentFirst.
  ///
  /// In pt, this message translates to:
  /// **'Mais recente primeiro'**
  String get favoriteOrganizeRecipesRecentFirst;

  /// No description provided for @favoriteOrganizeRecipesOldestFirst.
  ///
  /// In pt, this message translates to:
  /// **'Mais antigo primeiro'**
  String get favoriteOrganizeRecipesOldestFirst;

  /// No description provided for @favoriteOrganizeRecipesNameAsc.
  ///
  /// In pt, this message translates to:
  /// **'Nome de A a Z'**
  String get favoriteOrganizeRecipesNameAsc;

  /// No description provided for @favoriteOrganizeRecipesNameDesc.
  ///
  /// In pt, this message translates to:
  /// **'Nome de Z a A'**
  String get favoriteOrganizeRecipesNameDesc;

  /// No description provided for @favoritePageTitle.
  ///
  /// In pt, this message translates to:
  /// **'Lista de Favoritos'**
  String get favoritePageTitle;

  /// No description provided for @favoritePageSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Gerencie suas receitas favoritas'**
  String get favoritePageSubtitle;

  /// No description provided for @favoritePageSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquise sua receita favorita'**
  String get favoritePageSearchHint;

  /// No description provided for @favoritePageErrorLoading.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar receitas'**
  String get favoritePageErrorLoading;

  /// No description provided for @favoritePageNoItemsFound.
  ///
  /// In pt, this message translates to:
  /// **'Nenhuma receita encontrada'**
  String get favoritePageNoItemsFound;

  /// No description provided for @favoriteRemoveFavoritesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Remover dos favoritos'**
  String get favoriteRemoveFavoritesTitle;

  /// No description provided for @favoriteRemoveFavoritesContent.
  ///
  /// In pt, this message translates to:
  /// **'Deseja realmente remover essa receita dos favoritos?'**
  String get favoriteRemoveFavoritesContent;

  /// No description provided for @customBottomBarExitAppTitle.
  ///
  /// In pt, this message translates to:
  /// **'Deseja sair do app?'**
  String get customBottomBarExitAppTitle;

  /// No description provided for @customBottomBarCancel.
  ///
  /// In pt, this message translates to:
  /// **'Cancelar'**
  String get customBottomBarCancel;

  /// No description provided for @customBottomBarExit.
  ///
  /// In pt, this message translates to:
  /// **'Sair'**
  String get customBottomBarExit;

  /// No description provided for @homePageGreeting.
  ///
  /// In pt, this message translates to:
  /// **'Olá'**
  String get homePageGreeting;

  /// No description provided for @homePageSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'O que vamos cozinhar hoje?'**
  String get homePageSubtitle;

  /// No description provided for @homePageSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Procure algo para cozinhar'**
  String get homePageSearchHint;

  /// No description provided for @homePageLatestRecipesTitle.
  ///
  /// In pt, this message translates to:
  /// **'Últimas receitas postadas'**
  String get homePageLatestRecipesTitle;

  /// No description provided for @profileBackSheetConfirmExit.
  ///
  /// In pt, this message translates to:
  /// **'Você tem certeza que deseja sair sem salvar as alterações?'**
  String get profileBackSheetConfirmExit;

  /// No description provided for @profileBackSheetExitWithoutSaving.
  ///
  /// In pt, this message translates to:
  /// **'Sair sem salvar'**
  String get profileBackSheetExitWithoutSaving;

  /// No description provided for @profileBackSheetContinueEditing.
  ///
  /// In pt, this message translates to:
  /// **'Continuar editando'**
  String get profileBackSheetContinueEditing;

  /// No description provided for @profileSaveSheetConfirmMessage.
  ///
  /// In pt, this message translates to:
  /// **'Verifique bem se tem certeza, assim podemos mostrar ao mundo o seu novo perfil!'**
  String get profileSaveSheetConfirmMessage;

  /// No description provided for @profileSaveSheetSaveChanges.
  ///
  /// In pt, this message translates to:
  /// **'Salvar alterações'**
  String get profileSaveSheetSaveChanges;

  /// No description provided for @profileSaveSheetContinueEditing.
  ///
  /// In pt, this message translates to:
  /// **'Continuar editando'**
  String get profileSaveSheetContinueEditing;

  /// No description provided for @profileEditProfilePageSaveChanges.
  ///
  /// In pt, this message translates to:
  /// **'Deseja salvar as alterações?'**
  String get profileEditProfilePageSaveChanges;

  /// No description provided for @profileEditProfilePageTitle.
  ///
  /// In pt, this message translates to:
  /// **'Seu perfil'**
  String get profileEditProfilePageTitle;

  /// No description provided for @profileEditProfilePageSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Aqui fica suas receitas publicadas'**
  String get profileEditProfilePageSubtitle;

  /// No description provided for @profileEditProfilePageBack.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get profileEditProfilePageBack;

  /// No description provided for @profileEditProfilePageConfirmExit.
  ///
  /// In pt, this message translates to:
  /// **'Você deseja descartar as alterações?'**
  String get profileEditProfilePageConfirmExit;

  /// No description provided for @profileEditProfilePageChangeProfilePicture.
  ///
  /// In pt, this message translates to:
  /// **'Alterar avatar'**
  String get profileEditProfilePageChangeProfilePicture;

  /// No description provided for @profileEditProfilePageRemoveProfilePicture.
  ///
  /// In pt, this message translates to:
  /// **'Remover Imagem'**
  String get profileEditProfilePageRemoveProfilePicture;

  /// No description provided for @profileEditProfilePageImageRequirement.
  ///
  /// In pt, this message translates to:
  /// **'A imagem tem que ter no minimo 256x256px'**
  String get profileEditProfilePageImageRequirement;

  /// No description provided for @profileEditProfilePageTitleLabel.
  ///
  /// In pt, this message translates to:
  /// **'Título'**
  String get profileEditProfilePageTitleLabel;

  /// No description provided for @profileEditProfilePageTitleHint.
  ///
  /// In pt, this message translates to:
  /// **'Selecione um título'**
  String get profileEditProfilePageTitleHint;

  /// No description provided for @profileEditProfilePageTitleDescription.
  ///
  /// In pt, this message translates to:
  /// **'Selecione um título na qual você mais se indentifica'**
  String get profileEditProfilePageTitleDescription;

  /// No description provided for @profileEditProfilePageAboutMe.
  ///
  /// In pt, this message translates to:
  /// **'Sobre mim'**
  String get profileEditProfilePageAboutMe;

  /// No description provided for @profileEditProfilePageAboutMeHint.
  ///
  /// In pt, this message translates to:
  /// **'Fale um pouco sobre você...'**
  String get profileEditProfilePageAboutMeHint;

  /// No description provided for @profileEditProfilePagePrivacy.
  ///
  /// In pt, this message translates to:
  /// **'Privacidade'**
  String get profileEditProfilePagePrivacy;

  /// No description provided for @profileEditProfilePageHideFollowers.
  ///
  /// In pt, this message translates to:
  /// **'Ocultar seguidores'**
  String get profileEditProfilePageHideFollowers;

  /// No description provided for @profileEditProfilePageHideLikes.
  ///
  /// In pt, this message translates to:
  /// **'Ocultar likes'**
  String get profileEditProfilePageHideLikes;

  /// No description provided for @profileMyProfilePageTitle.
  ///
  /// In pt, this message translates to:
  /// **'Seu perfil'**
  String get profileMyProfilePageTitle;

  /// No description provided for @profileMyProfilePageSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Aqui fica suas receitas publicadas'**
  String get profileMyProfilePageSubtitle;

  /// No description provided for @profileMyProfilePageBack.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get profileMyProfilePageBack;

  /// No description provided for @profileMyProfilePageEditProfile.
  ///
  /// In pt, this message translates to:
  /// **'Editar perfil'**
  String get profileMyProfilePageEditProfile;

  /// No description provided for @profileMyProfilePageSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Encontre uma receita'**
  String get profileMyProfilePageSearchHint;

  /// No description provided for @profileMyProfilePageNoRecipes.
  ///
  /// In pt, this message translates to:
  /// **'Você ainda não tem receitas publicadas...'**
  String get profileMyProfilePageNoRecipes;

  /// No description provided for @profileViewProfilePageTitle.
  ///
  /// In pt, this message translates to:
  /// **'Explorar Perfil'**
  String get profileViewProfilePageTitle;

  /// No description provided for @profileViewProfilePageSubtitle.
  ///
  /// In pt, this message translates to:
  /// **'Descubra as criações culinárias deste usuário'**
  String get profileViewProfilePageSubtitle;

  /// No description provided for @profileViewProfilePageBack.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get profileViewProfilePageBack;

  /// No description provided for @profileViewProfilePageNoRecipes.
  ///
  /// In pt, this message translates to:
  /// **'Esse chefe não tem receitas publicadas...'**
  String get profileViewProfilePageNoRecipes;

  /// No description provided for @recipeLeaveRecipeSheetDiscardWarning.
  ///
  /// In pt, this message translates to:
  /// **'Ao descartar, não podemos recuperar o que foi escrito na sua receita.'**
  String get recipeLeaveRecipeSheetDiscardWarning;

  /// No description provided for @recipeLeaveRecipeSheetContinueWriting.
  ///
  /// In pt, this message translates to:
  /// **'Continuar escrevendo'**
  String get recipeLeaveRecipeSheetContinueWriting;

  /// No description provided for @recipeLeaveRecipeSheetDiscardRecipe.
  ///
  /// In pt, this message translates to:
  /// **'Descartar receita'**
  String get recipeLeaveRecipeSheetDiscardRecipe;

  /// No description provided for @recipeWriteTimePreparedMinutes.
  ///
  /// In pt, this message translates to:
  /// **'Minutos'**
  String get recipeWriteTimePreparedMinutes;

  /// No description provided for @recipeWriteTimePreparedHours.
  ///
  /// In pt, this message translates to:
  /// **'Horas'**
  String get recipeWriteTimePreparedHours;

  /// No description provided for @recipeCarouselSelectImagesRecipeMaxImages.
  ///
  /// In pt, this message translates to:
  /// **'Só é permitido 10 imagens por receita'**
  String get recipeCarouselSelectImagesRecipeMaxImages;

  /// No description provided for @recipeCreateBackEndSafeButtonPublishPrompt.
  ///
  /// In pt, this message translates to:
  /// **'Deseja públicar sua receita?'**
  String get recipeCreateBackEndSafeButtonPublishPrompt;

  /// No description provided for @recipeCreateBackEndSafeButtonPublishConfirmation.
  ///
  /// In pt, this message translates to:
  /// **'Verifique bem se tem certeza, assim podemos mostrar ao mundo sua linda receita!'**
  String get recipeCreateBackEndSafeButtonPublishConfirmation;

  /// No description provided for @recipeCreateBackEndSafeButtonPublish.
  ///
  /// In pt, this message translates to:
  /// **'Publicar receita'**
  String get recipeCreateBackEndSafeButtonPublish;

  /// No description provided for @recipeCreateBackEndSafeButtonSaveDraft.
  ///
  /// In pt, this message translates to:
  /// **'Salvar receita como rascunho'**
  String get recipeCreateBackEndSafeButtonSaveDraft;

  /// No description provided for @recipeCreateBackEndSafeButtonContinueWriting.
  ///
  /// In pt, this message translates to:
  /// **'Continuar escrevendo'**
  String get recipeCreateBackEndSafeButtonContinueWriting;

  /// No description provided for @recipeCreateBackEndSafeButtonSave.
  ///
  /// In pt, this message translates to:
  /// **'Salvar'**
  String get recipeCreateBackEndSafeButtonSave;

  /// No description provided for @recipeDifficultyTitle.
  ///
  /// In pt, this message translates to:
  /// **'Dificuldade'**
  String get recipeDifficultyTitle;

  /// No description provided for @recipeDifficultyBack.
  ///
  /// In pt, this message translates to:
  /// **'Voltar'**
  String get recipeDifficultyBack;

  /// No description provided for @recipeDifficultyNext.
  ///
  /// In pt, this message translates to:
  /// **'Próximo'**
  String get recipeDifficultyNext;

  /// No description provided for @recipePortionSnackBarMessage.
  ///
  /// In pt, this message translates to:
  /// **'Informe quantas porções sua receita pode servir'**
  String get recipePortionSnackBarMessage;

  /// No description provided for @recipePortionTitle.
  ///
  /// In pt, this message translates to:
  /// **'Porções'**
  String get recipePortionTitle;

  /// No description provided for @recipePortionQuestion.
  ///
  /// In pt, this message translates to:
  /// **'Quantas porções sua\nreceita pode servir?'**
  String get recipePortionQuestion;

  /// No description provided for @recipeTimePreparedTitle.
  ///
  /// In pt, this message translates to:
  /// **'Tempo de preparo'**
  String get recipeTimePreparedTitle;

  /// No description provided for @recipeTimePreparedSnackBarMessage.
  ///
  /// In pt, this message translates to:
  /// **'Informe o tempo de preparo'**
  String get recipeTimePreparedSnackBarMessage;

  /// No description provided for @recipeSelectIngredientHint.
  ///
  /// In pt, this message translates to:
  /// **'Escolha a unidade'**
  String get recipeSelectIngredientHint;

  /// No description provided for @recipeSelectIngredientRequiredFields.
  ///
  /// In pt, this message translates to:
  /// **'Campos obrigatórios'**
  String get recipeSelectIngredientRequiredFields;

  /// No description provided for @recipeSelectIngredientConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar'**
  String get recipeSelectIngredientConfirm;

  /// No description provided for @recipeDetailsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Detalhes da receita'**
  String get recipeDetailsTitle;

  /// No description provided for @recipeIngredientsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Ingredientes'**
  String get recipeIngredientsTitle;

  /// No description provided for @recipeInstructionsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Instruções de preparo'**
  String get recipeInstructionsTitle;

  /// No description provided for @recipeServeFoodTitle.
  ///
  /// In pt, this message translates to:
  /// **'Hora de se servir!'**
  String get recipeServeFoodTitle;

  /// No description provided for @recipeIntroducePortionSingular.
  ///
  /// In pt, this message translates to:
  /// **'porção'**
  String get recipeIntroducePortionSingular;

  /// No description provided for @recipeIntroducePortionPlural.
  ///
  /// In pt, this message translates to:
  /// **'porções'**
  String get recipeIntroducePortionPlural;

  /// No description provided for @recipeIntroduceTimePrepared.
  ///
  /// In pt, this message translates to:
  /// **'min'**
  String get recipeIntroduceTimePrepared;

  /// No description provided for @recipeLoadIngredientsError.
  ///
  /// In pt, this message translates to:
  /// **'Erro ao carregar ingredientes'**
  String get recipeLoadIngredientsError;

  /// No description provided for @recipeNoItemsFound.
  ///
  /// In pt, this message translates to:
  /// **'Nenhum ingrediente encontrado'**
  String get recipeNoItemsFound;

  /// No description provided for @recipeAddIngredient.
  ///
  /// In pt, this message translates to:
  /// **'Adicionar ingrediente'**
  String get recipeAddIngredient;

  /// No description provided for @recipeIngredientNotFound.
  ///
  /// In pt, this message translates to:
  /// **'Não encontrou seu ingrediente?'**
  String get recipeIngredientNotFound;

  /// No description provided for @recipeEnterIngredientBelow.
  ///
  /// In pt, this message translates to:
  /// **'Digite ele no campo abaixo'**
  String get recipeEnterIngredientBelow;

  /// No description provided for @recipeEnterIngredientHint.
  ///
  /// In pt, this message translates to:
  /// **'Digite o ingrediente'**
  String get recipeEnterIngredientHint;

  /// No description provided for @recipeConfirm.
  ///
  /// In pt, this message translates to:
  /// **'Confirmar'**
  String get recipeConfirm;

  /// No description provided for @recipeSelectQuantity.
  ///
  /// In pt, this message translates to:
  /// **'Selecionar quantidade'**
  String get recipeSelectQuantity;

  /// No description provided for @recipeSelectedIngredients.
  ///
  /// In pt, this message translates to:
  /// **'Ingredientes selecionados'**
  String get recipeSelectedIngredients;

  /// No description provided for @recipeCustomizeBasicInfoTitle.
  ///
  /// In pt, this message translates to:
  /// **'Personalize informações básicas'**
  String get recipeCustomizeBasicInfoTitle;

  /// No description provided for @recipeCustomizeBasicInfoDescription.
  ///
  /// In pt, this message translates to:
  /// **'Essas informações vão ajudar a indentificar coisas básicas da sua receita, então seja bem consiso.'**
  String get recipeCustomizeBasicInfoDescription;

  /// No description provided for @recipePortions.
  ///
  /// In pt, this message translates to:
  /// **'porções'**
  String get recipePortions;

  /// No description provided for @recipeBasicInfoDescription.
  ///
  /// In pt, this message translates to:
  /// **'Essas informações vão ajudar a indentificar coisas básicas da sua receita, então seja bem consiso.'**
  String get recipeBasicInfoDescription;

  /// No description provided for @recipeAddAtLeastOneIngredient.
  ///
  /// In pt, this message translates to:
  /// **'Adicione pelo menos um ingrediente'**
  String get recipeAddAtLeastOneIngredient;

  /// No description provided for @recipeAddImage.
  ///
  /// In pt, this message translates to:
  /// **'Adicione uma imagem da receita'**
  String get recipeAddImage;

  /// No description provided for @recipeAddCoverImage.
  ///
  /// In pt, this message translates to:
  /// **'Adicione uma imagem de capa'**
  String get recipeAddCoverImage;

  /// No description provided for @recipeFillAllFields.
  ///
  /// In pt, this message translates to:
  /// **'Preencha todos os campos corretamente'**
  String get recipeFillAllFields;

  /// No description provided for @recipeDiscardPrompt.
  ///
  /// In pt, this message translates to:
  /// **'Deseja descartar sua receita?'**
  String get recipeDiscardPrompt;

  /// No description provided for @recipePhotosTitle.
  ///
  /// In pt, this message translates to:
  /// **'Fotos da receita'**
  String get recipePhotosTitle;

  /// No description provided for @recipeCoverTitle.
  ///
  /// In pt, this message translates to:
  /// **'Capa da receita'**
  String get recipeCoverTitle;

  /// No description provided for @recipeTitleHint.
  ///
  /// In pt, this message translates to:
  /// **'Titulo da receita'**
  String get recipeTitleHint;

  /// No description provided for @recipeTitleValidation.
  ///
  /// In pt, this message translates to:
  /// **'Escreva um titulo com no mínimo 3 letras'**
  String get recipeTitleValidation;

  /// No description provided for @recipeSubtitleHint.
  ///
  /// In pt, this message translates to:
  /// **'Subtitulo da receita'**
  String get recipeSubtitleHint;

  /// No description provided for @recipeAboutTitle.
  ///
  /// In pt, this message translates to:
  /// **'Sobre a receita'**
  String get recipeAboutTitle;

  /// No description provided for @recipeAboutHint.
  ///
  /// In pt, this message translates to:
  /// **'Fale um pouco da sua receita aqui...'**
  String get recipeAboutHint;

  /// No description provided for @recipeAboutValidation.
  ///
  /// In pt, this message translates to:
  /// **'Escreva um pouco mais sobre a receita'**
  String get recipeAboutValidation;

  /// No description provided for @recipeWriteAtLeast50Chars.
  ///
  /// In pt, this message translates to:
  /// **'Escreva no minimo 50 caracteres para avançar.'**
  String get recipeWriteAtLeast50Chars;

  /// No description provided for @recipeWriteInstructionsPlaceholder.
  ///
  /// In pt, this message translates to:
  /// **'Escreva as instruções de preparo...'**
  String get recipeWriteInstructionsPlaceholder;

  /// No description provided for @recipeSelectIngredientsTitle.
  ///
  /// In pt, this message translates to:
  /// **'Selecionar ingredientes'**
  String get recipeSelectIngredientsTitle;

  /// No description provided for @recipeSearchIngredientsHint.
  ///
  /// In pt, this message translates to:
  /// **'Pesquise seus ingredientes'**
  String get recipeSearchIngredientsHint;

  /// No description provided for @recipeChooseOtherIngredients.
  ///
  /// In pt, this message translates to:
  /// **'Escolha outros ingredientes abaixo'**
  String get recipeChooseOtherIngredients;

  /// No description provided for @recipeFinish.
  ///
  /// In pt, this message translates to:
  /// **'Finalizar'**
  String get recipeFinish;

  /// No description provided for @recipeServeTimeTitle.
  ///
  /// In pt, this message translates to:
  /// **'Hora de se servir!'**
  String get recipeServeTimeTitle;

  /// No description provided for @recipeFinalConsideration.
  ///
  /// In pt, this message translates to:
  /// **'Escreva um consideração final dando alguma dica ou informação útil para quem estiver concluindo ou concluir a receita.'**
  String get recipeFinalConsideration;

  /// No description provided for @recipeServeDetailsPlaceholder.
  ///
  /// In pt, this message translates to:
  /// **'Escreva em detalhes como servir o prato...'**
  String get recipeServeDetailsPlaceholder;

  /// No description provided for @recipeIntroduceBy.
  ///
  /// In pt, this message translates to:
  /// **'Por'**
  String get recipeIntroduceBy;

  /// No description provided for @searchRecipeSearchHint.
  ///
  /// In pt, this message translates to:
  /// **'Procure algo para cozinhar'**
  String get searchRecipeSearchHint;

  /// No description provided for @searchRecipeClearFilters.
  ///
  /// In pt, this message translates to:
  /// **'Limpar filtros'**
  String get searchRecipeClearFilters;

  /// No description provided for @searchRecipeSearchResults.
  ///
  /// In pt, this message translates to:
  /// **'Resultados da pesquisa'**
  String get searchRecipeSearchResults;

  /// No description provided for @searchRecipeApplyFilter.
  ///
  /// In pt, this message translates to:
  /// **'Aplicar filtro'**
  String get searchRecipeApplyFilter;

  /// No description provided for @searchRecipeFilterBy.
  ///
  /// In pt, this message translates to:
  /// **'FILTRAR POR'**
  String get searchRecipeFilterBy;

  /// No description provided for @searchRecipeOrderBy.
  ///
  /// In pt, this message translates to:
  /// **'Ordernar por'**
  String get searchRecipeOrderBy;

  /// No description provided for @searchRecipePreparationTime.
  ///
  /// In pt, this message translates to:
  /// **'Tempo de preparo'**
  String get searchRecipePreparationTime;

  /// No description provided for @searchRecipeIngredients.
  ///
  /// In pt, this message translates to:
  /// **'Ingredientes'**
  String get searchRecipeIngredients;

  /// No description provided for @searchRecipePortions.
  ///
  /// In pt, this message translates to:
  /// **'Porções'**
  String get searchRecipePortions;

  /// No description provided for @searchRecipeFoodPreference.
  ///
  /// In pt, this message translates to:
  /// **'Preferência alimentar'**
  String get searchRecipeFoodPreference;

  /// No description provided for @searchRecipeDifficulty.
  ///
  /// In pt, this message translates to:
  /// **'Dificuldade'**
  String get searchRecipeDifficulty;

  /// No description provided for @searchRecipeOrderByAsc.
  ///
  /// In pt, this message translates to:
  /// **'De A - Z'**
  String get searchRecipeOrderByAsc;

  /// No description provided for @searchRecipeOrderByDesc.
  ///
  /// In pt, this message translates to:
  /// **'De Z - A'**
  String get searchRecipeOrderByDesc;

  /// No description provided for @searchRecipeOrderDifficultyEasy.
  ///
  /// In pt, this message translates to:
  /// **'Fácil'**
  String get searchRecipeOrderDifficultyEasy;

  /// No description provided for @searchRecipeOrderDifficultyMedium.
  ///
  /// In pt, this message translates to:
  /// **'Médio'**
  String get searchRecipeOrderDifficultyMedium;

  /// No description provided for @searchRecipeOrderDifficultyHard.
  ///
  /// In pt, this message translates to:
  /// **'Difícil'**
  String get searchRecipeOrderDifficultyHard;

  /// No description provided for @searchLabel.
  ///
  /// In pt, this message translates to:
  /// **'Pesquisa'**
  String get searchLabel;

  /// No description provided for @splashLoading.
  ///
  /// In pt, this message translates to:
  /// **'Carregando...'**
  String get splashLoading;

  /// No description provided for @dialogUnexpectedError.
  ///
  /// In pt, this message translates to:
  /// **'Ocorreu um erro inesperado!'**
  String get dialogUnexpectedError;

  /// No description provided for @dialogOk.
  ///
  /// In pt, this message translates to:
  /// **'Ok'**
  String get dialogOk;

  /// No description provided for @dialogYes.
  ///
  /// In pt, this message translates to:
  /// **'Sim'**
  String get dialogYes;

  /// No description provided for @dialogNo.
  ///
  /// In pt, this message translates to:
  /// **'Não'**
  String get dialogNo;

  /// No description provided for @errorPageReload.
  ///
  /// In pt, this message translates to:
  /// **'Recarregar'**
  String get errorPageReload;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'pt':
      return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
