import 'package:paymentez_sdk/models/request/tokenize/tokenize_configuration.dart';
import 'package:test/test.dart';

void main() {
  group(TokenizeConfiguration, () {
    test('fromJson should return a valid TokenizeConfiguration object', () {
      final json = {
        'default_country': 'US',
        'require_billing_address': true,
      };

      final configuration = TokenizeConfiguration.fromJson(json);

      expect(configuration.defaultCountry, 'US');
      expect(configuration.requireBillingAddress, true);
    });

    test('toJson should return a valid JSON object', () {
      final configuration = TokenizeConfiguration(
        defaultCountry: 'US',
        requireBillingAddress: true,
      );

      final json = configuration.toJson();

      expect(json['default_country'], 'US');
      expect(json['require_billing_address'], true);
    });
  });
}
