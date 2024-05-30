import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/card_pci_request.dart';

import 'new_card_mock.dart';
import 'user_card_mock.dart';

sealed class CardPCIRequestMock {
  static CardPCIRequest create({
    NewCard? card,
    UserCard? user,
  }) {
    return CardPCIRequest(
      card: card ?? NewCardMock.create(),
      user: user ?? UserCardMock.create(),
    );
  }
}
