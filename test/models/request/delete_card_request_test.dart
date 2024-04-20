import 'package:paymentez_sdk/models/request/delete_card_request.dart';
import 'package:test/test.dart';

void main() {
  group(DeleteCardRequest, () {
    test('toJson should return the correct JSON representation', () {
      // Arrange
      final deleteCardRequest = DeleteCardRequest(
        cardToken: 'cardToken',
        userId: 'userId',
      );

      // Act
      final json = deleteCardRequest.toJson();

      // Assert
      expect(json, {
        'card': {'token': 'cardToken'},
        'user': {'id': 'userId'},
      });
    });
  });
}
