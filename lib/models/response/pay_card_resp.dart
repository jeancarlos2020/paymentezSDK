class PayCardResp {
  PayCardResp({
    required this.bin,
    required this.expiryYear,
    required this.expiryMonth,
    required this.transactionReference,
    required this.type,
    required this.number,
    required this.origin,
    this.status,
    this.token,
  });

  factory PayCardResp.fromJson(Map<String, dynamic> json) {
    final status = json['status'] == null ? null : json['status'] as String;
    final token = json['token'] == null ? null : json['token'] as String;
    return PayCardResp(
      bin: json['bin'] as String,
      status: status,
      token: token,
      expiryYear: json['expiry_year'] as String,
      expiryMonth: json['expiry_month'] as String,
      transactionReference: json['transaction_reference'] as String,
      type: json['type'] as String,
      number: json['number'] as String,
      origin: json['origin'] as String,
    );
  }

  final String bin;
  final String? status;
  final String? token;
  final String expiryYear;
  final String expiryMonth;
  final String transactionReference;
  final String type;
  final String number;
  final String origin;

  Map<String, dynamic> toJson() => {
        'bin': bin,
        if (status != null) 'status': status,
        if (token != null) 'token': token,
        'expiry_year': expiryYear,
        'expiry_month': expiryMonth,
        'transaction_reference': transactionReference,
        'type': type,
        'number': number,
        'origin': origin,
      };
}
