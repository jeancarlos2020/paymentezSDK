import 'package:paymentez_sdk/models/request/card/new_card.dart';

sealed class NewCardFactory {
  static NewCard create({
    String? number,
    String? cvc,
    int? expiryMonth,
    int? expiryYear,
    String? type,
    String? holderName,
  }) {
    return NewCard(
      number: number ?? '4111111111111111',
      cvc: cvc ?? '123',
      expiryMonth: expiryMonth ?? 12,
      expiryYear: expiryYear ?? 25,
      holderName: holderName ?? 'John Doe',
    );
  }
}
