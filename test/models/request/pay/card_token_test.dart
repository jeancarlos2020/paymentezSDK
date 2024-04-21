import 'package:paymentez_sdk/models/request/pay/card_token.dart';
import 'package:test/test.dart';

void main() {
  group(CardToken, () {
    test('Create instance', () {
      const cardToken = CardToken(token: 'test_token');

      expect(cardToken.token, equals('test_token'));
    });
    test('toJson should return a valid JSON map', () {
      const cardToken = CardToken(token: 'test_token');
      final json = cardToken.toJson();

      expect(json, isA<Map<String, dynamic>>());
      expect(json['token'], equals('test_token'));
    });

    test('props should not be empty', () {
      const cardToken = CardToken(token: 'test_token');
      final props = cardToken.props;

      expect(props, isNotEmpty);
    });
  });
}
