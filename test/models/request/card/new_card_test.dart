import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:test/test.dart';

void main() {
  group(NewCard, () {
    test('toJson should return a valid JSON map', () {
      // Arrange
      const card = NewCard(
        number: '1234567890123456',
        holderName: 'John Doe',
        expiryMonth: 12,
        expiryYear: 2023,
        cvc: '123',
      );

      // Act
      final json = card.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['number'], equals('1234567890123456'));
      expect(json['holder_name'], equals('John Doe'));
      expect(json['expiry_month'], equals(12));
      expect(json['expiry_year'], equals(2023));
      expect(json['cvc'], equals('123'));
    });

    test('props should not be empty', () {
      // Arrange
      const card = NewCard(
        number: '1234567890123456',
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
