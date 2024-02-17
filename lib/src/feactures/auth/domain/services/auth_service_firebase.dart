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
        name: credential.user!.displayName,
      );
      Global.token = await credential.user!.getIdToken() ?? '';
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
        name: credential.user!.displayName,
      );
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
    try {
      await _firebaseInstance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  Future<void> refreshToken() async {
    Global.token = (await _firebaseInstance.currentUser!.getIdToken(true))!;
    print('Token: ${Global.token}');
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
