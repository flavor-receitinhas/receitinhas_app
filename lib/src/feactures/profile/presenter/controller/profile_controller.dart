import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final ProfileRepository _repository;
  ProfileController(this._repository);

  late ProfileEntity profile;
  PageState state = PageState.loading;

  void init(BuildContext context) async {
    var arguments = ModalRoute.of(context)!.settings.arguments as ProfileEntity;
    profile = arguments;
    state = PageState.done;
    notifyListeners();
  }

  Future<void> getProfile(String id) async {
    state = PageState.loading;
    profile = await _repository.getProfile(id);
    state = PageState.done;
    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(profile);
  }
}
