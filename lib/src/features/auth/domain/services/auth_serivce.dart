import 'package:app_receitas/src/features/auth/domain/entities/user_entity.dart';

abstract class AuthService {
  Future<UserEntity> signIn({required String email, required String password});
  Future<UserEntity> signUp({required String email, required String password});
  Future<UserEntity> signInGoogle();
  Future<void> forgetPassword({required String email});
  Future<void> logout();
  Future<void> refreshToken({bool forceRefresh = false});
  Future<bool> isLogged();
}
