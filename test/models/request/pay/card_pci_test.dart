import 'package:paymentez_sdk/models/request/pay/card_pci.dart';
import 'package:test/test.dart';

void main() {
  group(CardPCI, () {
    test('Create instance', () {
      const card = CardPCI(
        number: '4111111111111111',
        holderName: 'John Doe',
        expiryMonth: 12,
        expiryYear: 2023,
        cvc: '123',
      );

      expect(card.number, equals('4111111111111111'));
      expect(card.holderName, equals('John Doe'));
      expect(card.expiryMonth, equals(12));
      expect(card.expiryYear, equals(2023));
      expect(card.cvc, equals('123'));
    });
    test('toJson should return a valid JSON map', () {
      // Arrange
      const card = CardPCI(
        number: '4111111111111111',
        holderName: 'John Doe',
        expiryMonth: 12,
        expiryYear: 2023,
        cvc: '123',
      );

      // Act
      final json = card.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['number'], equals('4111111111111111'));
      expect(json['holder_name'], equals('John Doe'));
      expect(json['expiry_month'], equals(12));
      expect(json['expiry_year'], equals(2023));
      expect(json['cvc'], equals('123'));
    });

    test('props should not be empty', () {
      // Arrange
      const card = CardPCI(
        number: '4111111111111111',
        holderName: 'John Doe',
        expiryMonth: 12,
        expiryYear: 2023,
        cvc: '123',
      );

      // Act
      final props = card.props;

      // Assert

      expect(props, isNotEmpty);
    });
  });
}
