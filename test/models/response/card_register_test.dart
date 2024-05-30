import 'package:paymentez_sdk/models/response/card_register.dart';
import 'package:test/test.dart';

void main() {
  group(
    CardRegister,
    () {
      test(
        'fromJson should return a valid CardRegister instance',
        () {
          final json = {
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
          };

          final cardRegister = CardRegister.fromJson(json);

          expect(cardRegister.bin, '123456');
          expect(cardRegister.status, 'active');
          expect(cardRegister.token, 'abc123');
          expect(cardRegister.holderName, 'John Doe');
          expect(cardRegister.expiryYear, '2023');
          expect(cardRegister.expiryMonth, '12');
          expect(cardRegister.transactionReference, '1234567890');
          expect(cardRegister.type, 'visa');
          expect(cardRegister.number, '************1234');
          expect(cardRegister.message, 'Success');
        },
      );
    },
  );

  test('toJson should return a valid map', () {
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

    final json = cardRegister.toJson();

    expect(json['bin'], '123456');
    expect(json['status'], 'active');
    expect(json['token'], 'abc123');
    expect(json['holder_name'], 'John Doe');
    expect(json['expiry_year'], '2023');
    expect(json['expiry_month'], '12');
    expect(json['transaction_reference'], '1234567890');
    expect(json['type'], 'visa');
    expect(json['number'], '************1234');
    expect(json['message'], 'Success');
  });
}
