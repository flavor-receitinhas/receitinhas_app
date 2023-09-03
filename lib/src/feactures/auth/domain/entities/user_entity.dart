class UserEntity {
  final String id;
  final String? name;
  final String email;
  UserEntity({
    required this.id,
    this.name,
    required this.email,
  });
}
