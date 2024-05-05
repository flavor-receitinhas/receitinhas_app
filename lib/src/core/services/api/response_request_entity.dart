class ResponseRequestEntity {
  final Map<String, dynamic> data;

  final int statusCode;

  final String statusMessage;

  ResponseRequestEntity({
    required this.data,
    required this.statusCode,
    required this.statusMessage,
  });
}
