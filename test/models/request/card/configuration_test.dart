import 'package:paymentez_sdk/models/request/card/configuration.dart';
import 'package:test/test.dart';

void main() {
  group(
    Configuration,
    () {
      test(
        'Create Configuration',
        () async {
          const configuration = Configuration(
            defaultCountry: 'defaultCountry',
            requireBillingAddress: true,
          );

          expect(configuration.defaultCountry, 'defaultCountry');
          expect(configuration.requireBillingAddress, true);
        },
      );
      test('Serialization', () {
        const configuration = Configuration(
          defaultCountry: 'defaultCountry',
          requireBillingAddress: true,
        );

        final json = configuration.toJson();

        expect(json['default_country'], 'defaultCountry');
        expect(json['require_billing_address'], true);
      });

      test('Deserialization', () {
        final json = {
          'default_country': 'defaultCountry',
          'require_billing_address': true,
        };

        final configuration = Configuration.fromJson(json);

        expect(configuration.defaultCountry, 'defaultCountry');
        expect(configuration.requireBillingAddress, true);
      });

      test('Props', () {
        const configuration = Configuration(
          defaultCountry: 'defaultCountry',
          requireBillingAddress: true,
        );

        final props = configuration.props;

        expect(props, isNotEmpty);
      });
    },
  );
}
