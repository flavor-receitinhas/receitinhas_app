// ignore_for_file: public_member_api_docs, sort_constructors_first
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
