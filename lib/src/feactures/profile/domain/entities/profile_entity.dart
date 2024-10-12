class ProfileEntity {
  final String id;
  final String userId;
  String name;
  String biography;
  String? image;
  final int createdAt;
  final int updatedAt;
  final int totalRecipes;

  ProfileEntity({
    required this.id,
    required this.userId,
    required this.name,
    required this.biography,
    this.image,
    required this.createdAt,
    required this.updatedAt,
    required this.totalRecipes,
  });

  ProfileEntity copyWith({
    String? userId,
    String? name,
    String? biography,
    String? image,
    int? createdAt,
    int? updatedAt,
    int? totalRecipes,
  }) {
    return ProfileEntity(
      id: id,
      userId: userId ?? this.userId,
      name: name ?? this.name,
      biography: biography ?? this.biography,
      image: image ?? this.image,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      totalRecipes: totalRecipes ?? this.totalRecipes,
    );
  }
}
