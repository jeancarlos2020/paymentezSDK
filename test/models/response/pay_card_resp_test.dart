import 'package:paymentez_sdk/models/response/pay_card_resp.dart';
import 'package:test/test.dart';

void main() {
  group(PayCardResp, () {
    test('fromJson should return a valid PayCardResp object', () {
      final json = {
        'bin': '123456',
        'status': 'success',
        'token': 'abc123',
        'expiry_year': '2023',
        'expiry_month': '12',
        'transaction_reference': '1234567890',
        'type': 'visa',
        'number': '4111111111111111',
        'origin': 'paymentez',
      };

      final payCardResp = PayCardResp.fromJson(json);

      expect(payCardResp.bin, '123456');
      expect(payCardResp.status, 'success');
      expect(payCardResp.token, 'abc123');
      expect(payCardResp.expiryYear, '2023');
      expect(payCardResp.expiryMonth, '12');
      expect(payCardResp.transactionReference, '1234567890');
      expect(payCardResp.type, 'visa');
      expect(payCardResp.number, '4111111111111111');
      expect(payCardResp.origin, 'paymentez');
    });

    test('toJson should return a valid JSON object', () {
      final payCardResp = PayCardResp(
        bin: '123456',
        status: 'success',
        token: 'abc123',
        expiryYear: '2023',
        expiryMonth: '12',
        transactionReference: '1234567890',
        type: 'visa',
        number: '4111111111111111',
        origin: 'paymentez',
      );

      final json = payCardResp.toJson();

      expect(json['bin'], '123456');
      expect(json['status'], 'success');
      expect(json['token'], 'abc123');
      expect(json['expiry_year'], '2023');
      expect(json['expiry_month'], '12');
      expect(json['transaction_reference'], '1234567890');
      expect(json['type'], 'visa');
      expect(json['number'], '4111111111111111');
      expect(json['origin'], 'paymentez');
    });
  });
}
