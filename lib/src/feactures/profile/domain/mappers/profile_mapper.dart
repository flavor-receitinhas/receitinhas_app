import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';

class ProfileMappper {
  ProfileEntity fromMap(Map<String, dynamic> map) {
    return ProfileEntity(
      id: map['id'] ,
      userId: map['userId'] ,
      name: map['name'] ?? '',
      biography: map['biography'] ?? '',
      image: map['image'],
      createdAt: map['createdAt'] ,
      updatedAt: map['updatedAt'] ,
      totalRecipes: map['totalRecipes'] ?? 0,
    );
  }

  Map<String, dynamic> toMap(ProfileEntity profile) {
    return {
      'id': profile.id,
      'userId': profile.userId,
      'name': profile.name,
      'biography': profile.biography,
      'image': profile.image,
      'createdAt': profile.createdAt,
      'updatedAt': profile.updatedAt,
      'totalRecipes': profile.totalRecipes,
    };
  }
}
