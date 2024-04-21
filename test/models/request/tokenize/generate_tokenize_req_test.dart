import 'package:paymentez_sdk/models/request/antifraud.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/tokenize/generate_tokenize_req.dart';
import 'package:paymentez_sdk/models/request/tokenize/tokenize_configuration.dart';
import 'package:test/test.dart';

void main() {
  group(GenerateTokenizeReq, () {
    test('toJson should return a valid JSON map', () {
      const user = UserCard(
        id: '0',
        email: 'email@email.com',
      );

      const configuration = TokenizeConfiguration(
        defaultCountry: 'ec',
        requireBillingAddress: true,
      );

      const antifraud = Antifraud(
        location: 'New York',
        sessionId: '123456',
        userAgent: 'Mozilla/5.0',
      );

      const generateTokenizeReq = GenerateTokenizeReq(
        locale: 'en',
        user: user,
        configuration: configuration,
        origin: 'app',
        antifraud: antifraud,
      );

      final expectedJson = {
        'locale': 'en',
        'user': {
          'id': '0',
          'email': 'email@email.com',
        },
        'configuration': {
          'default_country': 'ec',
          'require_billing_address': true,
        },
        'origin': 'app',
        'antifraud': {
          'location': 'New York',
          'session_id': '123456',
          'user_agent': 'Mozilla/5.0',
        },
      };

      expect(generateTokenizeReq.toJson(), expectedJson);
    });

    test('fromJson should create a valid GenerateTokenizeReq object', () {
      final json = {
        'locale': 'en',
        'user': {
          'id': '0',
          'email': 'test@example.com',
        },
        'configuration': {
          'default_country': 'us',
          'require_billing_address': false,
        },
        'origin': 'web',
        'antifraud': {
          'location': 'Los Angeles',
          'session_id': '78910',
          'user_agent': 'Mozilla/5.0',
        },
      };

      final generateTokenizeReq = GenerateTokenizeReq.fromJson(json);

      expect(generateTokenizeReq.locale, 'en');
      expect(generateTokenizeReq.user.id, '0');
      expect(generateTokenizeReq.user.email, 'test@example.com');
      expect(generateTokenizeReq.configuration.defaultCountry, 'us');
      expect(generateTokenizeReq.configuration.requireBillingAddress, false);
      expect(generateTokenizeReq.origin, 'web');
      expect(generateTokenizeReq.antifraud.location, 'Los Angeles');
      expect(generateTokenizeReq.antifraud.sessionId, '78910');
      expect(generateTokenizeReq.antifraud.userAgent, 'Mozilla/5.0');
    });

    test('props should not be empty', () {
      const user = UserCard(
        id: '0',
        email: 'email@email.com',
      );

      const configuration = TokenizeConfiguration(
        defaultCountry: 'ec',
        requireBillingAddress: true,
      );

      const antifraud = Antifraud(
        location: 'New York',
        sessionId: '123456',
        userAgent: 'Mozilla/5.0',
      );

      const generateTokenizeReq = GenerateTokenizeReq(
        locale: 'en',
        user: user,
        configuration: configuration,
        origin: 'app',
        antifraud: antifraud,
      );

      final props = generateTokenizeReq.props;

      expect(props, isNotEmpty);
    });
  });
}
