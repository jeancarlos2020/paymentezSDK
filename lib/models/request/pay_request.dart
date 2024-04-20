import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/models/request/pay/card_token.dart';
import 'package:paymentez_sdk/models/request/pay/order_pay.dart';
import 'package:paymentez_sdk/models/request/pay/user_pay.dart';

class PayRequest extends Equatable {
  const PayRequest({
    required this.user,
    required this.order,
    required this.card,
  });

  final UserPay user;
  final OrderPay order;
  final CardToken card;

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'order': order.toJson(),
        'card': card.toJson(),
      };

  @override
  List<Object> get props => [
        user,
        order,
        card,
      ];
}
