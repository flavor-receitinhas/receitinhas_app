import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';

class ProfileMappper {
  ProfileEntity fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      userID: map['userID'] ,
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      image: map['image'],
      createdAt: map['createdAt'] ,
      updatedAt: map['updatedAt'] ,
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
