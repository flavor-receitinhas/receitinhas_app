import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';

class ProfileController {
  final ProfileRepository _repository;
  ProfileController(this._repository);

  Future<ProfileEntity> getProfile(String id) async {
    final profile = await _repository.getProfile(id);
    return profile;
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(profile);
  }

  Future<void> updateImageProfile(String userID, String path) async {
    await _repository.updateImageProfile(userID, path);
  }
}
