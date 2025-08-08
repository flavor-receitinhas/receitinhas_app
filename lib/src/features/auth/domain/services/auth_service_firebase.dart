import 'dart:developer';

import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/features/auth/domain/entities/user_entity.dart';
import 'package:app_receitas/src/features/auth/domain/enum/auth_error_message_enum.dart';
import 'package:app_receitas/src/features/auth/domain/services/auth_serivce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceFirebase implements AuthService {
  final _firebaseInstance = FirebaseAuth.instance;
  final _googleSignIn = GoogleSignIn.instance;
  bool _isGoogleSignInInitialized = false;

  @override
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      _handleError(e);
    }
  }

  @override
  Future<UserEntity> signIn({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserEntity(id: credential.user!.uid, email: email);
      Global.token = await credential.user!.getIdToken() ?? '';
      Global.user = user;
      return user;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserEntity(id: credential.user!.uid, email: email);
      Global.token = await credential.user!.getIdToken() ?? '';
      Global.user = user;
      return user;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    try {
      await _firebaseInstance.sendPasswordResetEmail(email: email);
    } catch (e) {
      _handleError(e);
    }
  }

  @override
  Future<void> refreshToken({bool forceRefresh = false}) async {
    try {
      if (_firebaseInstance.currentUser == null) {
        throw Exception('User not logged in');
      }
      Global.token =
          (await _firebaseInstance.currentUser!.getIdToken(forceRefresh))!;
      Global.user = UserEntity(
        id: _firebaseInstance.currentUser!.uid,
        email: _firebaseInstance.currentUser!.email!,
      );

      if (Global.token.isEmpty) {
        throw Exception('Token is empty');
      }
    } catch (e) {
      _handleError(e);
    }
  }

  @override
  Future<bool> isLogged() async {
    try {
      final userLogged = _firebaseInstance.currentUser != null;
      return userLogged;
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  Future<void> _initializeGoogleSignIn() async {
    try {
      await _googleSignIn.initialize();
      _isGoogleSignInInitialized = true;
    } catch (e) {
      print('Failed to initialize Google Sign-In: $e');
    }
  }

  Future<void> _ensureGoogleSignInInitialized() async {
    if (!_isGoogleSignInInitialized) {
      await _initializeGoogleSignIn();
    }
  }

  @override
  Future<UserEntity> signInGoogle() async {
    try {
      await _ensureGoogleSignInInitialized();

      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;

      final authClient = _googleSignIn.authorizationClient;
      final authorization = await authClient.authorizationForScopes(['email']);

      final credential = GoogleAuthProvider.credential(
        accessToken: authorization?.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await FirebaseAuth.instance.signInWithCredential(
        credential,
      );

      final User? userResult = userCredential.user;

      if (userResult == null) {
        throw FirebaseAuthException(
          code: 'ERROR_NO_USER',
          message: 'No user associated with this credential',
        );
      }

      final user = UserEntity(email: userResult.email!, id: userResult.uid);
      Global.token = await userResult.getIdToken() ?? '';
      Global.user = user;
      return user;
    } catch (e, s) {
      log('Error signing in with Google: $e');
      log('Stack trace: $s');
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(dynamic e) {
    if (e is FirebaseAuthException) {
      switch (e.code) {
        case 'user-not-found':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.userNotFound),
          );
        case 'wrong-password':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.wrongPassword),
          );
        case 'weak-password':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.weakPassword),
          );
        case 'email-already-in-use':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.emailAlreadyInUse),
          );
        case 'invalid-email':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.invalidEmail),
          );
        case 'operation-not-allowed':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.operationNotAllowed),
          );
        case 'too-many-requests':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.tooManyRequests),
          );
        case 'user-disabled':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.userDisabled),
          );
        case 'account-exists-with-different-credential':
          throw Exception(
            getErrorMessageFirebase(
              AuthErrorMessageEnum.accountExistsWithDifferentCredential,
            ),
          );
        case 'invalid-credential':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.invalidCredential),
          );
        case 'invalid-verification-code':
          throw Exception(
            getErrorMessageFirebase(
              AuthErrorMessageEnum.invalidVerificationCode,
            ),
          );
        case 'invalid-verification-id':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.invalidVerificationId),
          );
        case 'requires-recent-login':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.requiresRecentLogin),
          );
        case 'provider-already-linked':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.providerAlreadyLinked),
          );
        case 'credential-already-in-use':
          throw Exception(
            getErrorMessageFirebase(
              AuthErrorMessageEnum.credentialAlreadyInUse,
            ),
          );
        case 'network-request-failed':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.networkRequestFailed),
          );
        case 'expired-action-code':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.expiredActionCode),
          );
        case 'invalid-action-code':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.invalidActionCode),
          );
        case 'missing-email':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.missingEmail),
          );
        case 'quota-exceeded':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.quotaExceeded),
          );
        case 'app-not-authorized':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.appNotAuthorized),
          );
        case 'keychain-error':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.keychainError),
          );
        case 'internal-error':
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.internalError),
          );
        default:
          throw Exception(
            getErrorMessageFirebase(AuthErrorMessageEnum.defaultError),
          );
      }
    } else {
      throw Exception(
        getErrorMessageFirebase(AuthErrorMessageEnum.unexpectedError),
      );
    }
  }
}
