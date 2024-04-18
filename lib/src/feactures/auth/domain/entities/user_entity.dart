class UserEntity {
  final String id;
  final String email;
  String? name;
  UserEntity({
    required this.id,
    required this.email,
    this.name,
  });
}
