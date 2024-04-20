import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/models/request/pay/card_pci.dart';
import 'package:paymentez_sdk/models/request/pay/order_pay.dart';
import 'package:paymentez_sdk/models/request/pay/user_pay.dart';

class PayPCIRequest extends Equatable {
  const PayPCIRequest({
    required this.user,
    required this.order,
    required this.card,
  });

  final UserPay user;
  final OrderPay order;
  final CardPCI card;

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
