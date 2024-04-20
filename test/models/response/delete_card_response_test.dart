import 'package:paymentez_sdk/models/response/delete_card_response.dart';
import 'package:test/test.dart';

void main() {
  group(DeleteCardResponse, () {
    test('fromJson should return a DeleteCardResponse instance', () {
      final json = {
        'message': 'Success',
      };

      final response = DeleteCardResponse.fromJson(json);

      expect(response, isA<DeleteCardResponse>());
      expect(response.message, 'Success');
    });

    test('toJson should return a valid JSON map', () {
      final response = DeleteCardResponse(
        message: 'Success',
      );

      final json = response.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['message'], 'Success');
    });
  });
}
