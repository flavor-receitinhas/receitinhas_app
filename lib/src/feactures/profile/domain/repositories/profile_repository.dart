import 'package:app_receitas/src/feactures/profile/domain/dtos/profile_dto.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<ProfileEntity> getProfile(String userID);
  Future<void> updateProfile(
      {required String userId, required ProfileDto profileDto});
  Future<void> updateImageProfile(String userID, String imagePath);
}
