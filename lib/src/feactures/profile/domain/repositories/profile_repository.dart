import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile(String userID);
  Future<void> updateProfile(ProfileEntity profileEntity);
  Future<void> updateImageProfile(String userID, String imagePath);
}
