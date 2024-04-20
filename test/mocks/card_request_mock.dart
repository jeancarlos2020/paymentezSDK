import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/card_request.dart';

import 'user_card_mock.dart';

sealed class CardRequestMock {
  static CardRequest create({
    UserCard? user,
    String? locale,
    bool? requireBillingAddress,
    String? userAgent = '',
  }) {
    return CardRequest(
      user: user ?? UserCardMock.create(),
      locale: locale ?? 'es',
      requireBillingAddress: requireBillingAddress ?? false,
      userAgent: userAgent,
    );
  }
}
