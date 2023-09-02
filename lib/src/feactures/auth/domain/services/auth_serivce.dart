import 'package:app_receitas/src/feactures/auth/domain/entities/user_entity.dart';

abstract class AuthService {
  Future<UserEntity> singIn({required String email, required String password});
  Future<UserEntity> singUp({required String email, required String password});
  Future<void> logout();
}
