// ignore_for_file: avoid_dynamic_calls

import 'package:paymentez_sdk/models/response/card_register.dart';
import 'package:paymentez_sdk/models/response/card_response.dart';
import 'package:test/test.dart';

void main() {
  group(
    CardsResponse,
    () {
      test(
        'fromJson should return a valid CardsResponse object',
        () async {
          final json = {
            'cards': [
              {
                'bin': '123456',
                'status': 'active',
                'token': 'abc123',
                'holder_name': 'John Doe',
                'expiry_year': '2023',
                'expiry_month': '12',
                'transaction_reference': '1234567890',
                'type': 'visa',
                'number': '************1234',
                'message': 'Success',
              },
              {
                'bin': '123456',
                'status': 'active',
                'token': 'abc123',
                'holder_name': 'John Doe',
                'expiry_year': '2023',
                'expiry_month': '12',
                'transaction_reference': '1234567890',
                'type': 'visa',
                'number': '************1234',
                'message': 'Success',
              }
            ],
            'result_size': 2,
          };

          final response = CardsResponse.fromJson(json);

          expect(response.cards.length, equals(2));
          expect(response.resultSize, equals(2));
          // Add more assertions as needed
        },
      );

      test(
        'toJson should return a valid JSON object',
        () async {
          final cards = [
            CardRegister(
              bin: '123456',
              status: 'active',
              token: 'abc123',
              holderName: 'John Doe',
              expiryYear: '2023',
              expiryMonth: '12',
              transactionReference: '1234567890',
              type: 'visa',
              number: '************1234',
              message: 'Success',
            ),
            CardRegister(
              bin: '123456',
              status: 'active',
              token: 'abc123',
              holderName: 'John Doe',
              expiryYear: '2023',
              expiryMonth: '12',
              transactionReference: '1234567890',
              type: 'visa',
              number: '************1234',
              message: 'Success',
            ),
          ];
          final response = CardsResponse(cards: cards, resultSize: 2);

          final json = response.toJson();

          expect(json['cards'], isA<List<Map<String, dynamic>>>());
          expect(json['cards'].length, equals(2));
          expect(json['result_size'], equals(2));
          // Add more assertions as needed
        },
      );
    },
  );
}
