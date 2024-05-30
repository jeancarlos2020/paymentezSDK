import 'package:paymentez_sdk/models/response/payment_transaction.dart';
import 'package:test/test.dart';

void main() {
  group(
    PaymentTransaction,
    () {
      test(
        'Test PaymentTransaction.fromJson',
        () async {
          final json = {
            'status': 'success',
            'lot_number': '123456',
            'authorization_code': 'ABC123',
            'status_detail': 1,
            'message': 'Payment successful',
            'id': '0',
            'payment_date': '2022-01-01T00:00:00Z',
            'payment_method_type': 'credit_card',
            'dev_reference': 'DEV123',
            'carrier_code': 'CARRIER123',
            'product_description': 'Product description',
            'current_status': 'active',
            'amount': 100,
            'carrier': 'Carrier',
            'installments': 1,
            'trace_number': 'TRACE123',
            'installments_type': 'fixed',
          };

          final paymentTransaction = PaymentTransaction.fromJson(json);

          expect(paymentTransaction.status, 'success');
          expect(paymentTransaction.lotNumber, '123456');
          expect(paymentTransaction.authorizationCode, 'ABC123');
          expect(paymentTransaction.statusDetail, 1);
          expect(paymentTransaction.message, 'Payment successful');
          expect(paymentTransaction.id, '0');
          expect(
            paymentTransaction.paymentDate,
            DateTime.parse('2022-01-01T00:00:00Z'),
          );
          expect(paymentTransaction.paymentMethodType, 'credit_card');
          expect(paymentTransaction.devReference, 'DEV123');
          expect(paymentTransaction.carrierCode, 'CARRIER123');
          expect(paymentTransaction.productDescription, 'Product description');
          expect(paymentTransaction.currentStatus, 'active');
          expect(paymentTransaction.amount, 100);
          expect(paymentTransaction.carrier, 'Carrier');
          expect(paymentTransaction.installments, 1);
          expect(paymentTransaction.traceNumber, 'TRACE123');
          expect(paymentTransaction.installmentsType, 'fixed');
        },
      );

      test('Test PaymentTransaction.toJson', () async {
        final paymentTransaction = PaymentTransaction(
          status: 'success',
          lotNumber: '123456',
          authorizationCode: 'ABC123',
          statusDetail: 1,
          message: 'Payment successful',
          id: '0',
          paymentDate: DateTime.parse('2022-01-01T00:00:00Z'),
          paymentMethodType: 'credit_card',
          devReference: 'DEV123',
          carrierCode: 'CARRIER123',
          productDescription: 'Product description',
          currentStatus: 'active',
          amount: 100,
          carrier: 'Carrier',
          installments: 1,
          traceNumber: 'TRACE123',
          installmentsType: 'fixed',
        );

        final json = paymentTransaction.toJson();

        expect(json['status'], 'success');
        expect(json['lot_number'], '123456');
        expect(json['authorization_code'], 'ABC123');
        expect(json['status_detail'], 1);
        expect(json['message'], 'Payment successful');
        expect(json['id'], '0');
        expect(
          json['payment_date'],
          DateTime.parse('2022-01-01T00:00:00Z').toIso8601String(),
        );
        expect(json['payment_method_type'], 'credit_card');
        expect(json['dev_reference'], 'DEV123');
        expect(json['carrier_code'], 'CARRIER123');
        expect(json['product_description'], 'Product description');
        expect(json['current_status'], 'active');
        expect(json['amount'], 100);
        expect(json['carrier'], 'Carrier');
        expect(json['installments'], 1);
        expect(json['trace_number'], 'TRACE123');
        expect(json['installments_type'], 'fixed');
      });
    },
  );
}
