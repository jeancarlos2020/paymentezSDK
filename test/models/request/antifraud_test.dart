import 'package:paymentez_sdk/models/request/antifraud.dart';
import 'package:test/test.dart';

void main() {
  group(Antifraud, () {
    test('fromJson should return a valid Antifraud instance', () {
      final json = {
        'session_id': '123456',
        'location': 'New York',
        'user_agent': 'Mozilla/5.0',
      };

      final antifraud = Antifraud.fromJson(json);

      expect(antifraud.sessionId, '123456');
      expect(antifraud.location, 'New York');
      expect(antifraud.userAgent, 'Mozilla/5.0');
    });

    test('toJson should return a valid JSON map', () {
      const antifraud = Antifraud(
        sessionId: '123456',
        location: 'New York',
        userAgent: 'Mozilla/5.0',
      );

      final json = antifraud.toJson();

      expect(json['session_id'], '123456');
      expect(json['location'], 'New York');
      expect(json['user_agent'], 'Mozilla/5.0');
    });

    test('props should not be empty', () {
      const antifraud = Antifraud(
        sessionId: '123456',
        location: 'New York',
        userAgent: 'Mozilla/5.0',
      );

      final props = antifraud.props;

      expect(props, isNotEmpty);
    });
  });
}
