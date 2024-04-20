class NewCard {
  NewCard({
    required this.number,
    required this.holderName,
    required this.expiryMonth,
    required this.expiryYear,
    required this.cvc,
  });

  String number;
  String holderName;
  int expiryMonth;
  int expiryYear;
  String cvc;

  Map<String, dynamic> toJson() => {
        'number': number,
        'holder_name': holderName,
        'expiry_month': expiryMonth,
        'expiry_year': expiryYear,
        'cvc': cvc,
      };
}
