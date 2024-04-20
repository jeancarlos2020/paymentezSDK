import 'package:paymentez_sdk/models/response/error_response.dart';
import 'package:paymentez_sdk/models/response/paymentez_error.dart';
import 'package:test/test.dart';

void main() {
  group(
    PaymentezError,
    () {
      test(
        'fromJson should return a valid PaymentezError instance',
        () {
          final json = {
            'error': {
              'type': 'error',
              'help': 'help message',
              'description': 'error description',
            },
          };

          final paymentezError = PaymentezError.fromJson(json);

          expect(paymentezError, isA<PaymentezError>());
          expect(paymentezError.error, isA<ErrorResponse>());
          expect(paymentezError.error.type, 'error');
          expect(paymentezError.error.help, 'help message');
          expect(paymentezError.error.description, 'error description');
        },
      );

      test(
        'toJson should return a valid JSON map',
        () {
          final errorResponse = ErrorResponse(
            type: 'error',
            help: 'help message',
            description: 'error description',
          );

          final paymentezError = PaymentezError(
            error: errorResponse,
          );

          final json = paymentezError.toJson();

          expect(json, isA<Map<String, dynamic>>());
          expect(json['error'], isA<Map<String, dynamic>>());
          expect(json['error']['type'], 'error');
          expect(json['error']['help'], 'help message');
          expect(json['error']['description'], 'error description');
        },
      );
    },
  );
}
