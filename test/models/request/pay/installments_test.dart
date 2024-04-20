import 'package:paymentez_sdk/models/request/pay/installments.dart';
import 'package:test/test.dart';

void main() {
  group('Installments', () {
    test('Check values', () {
      expect(Installments.month_0.value, 0);
      expect(Installments.month_1.value, 1);
      expect(Installments.month_2.value, 2);
      expect(Installments.month_3.value, 3);
      expect(Installments.month_6.value, 6);
      expect(Installments.month_9.value, 9);
      expect(Installments.month_12.value, 12);
      expect(Installments.month_15.value, 15);
      expect(Installments.month_18.value, 18);
      expect(Installments.month_24.value, 24);
      expect(Installments.month_30.value, 30);
      expect(Installments.month_36.value, 36);
    });
  });
}
