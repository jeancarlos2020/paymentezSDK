import 'package:mocktail/mocktail.dart';
import 'package:paymentez_sdk/utils/paymentez_security.dart';

class MockPaymentezSecurity extends Mock implements PaymentezSecurity {
  @override
  String getAuthToken({
    required String appCode,
    required String appKey,
    int? unixtime,
  }) {
    return 'authToken';
  }

  @override
  String getSessionId({
    int? microsecondsSinceEpoch,
  }) {
    return 'sessionId';
  }
}
