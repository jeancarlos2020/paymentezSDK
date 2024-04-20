class ErrorResponse {
  ErrorResponse({
    required this.type,
    required this.help,
    required this.description,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        type: json['type'] as String,
        help: json['help'] as String,
        description: json['description'],
      );

  final String type;
  final String help;
  final dynamic description;

  Map<String, dynamic> toJson() => {
        'type': type,
        'help': help,
        'description': description,
      };
}
