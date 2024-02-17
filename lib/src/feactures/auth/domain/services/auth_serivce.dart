import 'package:app_receitas/src/feactures/auth/domain/entities/user_entity.dart';

abstract class AuthService {
  Future<UserEntity> singIn({required String email, required String password});
  Future<UserEntity> singUp({required String email, required String password});
  Future<void> forgetPassword({required String email});
  Future<void> logout();
  Future<void> refreshToken();
  Future<bool> isLogged();
}
