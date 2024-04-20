import 'package:paymentez_sdk/models/request/pay/installments_type.dart';
import 'package:test/test.dart';

void main() {
  group(InstallmentsType, () {
    test('type1 should have correct value and description', () {
      expect(InstallmentsType.type1.value, 1);
      expect(
          InstallmentsType.type1.description,
          'Revolving and deferred without interest (The bank will pay '
          'to the commerce the installment, month by month)');
    });

    test('type2 should have correct value and description', () {
      expect(InstallmentsType.type2.value, 2);
      expect(
        InstallmentsType.type2.description,
        'Deferred with interest',
      );
    });

    test('type3 should have correct value and description', () {
      expect(InstallmentsType.type3.value, 3);
      expect(
        InstallmentsType.type3.description,
        'Deferred without interest',
      );
    });
    test('type7 should have correct value and description', () {
      expect(InstallmentsType.type7.value, 7);
      expect(
        InstallmentsType.type7.description,
        'Deferred with interest and months of grace',
      );
    });

    test('type6 should have correct value and description', () {
      expect(InstallmentsType.type6.value, 6);
      expect(
        InstallmentsType.type6.description,
        'Deferred without interest pay month by month. (*)',
      );
    });

    test('type9 should have correct value and description', () {
      expect(InstallmentsType.type9.value, 9);
      expect(
        InstallmentsType.type9.description,
        'Deferred without interest and months of grace',
      );
    });

    test('type10 should have correct value and description', () {
      expect(InstallmentsType.type10.value, 10);
      expect(
        InstallmentsType.type10.description,
        'Deferred without interest promotion bimonthly. (*)',
      );
    });

    test('type21 should have correct value and description', () {
      expect(InstallmentsType.type21.value, 21);
      expect(
        InstallmentsType.type21.description,
        'For Diners Club exclusive, deferred with and without interest',
      );
    });

    test('type22 should have correct value and description', () {
      expect(InstallmentsType.type22.value, 22);
      expect(
        InstallmentsType.type22.description,
        'For Diners Club exclusive, deferred with and without interest',
      );
    });

    test('type30 should have correct value and description', () {
      expect(InstallmentsType.type30.value, 30);
      expect(
        InstallmentsType.type30.description,
        'Deferred with interest pay month by month. (*)',
      );
    });

    test('type50 should have correct value and description', () {
      expect(InstallmentsType.type50.value, 50);
      expect(
        InstallmentsType.type50.description,
        'Deferred without interest promotions (Supermaxi). (*)',
      );
    });

    test('type51 should have correct value and description', () {
      expect(InstallmentsType.type51.value, 51);
      expect(
        InstallmentsType.type51.description,
        'Deferred with interest (Cuota fácil). (*)',
      );
    });

    test('type52 should have correct value and description', () {
      expect(InstallmentsType.type52.value, 52);
      expect(
        InstallmentsType.type52.description,
        'Without interest (Rendecion Produmillas). (*)',
      );
    });

    test('type53 should have correct value and description', () {
      expect(InstallmentsType.type53.value, 53);
      expect(
        InstallmentsType.type53.description,
        'Without interest sale with promotions. (*)',
      );
    });

    test('type70 should have correct value and description', () {
      expect(InstallmentsType.type70.value, 70);
      expect(
        InstallmentsType.type70.description,
        'Deferred special without interest. (*)',
      );
    });

    test('type72 should have correct value and description', () {
      expect(InstallmentsType.type72.value, 72);
      expect(
        InstallmentsType.type72.description,
        'Credit without interest (cte smax). (*)',
      );
    });

    test('type73 should have correct value and description', () {
      expect(InstallmentsType.type73.value, 73);
      expect(
        InstallmentsType.type73.description,
        'Special credit without interest (smax). (*)',
      );
    });

    test('type74 should have correct value and description', () {
      expect(InstallmentsType.type74.value, 74);
      expect(
        InstallmentsType.type74.description,
        'Prepay without interest (smax). (*)',
      );
    });

    test('type75 should have correct value and description', () {
      expect(InstallmentsType.type75.value, 75);
      expect(
        InstallmentsType.type75.description,
        'Deffered credit without interest (smax). (*)',
      );
    });

    test('type90 should have correct value and description', () {
      expect(InstallmentsType.type90.value, 90);
      expect(
        InstallmentsType.type90.description,
        'Without interest with months of grace (Supermaxi). (*)',
      );
    });
    test('type0 should have correct value and description', () {
      expect(InstallmentsType.type0.value, 0);
      expect(InstallmentsType.type0.description, 'Revolving credit (rotativo)');
    });
  });
}
