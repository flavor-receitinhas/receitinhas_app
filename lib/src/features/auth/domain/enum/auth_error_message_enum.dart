import 'package:app_receitas/src/core/global/global_variables.dart';

enum AuthErrorMessageEnum {
  userNotFound(
    en:
        'No user found for the provided email. Please check if the email is correct or create a new account.',
    pt:
        'Nenhum usuário encontrado para o e-mail fornecido. Verifique se o e-mail está correto ou crie uma nova conta.',
    es:
        'No se encontró ningún usuario para el correo electrónico proporcionado. Verifique si el correo electrónico es correcto o cree una nueva cuenta.',
  ),
  wrongPassword(
    en:
        'The provided password is incorrect. Please check your password and try again.',
    pt:
        'A senha fornecida está incorreta. Verifique sua senha e tente novamente.',
    es:
        'La contraseña proporcionada es incorrecta. Verifique su contraseña e intente nuevamente.',
  ),
  weakPassword(
    en:
        'The provided password is too weak. Use a stronger password with at least 6 characters, including letters, numbers, and symbols.',
    pt:
        'A senha fornecida é muito fraca. Use uma senha mais forte, com pelo menos 6 caracteres, incluindo letras, números e símbolos.',
    es:
        'La contraseña proporcionada es demasiado débil. Use una contraseña más fuerte, con al menos 6 caracteres, incluidos letras, números y símbolos.',
  ),
  emailAlreadyInUse(
    en:
        'The provided email is already associated with an existing account. Please log in or use another email.',
    pt:
        'O e-mail fornecido já está associado a uma conta existente. Tente fazer login ou use outro e-mail.',
    es:
        'El correo electrónico proporcionado ya está asociado con una cuenta existente. Intente iniciar sesión o use otro correo electrónico.',
  ),
  invalidEmail(
    en:
        'The provided email is invalid. Please check the email format and try again.',
    pt:
        'O e-mail fornecido é inválido. Verifique o formato do e-mail e tente novamente.',
    es:
        'El correo electrónico proporcionado es inválido. Verifique el formato del correo electrónico e intente nuevamente.',
  ),
  operationNotAllowed(
    en:
        'This authentication method (email/password) is not enabled in Firebase. Please check the Firebase Console settings.',
    pt:
        'Este método de autenticação (e-mail/senha) não está habilitado no Firebase. Verifique as configurações do Firebase Console.',
    es:
        'Este método de autenticación (correo electrónico/contraseña) no está habilitado en Firebase. Verifique la configuración de Firebase Console.',
  ),
  tooManyRequests(
    en:
        'Too many unsuccessful login attempts. Access to your account has been temporarily blocked for security reasons. Please try again later.',
    pt:
        'Muitas tentativas de login malsucedidas. O acesso à sua conta foi temporariamente bloqueado por motivos de segurança. Tente novamente mais tarde.',
    es:
        'Demasiados intentos de inicio de sesión fallidos. El acceso a su cuenta ha sido bloqueado temporalmente por razones de seguridad. Inténtelo de nuevo más tarde.',
  ),
  userDisabled(
    en:
        'Your account has been disabled by an administrator. Please contact support for assistance.',
    pt:
        'Sua conta foi desativada por um administrador. Entre em contato com o suporte para obter assistência.',
    es:
        'Su cuenta ha sido desactivada por un administrador. Póngase en contacto con el soporte para obtener asistencia.',
  ),
  accountExistsWithDifferentCredential(
    en:
        'An account already exists with the same email but using a different authentication method (e.g., Google Sign-In). Please log in with the correct method.',
    pt:
        'Já existe uma conta com o mesmo e-mail, mas usando um método de autenticação diferente (por exemplo, Google Sign-In). Tente fazer login com o método correto.',
    es:
        'Ya existe una cuenta con el mismo correo electrónico, pero utilizando un método de autenticación diferente (por ejemplo, Google Sign-In). Intente iniciar sesión con el método correcto.',
  ),
  invalidCredential(
    en:
        'The provided credentials are invalid or malformed. Please check the data and try again.',
    pt:
        'As credenciais fornecidas são inválidas ou malformadas. Verifique os dados e tente novamente.',
    es:
        'Las credenciales proporcionadas son inválidas o están mal formadas. Verifique los datos e intente nuevamente.',
  ),
  invalidVerificationCode(
    en:
        'The provided verification code is invalid. Please check the code and try again.',
    pt:
        'O código de verificação fornecido é inválido. Verifique o código e tente novamente.',
    es:
        'El código de verificación proporcionado es inválido. Verifique el código e intente nuevamente.',
  ),
  invalidVerificationId(
    en:
        'The provided verification ID is invalid. Please request a new verification code.',
    pt:
        'O ID de verificação fornecido é inválido. Solicite um novo código de verificação.',
    es:
        'El ID de verificación proporcionado es inválido. Solicite un nuevo código de verificación.',
  ),
  requiresRecentLogin(
    en:
        'This operation requires you to log in again for security reasons. Please log in and try again.',
    pt:
        'Esta operação requer que você faça login novamente por motivos de segurança. Faça login e tente novamente.',
    es:
        'Esta operación requiere que inicie sesión nuevamente por razones de seguridad. Inicie sesión e intente nuevamente.',
  ),
  providerAlreadyLinked(
    en:
        'This authentication provider (e.g., Google) is already linked to your account. You cannot link the same provider twice.',
    pt:
        'Este provedor de autenticação (por exemplo, Google) já está vinculado à sua conta. Não é possível vincular o mesmo provedor duas vezes.',
    es:
        'Este proveedor de autenticación (por ejemplo, Google) ya está vinculado a su cuenta. No se puede vincular el mismo proveedor dos veces.',
  ),
  credentialAlreadyInUse(
    en:
        'The provided credentials are already associated with another account. Please use different credentials or log in to the existing account.',
    pt:
        'As credenciais fornecidas já estão associadas a outra conta. Use credenciais diferentes ou faça login na conta existente.',
    es:
        'Las credenciales proporcionadas ya están asociadas con otra cuenta. Utilice credenciales diferentes o inicie sesión en la cuenta existente.',
  ),
  networkRequestFailed(
    en:
        'Network connection failed. Please check your internet connection and try again.',
    pt:
        'Falha na conexão de rede. Verifique sua conexão com a internet e tente novamente.',
    es:
        'Fallo en la conexión de red. Verifique su conexión a Internet e intente nuevamente.',
  ),
  expiredActionCode(
    en:
        'The action code (e.g., for password reset) has expired. Please request a new code and try again.',
    pt:
        'O código de ação (por exemplo, para redefinição de senha) expirou. Solicite um novo código e tente novamente.',
    es:
        'El código de acción (por ejemplo, para restablecer la contraseña) ha expirado. Solicite un nuevo código e intente nuevamente.',
  ),
  invalidActionCode(
    en:
        'The provided action code is invalid. Please check the code and try again.',
    pt:
        'O código de ação fornecido é inválido. Verifique o código e tente novamente.',
    es:
        'El código de acción proporcionado es inválido. Verifique el código e intente nuevamente.',
  ),
  missingEmail(
    en:
        'The email was not provided. Please enter a valid email address to continue.',
    pt:
        'O e-mail não foi fornecido. Insira um endereço de e-mail válido para continuar.',
    es:
        'No se proporcionó el correo electrónico. Ingrese una dirección de correo electrónico válida para continuar.',
  ),
  quotaExceeded(
    en:
        'The request quota for Firebase Authentication has been exceeded. Please try again later or contact support.',
    pt:
        'A cota de solicitações para o Firebase Authentication foi excedida. Tente novamente mais tarde ou entre em contato com o suporte.',
    es:
        'Se ha excedido la cuota de solicitudes para Firebase Authentication. Inténtelo de nuevo más tarde o póngase en contacto con el soporte.',
  ),
  appNotAuthorized(
    en:
        'The app is not authorized to use Firebase Authentication with the provided API key. Please check the Firebase Console settings.',
    pt:
        'O aplicativo não está autorizado a usar o Firebase Authentication com a chave de API fornecida. Verifique as configurações do Firebase Console.',
    es:
        'La aplicación no está autorizada para usar Firebase Authentication con la clave API proporcionada. Verifique la configuración de Firebase Console.',
  ),
  keychainError(
    en:
        'Error accessing the keychain on iOS. Please check the app permissions and try again.',
    pt:
        'Erro ao acessar o keychain no iOS. Verifique as permissões do aplicativo e tente novamente.',
    es:
        'Error al acceder al llavero en iOS. Verifique los permisos de la aplicación e intente nuevamente.',
  ),
  internalError(
    en:
        'An internal error occurred in Firebase Authentication. Please try again later or contact support.',
    pt:
        'Ocorreu um erro interno no Firebase Authentication. Tente novamente mais tarde ou entre em contato com o suporte.',
    es:
        'Ocurrió un error interno en Firebase Authentication. Inténtelo de nuevo más tarde o póngase en contacto con el soporte.',
  ),
  defaultError(
    en:
        'An error occurred during authentication. Please check the details and try again.',
    pt:
        'Ocorreu um erro durante a autenticação. Verifique os detalhes e tente novamente.',
    es:
        'Ocurrió un error durante la autenticación. Verifique los detalles e intente nuevamente.',
  ),
  unexpectedError(
    en:
        'An unexpected error occurred during authentication. Please contact support for assistance.',
    pt:
        'Ocorreu um erro inesperado durante a autenticação. Entre em contato com o suporte para obter assistência.',
    es:
        'Se produjo un error inesperado durante la autenticación. Póngase en contacto con el soporte para obtener asistencia.',
  );

  final String en;
  final String pt;
  final String es;

  const AuthErrorMessageEnum({
    required this.en,
    required this.pt,
    required this.es,
  });
}

String getErrorMessageFirebase(AuthErrorMessageEnum error) {
  switch (Global.language) {
    case 'pt':
      return error.pt;
    case 'es':
      return error.es;
    case 'en':
      return error.en;
    default:
      return error.pt;
  }
}
