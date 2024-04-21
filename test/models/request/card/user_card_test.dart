import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:test/test.dart';

void main() {
  group(UserCard, () {
    test('Create instance', () {
      const userCard = UserCard(
        id: '123',
        email: 'email@email.com',
      );

      expect(userCard.id, equals('123'));
      expect(userCard.email, equals('email@email.com'));
    });
    test('fromJson should return a valid UserCard instance', () {
      final json = {
        'id': '123',
        'email': 'test@example.com',
      };

      final userCard = UserCard.fromJson(json);

      expect(userCard.id, equals('123'));
      expect(userCard.email, equals('test@example.com'));
    });

    test('toJson should return a valid JSON map', () {
      const userCard = UserCard(
        id: '123',
        email: 'test@example.com',
      );

      final json = userCard.toJson();

      expect(json['id'], equals('123'));
      expect(json['email'], equals('test@example.com'));
    });

    test('props should not be empty', () {
      const userCard = UserCard(
        id: '123',
        email: 'test@example.com',
      );

      final props = userCard.props;

      expect(props, isNotEmpty);
    });
  });
}
