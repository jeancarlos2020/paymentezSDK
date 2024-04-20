import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';

class CardPCIRequest {
  CardPCIRequest({
    required this.user,
    required this.card,
  });

  UserCard user;
  NewCard card;

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'card': card.toJson(),
      };
}
