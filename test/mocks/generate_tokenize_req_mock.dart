import 'package:paymentez_sdk/models/request/antifraud.dart';
import 'package:paymentez_sdk/models/request/card_request.dart';
import 'package:paymentez_sdk/models/request/tokenize/generate_tokenize_req.dart';
import 'package:paymentez_sdk/models/request/tokenize/tokenize_configuration.dart';
import 'package:paymentez_sdk/utils/utils.dart';

import 'card_request_mock.dart';

sealed class GenerateTokenizeReqMock {
  static GenerateTokenizeReq create({
    CardRequest? card,
    String? defaultCountry,
    String? origin,
    String? host,
    int? unixtime,
  }) {
    final cardRequest = card ?? CardRequestMock.create();

    return GenerateTokenizeReq(
      locale: cardRequest.locale,
      user: cardRequest.user,
      configuration: TokenizeConfiguration(
        defaultCountry: defaultCountry ?? 'ECU',
        requireBillingAddress: cardRequest.requireBillingAddress,
      ),
      origin: origin ?? 'SDK_JS',
      antifraud: Antifraud(
        sessionId: PaymentezSecurity.getSessionId(unixtime: unixtime),
        location: host ?? 'https://ccapi-stg.paymentez.com',
        userAgent: const UtilsBrowser().getUserAgent(cardRequest.userAgent),
      ),
    );
  }
}
