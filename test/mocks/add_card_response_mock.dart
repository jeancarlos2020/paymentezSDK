import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/response/add_card_response.dart';

sealed class AddCardResponseMock {
  static AddCardResponse create({
    NewCard? card,
    UserCard? user,
  }) {
    return AddCardResponse(
      tokenizeURL: 'https://www.host.com/form',
    );
  }
}
