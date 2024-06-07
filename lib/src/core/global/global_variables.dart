import 'package:app_receitas/src/feactures/auth/domain/entities/user_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

class Global {
  static const String dnsApi = 'https://api.codeventura.com.br';
  static String token = '';
  static UserEntity? user;
  static ProfileEntity? profile;
}
