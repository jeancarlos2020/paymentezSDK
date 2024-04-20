import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/card_pci_request.dart';

import 'new_card_factory.dart';
import 'user_card_factory.dart';

sealed class CardPCIRequestFactory {
  static CardPCIRequest create({
    NewCard? card,
    UserCard? user,
  }) {
    return CardPCIRequest(
      card: card ?? NewCardFactory.create(),
      user: user ?? UserCardFactory.create(),
    );
  }
}
