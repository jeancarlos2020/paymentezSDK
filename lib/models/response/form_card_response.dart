import 'package:paymentez_sdk/models/response/card_register.dart';

class FormCardResponse {
  FormCardResponse({
    required this.type,
    required this.message,
    this.data,
  });

  factory FormCardResponse.fromJson(Map<String, dynamic> json) {
    return FormCardResponse(
      type: json['type'] as String,
      message: json['message'] as String,
      data: json['data'] == null
          ? null
          : CardRegister.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  final String type;
  final String message;
  final CardRegister? data;
}
