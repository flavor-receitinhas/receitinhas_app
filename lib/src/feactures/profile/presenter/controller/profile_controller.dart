import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_page.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:flutter/material.dart';

class ProfileController extends ChangeNotifier {
  final ProfileRepository _repository;
  ProfileController(this._repository);

  late ProfileEntity profile;
  PageState state = PageState.loading;

  void init() async {
    profile = await _repository.getProfile(Global.user!.id);
    state = PageState.done;
    notifyListeners();
  }

  Future<ProfileEntity> getProfile(String id) async {
    final profile = await _repository.getProfile(id);
    return profile;
  }

  Future<void> refreshProfile(String id) async {
    profile = await _repository.getProfile(id);
    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(profile);
  }
}
