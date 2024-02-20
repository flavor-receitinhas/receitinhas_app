import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/auth/domain/entities/user_entity.dart';
import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceFirebase implements AuthService {
  final _firebaseInstance = FirebaseAuth.instance;

  @override
  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Future<UserEntity> singIn(
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
  Future<UserEntity> singUp(
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
}
