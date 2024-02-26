import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';

class ProfileMappper {
  ProfileEntity fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      userID: map['userID'] as String,
      name: map['name'] as String,
      biography: map['biography'] as String,
      image: map['image'] as String,
      createdAt: map['createdAt'] as int,
      updatedAt: map['updatedAt'] as int,
    );
  }

  Map<String, dynamic> toMap(ProfileEntity profile) {
    return {
      'userID': profile.userID,
      'name': profile.name,
      'biography': profile.biography,
      'image': profile.image,
      'createdAt': profile.createdAt,
      'updatedAt': profile.updatedAt,
    };
  }
}
