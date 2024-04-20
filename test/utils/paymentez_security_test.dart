import 'package:paymentez_sdk/utils/paymentez_security.dart';
import 'package:test/test.dart';

void main() {
  group(PaymentezSecurity, () {
    test('getAuthToken should return a valid auth token', () {
      const appCode = 'your_app_code';
      const appKey = 'your_app_key';
      const unixtime = 1634567890; // Replace with your desired unixtime

      final authToken = const PaymentezSecurity().getAuthToken(
        appCode: appCode,
        appKey: appKey,
        unixtime: unixtime,
      );

      // Add your assertions here to validate the generated auth token
      expect(authToken, isNotEmpty);
      // Add more assertions as needed
    });

    test('getSessionId should return a valid session ID', () {
      final sessionId = const PaymentezSecurity().getSessionId();

      // Add your assertions here to validate the generated session ID
      expect(sessionId, isNotEmpty);
      // Add more assertions as needed
    });
  });
}
