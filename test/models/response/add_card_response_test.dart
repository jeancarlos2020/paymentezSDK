import 'package:paymentez_sdk/models/response/add_card_response.dart';
import 'package:paymentez_sdk/models/response/card_register.dart';
import 'package:test/test.dart';

void main() {
  group(AddCardResponse, () {
    test('fromJson should return an instance of AddCardResponse', () {
      // Test data
      final jsonData = {
        'card': {
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
        'tokenize_url': 'https://example.com/tokenize',
      };

      // Call the method
      final response = AddCardResponse.fromJson(jsonData);

      // Assertions
      expect(response, isA<AddCardResponse>());
      expect(response.card, isA<CardRegister>());
      expect(response.tokenizeURL, 'https://example.com/tokenize');
    });

    test('toJson should return a valid JSON map', () {
      // Test data
      final cardRegister = CardRegister(
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
      );
      final response = AddCardResponse(
        card: cardRegister,
        tokenizeURL: 'https://example.com/tokenize',
      );

      // Call the method
      final jsonMap = response.toJson();

      final cardJson = jsonMap['card'] as Map<String, dynamic>;

      // Assertions
      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['card'], isA<Map<String, dynamic>>());
      expect(jsonMap['tokenize_url'], 'https://example.com/tokenize');

      expect(cardJson['bin'], '123456');
      expect(cardJson['status'], 'active');
      expect(cardJson['token'], 'abc123');
      expect(cardJson['holder_name'], 'John Doe');
      expect(cardJson['expiry_year'], '2023');
      expect(cardJson['expiry_month'], '12');
      expect(cardJson['transaction_reference'], '1234567890');
      expect(cardJson['type'], 'visa');
      expect(cardJson['number'], '************1234');
      expect(cardJson['message'], 'Success');
    });

    // test('props should not be empty', () {
    //   // Test data
    //   final cardRegister = CardRegister(
    //     bin: '123456',
    //     status: 'active',
    //     token: 'abc123',
    //     holderName: 'John Doe',
    //     expiryYear: '2023',
    //     expiryMonth: '12',
    //     transactionReference: '1234567890',
    //     type: 'visa',
    //     number: '************1234',
    //     message: 'Success',
    //   );
    //   final response = AddCardResponse(
    //     card: cardRegister,
    //     tokenizeURL: 'https://example.com/tokenize',
    //   );

    //   final props = response.props;

    //   // Assertions

    //   expect(props, isNotEmpty);
    // });
  });
}
