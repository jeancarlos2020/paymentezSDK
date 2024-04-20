import 'package:paymentez_sdk/models/request/antifraud.dart';
import 'package:paymentez_sdk/models/request/card_request.dart';
import 'package:paymentez_sdk/models/request/tokenize/generate_tokenize_req.dart';
import 'package:paymentez_sdk/models/request/tokenize/tokenize_configuration.dart';
import 'package:paymentez_sdk/utils/utils_browser.dart';

import '../mocks/mock_paymentez_security.dart';
import 'card_request_factory.dart';

sealed class GenerateTokenizeReqFactory {
  static GenerateTokenizeReq create({
    CardRequest? card,
    String? defaultCountry,
    String? origin,
    String? host,
  }) {
    final cardRequest = card ?? CardRequestFactory.create();

    final securityMock = MockPaymentezSecurity();

    return GenerateTokenizeReq(
      locale: cardRequest.locale,
      user: cardRequest.user,
      configuration: TokenizeConfiguration(
        defaultCountry: defaultCountry ?? 'ECU',
        requireBillingAddress: cardRequest.requireBillingAddress,
      ),
      origin: origin ?? 'SDK_JS',
      antifraud: Antifraud(
        sessionId: securityMock.getSessionId(),
        location: Uri.https(host ?? 'ccapi-stg.paymentez.com').toString(),
        userAgent: UtilsBrowser.getUserAgent(cardRequest.userAgent),
      ),
    );
  }
}
