

class ProfileEntity {
  final String userID;
  final String name;
  final String biography;
  final String? image;
  final int createdAt;
  final int updatedAt;

  ProfileEntity({required this.userID,required this.name,required this.biography, this.image,
      required this.createdAt,required this.updatedAt,});
}
