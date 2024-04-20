// ignore_for_file: avoid_dynamic_calls

import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/card_pci_request.dart';
import 'package:test/test.dart';

void main() {
  group(CardPCIRequest, () {
    test('toJson should return a valid JSON map', () {
      final user = UserCard(
        id: '0',
        email: 'test@example.com',
      );

      final card = NewCard(
        holderName: 'John Doe',
        number: '1234567890123456',
        expiryMonth: 12,
        expiryYear: 2023,
        cvc: '123',
      );

      final request = CardPCIRequest(user: user, card: card);

      final jsonMap = request.toJson();

      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['user'], isA<Map<String, dynamic>>());
      expect(jsonMap['card'], isA<Map<String, dynamic>>());
      expect(jsonMap['user']['id'], user.id);
      expect(jsonMap['user']['email'], user.email);
      expect(jsonMap['card']['holder_name'], card.holderName);
      expect(jsonMap['card']['number'], card.number);
      expect(jsonMap['card']['expiry_month'], card.expiryMonth);
      expect(jsonMap['card']['expiry_year'], card.expiryYear);
      expect(jsonMap['card']['cvc'], card.cvc);
    });
  });
}
