// ignore_for_file: avoid_dynamic_calls

import 'package:paymentez_sdk/models/response/pay_card_resp.dart';
import 'package:paymentez_sdk/models/response/pay_response.dart';
import 'package:paymentez_sdk/models/response/payment_transaction.dart';
import 'package:test/test.dart';

void main() {
  group(
    PayResponse,
    () {
      test(
        'Test PayResponse.fromJson',
        () {
          final json = {
            'transaction': {
              'status': 'success',
              'lot_number': '123456',
              'authorization_code': 'ABC123',
              'status_detail': 1,
              'message': 'Payment successful',
              'id': '1',
              'payment_date': '2022-01-01T00:00:00Z',
              'payment_method_type': 'credit_card',
              'dev_reference': 'DEV123',
              'carrier_code': 'CARRIER123',
              'product_description': 'Product description',
              'current_status': 'active',
              'amount': 1000,
              'carrier': 'Carrier',
              'installments': 1,
              'trace_number': 'TRACE123',
              'installments_type': 'fixed',
            },
            'card': {
              'bin': '123456',
              'expiry_year': '2023',
              'expiry_month': '12',
              'transaction_reference': 'REF123',
              'type': 'visa',
              'number': '************1234',
              'origin': 'local',
              'status': 'active',
              'token': 'TOKEN123',
            },
          };

          final payResponse = PayResponse.fromJson(json);

          expect(payResponse.transaction.status, 'success');
          expect(payResponse.transaction.lotNumber, '123456');
          expect(payResponse.transaction.authorizationCode, 'ABC123');
          expect(payResponse.transaction.statusDetail, 1);
          expect(payResponse.transaction.message, 'Payment successful');
          expect(payResponse.transaction.id, '1');
          expect(
            payResponse.transaction.paymentDate,
            DateTime.parse('2022-01-01T00:00:00Z'),
          );
          expect(payResponse.transaction.paymentMethodType, 'credit_card');
          expect(payResponse.transaction.devReference, 'DEV123');
          expect(payResponse.transaction.carrierCode, 'CARRIER123');
          expect(
            payResponse.transaction.productDescription,
            'Product description',
          );
          expect(payResponse.transaction.currentStatus, 'active');
          expect(payResponse.transaction.amount, 1000);
          expect(payResponse.transaction.carrier, 'Carrier');
          expect(payResponse.transaction.installments, 1);
          expect(payResponse.transaction.traceNumber, 'TRACE123');
          expect(payResponse.transaction.installmentsType, 'fixed');

          expect(payResponse.card.bin, '123456');
          expect(payResponse.card.expiryYear, '2023');
          expect(payResponse.card.expiryMonth, '12');
          expect(payResponse.card.transactionReference, 'REF123');
          expect(payResponse.card.type, 'visa');
          expect(payResponse.card.number, '************1234');
          expect(payResponse.card.origin, 'local');
          expect(payResponse.card.status, 'active');
          expect(payResponse.card.token, 'TOKEN123');
        },
      );

      test(
        'Test PayResponse.toJson',
        () {
          final paymentDate = DateTime.parse('2022-01-01T00:00:00Z');

          final transaction = PaymentTransaction(
            status: 'success',
            lotNumber: '123456',
            authorizationCode: 'ABC123',
            statusDetail: 1,
            message: 'Payment successful',
            id: '1',
            paymentDate: paymentDate,
            paymentMethodType: 'credit_card',
            devReference: 'DEV123',
            carrierCode: 'CARRIER123',
            productDescription: 'Product description',
            currentStatus: 'active',
            amount: 1000,
            carrier: 'Carrier',
            installments: 1,
            traceNumber: 'TRACE123',
            installmentsType: 'fixed',
          );

          final card = PayCardResp(
            bin: '123456',
            expiryYear: '2023',
            expiryMonth: '12',
            transactionReference: 'REF123',
            type: 'visa',
            number: '************1234',
            origin: 'local',
            status: 'active',
            token: 'TOKEN123',
          );

          final payResponse = PayResponse(
            transaction: transaction,
            card: card,
          );

          final json = payResponse.toJson();

          expect(json['transaction']['status'], 'success');
          expect(json['transaction']['lot_number'], '123456');
          expect(json['transaction']['authorization_code'], 'ABC123');
          expect(json['transaction']['status_detail'], 1);
          expect(json['transaction']['message'], 'Payment successful');
          expect(json['transaction']['id'], '1');
          expect(
            json['transaction']['payment_date'],
            paymentDate.toIso8601String(),
          );
          expect(json['transaction']['payment_method_type'], 'credit_card');
          expect(json['transaction']['dev_reference'], 'DEV123');
          expect(json['transaction']['carrier_code'], 'CARRIER123');
          expect(
            json['transaction']['product_description'],
            'Product description',
          );
          expect(json['transaction']['current_status'], 'active');
          expect(json['transaction']['amount'], 1000);
          expect(json['transaction']['carrier'], 'Carrier');
          expect(json['transaction']['installments'], 1);
          expect(json['transaction']['trace_number'], 'TRACE123');
          expect(json['transaction']['installments_type'], 'fixed');

          expect(json['card']['bin'], '123456');
          expect(json['card']['expiry_year'], '2023');
          expect(json['card']['expiry_month'], '12');
          expect(json['card']['transaction_reference'], 'REF123');
          expect(json['card']['type'], 'visa');
          expect(json['card']['number'], '************1234');
          expect(json['card']['origin'], 'local');
          expect(json['card']['status'], 'active');
          expect(json['card']['token'], 'TOKEN123');
        },
      );
    },
  );
}
