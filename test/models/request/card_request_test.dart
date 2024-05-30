// ignore_for_file: avoid_dynamic_calls

import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/card_request.dart';
import 'package:test/test.dart';

void main() {
  group(
    CardRequest,
    () {
      test('toJson should return a valid JSON map', () {
        // Arrange
        const userCard = UserCard(
          id: '0',
          email: 'email@email.com',
        );
        const cardRequest = CardRequest(
          user: userCard,
          locale: 'en_US',
          requireBillingAddress: true,
          userAgent: 'Mozilla/5.0',
        );

        // Act
        final json = cardRequest.toJson();

        // Assert
        expect(json, isA<Map<String, dynamic>>());
        expect(json['user'], isA<Map<String, dynamic>>());
        expect(json['user']['id'], equals('0'));
        expect(json['user']['email'], equals('email@email.com'));
        expect(json['locale'], equals('en_US'));
        expect(json['requireBillingAddress'], equals(true));
        expect(json['userAgent'], equals('Mozilla/5.0'));
      });

      test(
        'toJson should return a valid JSON map without optional fields',
        () {
          // Arrange
          const userCard = UserCard(
            id: '0',
            email: 'email@email.com',
          );
          const cardRequest = CardRequest(
            user: userCard,
            locale: 'en_US',
            requireBillingAddress: false,
          );

          // Act

          final json = cardRequest.toJson();

          // Assert

          expect(json, isA<Map<String, dynamic>>());

          expect(json['user'], isA<Map<String, dynamic>>());
          expect(json['user']['id'], equals('0'));
          expect(json['user']['email'], equals('email@email.com'));
          expect(json['locale'], equals('en_US'));
          expect(json['requireBillingAddress'], equals(false));
          expect(json.containsKey('userAgent'), equals(false));
        },
      );

      test(
        'props should not be empty',
        () {
          const userCard = UserCard(
            id: '0',
            email: 'email@email.com',
          );
          const cardRequest = CardRequest(
            user: userCard,
            locale: 'en_US',
            requireBillingAddress: true,
            userAgent: 'Mozilla/5.0',
          );

          // Act
          final props = cardRequest.props;

          // Assert
          expect(props, isNotEmpty);
        },
      );
    },
  );
}
