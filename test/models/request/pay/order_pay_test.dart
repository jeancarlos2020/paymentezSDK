import 'package:paymentez_sdk/models/request/pay/installments_type.dart';
import 'package:paymentez_sdk/models/request/pay/order_pay.dart';
import 'package:test/test.dart';

void main() {
  group(OrderPay, () {
    test('toJson() should return a valid JSON map', () {
      const orderPay = OrderPay(
        taxPercentage: 10,
        taxableAmount: 100,
        vat: 12,
        amount: 112,
        description: 'Test Order',
        devReference: '123456',
      );

      final jsonMap = orderPay.toJson();

      expect(jsonMap, isA<Map<String, dynamic>>());
      expect(jsonMap['tax_percentage'], equals(10));
      expect(jsonMap['taxable_amount'], equals(100.0));
      expect(jsonMap['vat'], equals(12.0));
      expect(jsonMap['amount'], equals(112.0));
      expect(jsonMap['description'], equals('Test Order'));
      expect(jsonMap['dev_reference'], equals('123456'));
    });

    test('toJson() should include installments if set', () {
      const orderPay = OrderPay(
        taxPercentage: 10,
        taxableAmount: 100,
        vat: 12,
        amount: 112,
        description: 'Test Order',
        devReference: '123456',
        installments: 3,
      );

      final jsonMap = orderPay.toJson();

      expect(jsonMap, containsPair('installments', 3));
    });

    test('toJson() should include installments_type if set', () {
      const installmentsType = InstallmentsType.type0;
      const orderPay = OrderPay(
        taxPercentage: 10,
        taxableAmount: 100,
        vat: 12,
        amount: 112,
        description: 'Test Order',
        devReference: '123456',
        installmentsType: installmentsType,
      );

      final jsonMap = orderPay.toJson();

      expect(
        jsonMap,
        containsPair('installments_type', installmentsType.value),
      );
    });
  });

  test('toJson() should include installments_type and installments', () {
    const installmentsType = InstallmentsType.type0;
    const orderPay = OrderPay(
      taxPercentage: 10,
      taxableAmount: 100,
      vat: 12,
      amount: 112,
      description: 'Test Order',
      devReference: '123456',
      installments: 3,
      installmentsType: installmentsType,
    );

    final jsonMap = orderPay.toJson();

    expect(jsonMap, containsPair('installments', 3));
    expect(
      jsonMap,
      containsPair('installments_type', installmentsType.value),
    );
  });

  test('props should not be empty', () {
    const orderPay = OrderPay(
      taxPercentage: 10,
      taxableAmount: 100,
      vat: 12,
      amount: 112,
      description: 'Test Order',
      devReference: '123456',
    );

    final props = orderPay.props;

    expect(props, isNotEmpty);
  });
}
