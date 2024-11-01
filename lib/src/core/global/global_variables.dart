import 'package:app_receitas/src/feactures/auth/domain/entities/user_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:get_it/get_it.dart';

GetIt di = GetIt.instance;

class Global {
  static const String dnsApi = 'https://api.codeventura.com.br';
  static String token = '';
  static UserEntity? user;
  static ProfileEntity? profile;
  static const imageRecipeDefault =
      'https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?q=80&w=2574&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D';

  String formatTime(double value) {
    int totalMinutes = value.round();
    int hours = totalMinutes ~/ 60;
    int minutes = totalMinutes % 60;

    if (hours > 0 && minutes > 0) {
      return '${hours}h ${minutes}m';
    } else if (hours > 0) {
      return '${hours}h';
    } else {
      return '${minutes}m';
    }
  }
}
