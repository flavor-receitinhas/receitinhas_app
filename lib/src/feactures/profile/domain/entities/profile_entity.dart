class ProfileEntity {
  final String userID;
  String name;
  String biography;
  String? image;
  final int createdAt;
  final int updatedAt;

  ProfileEntity({
    required this.userID,
    required this.name,
    required this.biography,
    this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  ProfileEntity copyWith({
    String? userID,
    String? name,
    String? biography,
    String? image,
    int? createdAt,
    int? updatedAt,
  }) {
    return ProfileEntity(
      userID: userID ?? this.userID,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
