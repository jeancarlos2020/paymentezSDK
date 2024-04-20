import 'package:paymentez_sdk/models/request/pay/card_token.dart';
import 'package:paymentez_sdk/models/request/pay/order_pay.dart';
import 'package:paymentez_sdk/models/request/pay/user_pay.dart';
import 'package:paymentez_sdk/models/request/pay_request.dart';
import 'package:test/test.dart';

void main() {
  group(PayRequest, () {
    test('toJson should return a valid JSON map', () {
      // Arrange
      final userPay = UserPay(
        id: '123',
        email: 'test@example.com',
        phone: '1234567890',
      );
      final orderPay = OrderPay(
        taxPercentage: 10,
        taxableAmount: 100,
        vat: 12,
        amount: 112,
        description: 'Test Order',
        devReference: '123456',
      );

      final card = CardToken(token: '123456');
      final payRequest = PayRequest(
        user: userPay,
        order: orderPay,
        card: card,
      );

      // Act
      final json = payRequest.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      // add more assertions to validate the JSON structure and values
    });
  });
}
