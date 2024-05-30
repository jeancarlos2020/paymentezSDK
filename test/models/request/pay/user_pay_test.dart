import 'package:paymentez_sdk/models/request/pay/user_pay.dart';
import 'package:test/test.dart';

void main() {
  group(UserPay, () {
    test('toJson should return a valid JSON map', () {
      // Arrange
      const userPay = UserPay(
        id: '123',
        email: 'test@example.com',
        phone: '1234567890',
      );

      // Act
      final json = userPay.toJson();

      // Assert
      expect(json, isA<Map<String, dynamic>>());
      expect(json['id'], equals('123'));
      expect(json['email'], equals('test@example.com'));
      expect(json['phone'], equals('1234567890'));
    });
  });

  test('props should not be empty', () {
    // Arrange
    const userPay = UserPay(
      id: '123',
      email: 'test@example.com',
      phone: '1234567890',
    );

    // Act
    final props = userPay.props;

    // Assert

    expect(props, isNotEmpty);
  });
}
