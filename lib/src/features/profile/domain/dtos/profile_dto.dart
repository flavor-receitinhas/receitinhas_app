class ProfileDto {
  final String name;
  final String biography;
  ProfileDto({
    required this.name,
    required this.biography,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'biography': biography,
    };
  }
}
