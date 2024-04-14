import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/auth/domain/entities/user_entity.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthServiceFirebase implements AuthService {
  final _firebaseInstance = FirebaseAuth.instance;

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserEntity> signIn(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseInstance.signInWithEmailAndPassword(
          email: email, password: password);
      final user = UserEntity(
        id: credential.user!.uid,
        email: email,
      );
      Global.token = await credential.user!.getIdToken() ?? '';
      Global.user = user;
      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          throw Exception('No user found for that email.');
        } else if (e.code == 'wrong-password') {
          throw Exception('Wrong password provided for that user.');
        }
      }
      rethrow;
    }
  }

  @override
  Future<UserEntity> signUp(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = UserEntity(
        id: credential.user!.uid,
        email: email,
      );
      Global.token = await credential.user!.getIdToken() ?? '';
      Global.user = user;
      return user;
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'weak-password') {
          throw Exception('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          throw Exception('The account already exists for that email.');
        }
      }
      rethrow;
    }
  }

  @override
  Future<void> forgetPassword({required String email}) async {
    await _firebaseInstance.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> refreshToken() async {
    Global.token = (await _firebaseInstance.currentUser!.getIdToken(true))!;
    Global.user = UserEntity(
      id: _firebaseInstance.currentUser!.uid,
      email: _firebaseInstance.currentUser!.email!,
    );
    if (Global.token.isEmpty) {
      throw Exception('Token is empty');
    }
  }

  @override
  Future<bool> isLogged() async {
    final userLogged = _firebaseInstance.currentUser != null;
    return userLogged;
  }

  @override
  Future<UserEntity> signInGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser == null) {
        throw FirebaseAuthException(
          code: 'ERROR_ABORTED_BY_USER',
          message: 'Sign-in aborted by user',
        );
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? userResult = result.user;

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
    } catch (e) {
      print('Sign in with Google failed: $e');
      rethrow;
    }
  }
}
