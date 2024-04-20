import 'package:paymentez_sdk/models/request/pay/card_pci.dart';
import 'package:paymentez_sdk/models/request/pay/order_pay.dart';
import 'package:paymentez_sdk/models/request/pay/user_pay.dart';
import 'package:paymentez_sdk/models/request/pay_pci_request.dart';
import 'package:test/test.dart';

void main() {
  group(PayPCIRequest, () {
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
      final card = CardPCI(
        number: '4111111111111111',
        holderName: 'John Doe',
        expiryMonth: 12,
        expiryYear: 2023,
        cvc: '123',
      );

      final payPCIRequest =
          PayPCIRequest(user: userPay, order: orderPay, card: card);

      // Act
      final json = payPCIRequest.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());

      expect(json['user'], isA<Map<String, dynamic>>());
      expect(json['order'], isA<Map<String, dynamic>>());
      expect(json['card'], isA<Map<String, dynamic>>());

      expect(json['user']['id'], equals('123'));
      expect(json['user']['email'], equals('test@example.com'));
      expect(json['user']['phone'], equals('1234567890'));

      expect(json['order']['tax_percentage'], equals(10));
      expect(json['order']['taxable_amount'], equals(100.0));
      expect(json['order']['vat'], equals(12.0));
      expect(json['order']['amount'], equals(112.0));
      expect(json['order']['description'], equals('Test Order'));
      expect(json['order']['dev_reference'], equals('123456'));

      expect(json['card']['number'], equals('4111111111111111'));
      expect(json['card']['holder_name'], equals('John Doe'));
      expect(json['card']['expiry_month'], equals(12));
      expect(json['card']['expiry_year'], equals(2023));
      expect(json['card']['cvc'], equals('123'));
    });
  });
}
