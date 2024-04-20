import 'package:paymentez_sdk/models/response/card_register.dart';
import 'package:paymentez_sdk/models/response/form_card_response.dart';
import 'package:test/test.dart';

void main() {
  group(FormCardResponse, () {
    test('fromJson should return a valid FormCardResponse object', () {
      final json = {
        'type': 'success',
        'message': 'Form card response message',
        'data': {
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
      };

      final formCardResponse = FormCardResponse.fromJson(json);

      expect(formCardResponse.type, 'success');
      expect(formCardResponse.message, 'Form card response message');
      expect(formCardResponse.data, isNotNull);
      expect(formCardResponse.data, isA<CardRegister>());
    });
  });
}
