import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/models/request/card/new_card.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';

class CardPCIRequest extends Equatable {
  const CardPCIRequest({
    required this.user,
    required this.card,
  });

  final UserCard user;
  final NewCard card;

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'card': card.toJson(),
      };

  @override
  List<Object> get props => [user, card];
}
