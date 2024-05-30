import 'package:paymentez_sdk/models/response/error_response.dart';
import 'package:test/test.dart';

void main() {
  group(ErrorResponse, () {
    test('fromJson should return an ErrorResponse object', () {
      final json = {
        'type': 'error',
        'help': 'help message',
        'description': 'error description',
      };

      final errorResponse = ErrorResponse.fromJson(json);

      expect(errorResponse, isA<ErrorResponse>());
      expect(errorResponse.type, 'error');
      expect(errorResponse.help, 'help message');
      expect(errorResponse.description, 'error description');
    });

    test('toJson should return a JSON map', () {
      final errorResponse = ErrorResponse(
        type: 'error',
        help: 'help message',
        description: 'error description',
      );

      final json = errorResponse.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['type'], 'error');
      expect(json['help'], 'help message');
      expect(json['description'], 'error description');
    });
  });
}
