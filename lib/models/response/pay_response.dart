import 'package:paymentez_sdk/models/response/pay_card_resp.dart';
import 'package:paymentez_sdk/models/response/payment_transaction.dart';
import 'package:paymentez_sdk/utils/utils.dart';

class PayResponse {
  PayResponse({
    required this.transaction,
    required this.card,
  });

  factory PayResponse.fromJson(Map<String, dynamic> json) => PayResponse(
        transaction: PaymentTransaction.fromJson(json.getMap('transaction')),
        card: PayCardResp.fromJson(json.getMap('card')),
      );

  PaymentTransaction transaction;
  PayCardResp card;

  Map<String, dynamic> toJson() => {
        'transaction': transaction.toJson(),
        'card': card.toJson(),
      };
}
