import 'package:paymentez_sdk/models/response/error_response.dart';
import 'package:paymentez_sdk/utils/dynamic_ext.dart';

class PaymentezError {
  PaymentezError({
    required this.error,
  });

  factory PaymentezError.fromJson(Map<String, dynamic> json) => PaymentezError(
        error: ErrorResponse.fromJson(json.getMap('error')),
      );

  final ErrorResponse error;

  Map<String, dynamic> toJson() => {
        'error': error.toJson(),
      };
}
