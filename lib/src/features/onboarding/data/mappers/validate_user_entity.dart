class ValidateUserEntity {
  final String name;
  final String message;
  final bool valid;

  ValidateUserEntity({
    required this.name,
    required this.message,
    required this.valid,
  });

  factory ValidateUserEntity.fromMap(Map<String, dynamic> map) {
    return ValidateUserEntity(
      name: map['name'] as String,
      message: map['message'] as String,
      valid: map['valid'] as bool,
    );
  }
  Map<String, dynamic> toMap() {
    return {'name': name, 'message': message, 'valid': valid};
  }
}
