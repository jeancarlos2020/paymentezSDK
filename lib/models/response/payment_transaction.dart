import 'package:paymentez_sdk/utils/utils.dart';

class PaymentTransaction {
  PaymentTransaction({
    required this.status,
    required this.lotNumber,
    required this.authorizationCode,
    required this.statusDetail,
    required this.message,
    required this.id,
    required this.paymentDate,
    required this.paymentMethodType,
    required this.devReference,
    required this.carrierCode,
    required this.productDescription,
    required this.currentStatus,
    required this.amount,
    required this.carrier,
    required this.installments,
    required this.traceNumber,
    required this.installmentsType,
  });

  factory PaymentTransaction.fromJson(Map<String, dynamic> json) =>
      PaymentTransaction(
        status: json['status'] as String,
        lotNumber: json['lot_number'] as String,
        authorizationCode: json['authorization_code'] as String,
        statusDetail: json.getInt('status_detail'),
        message: json['message'] as String,
        id: json['id'] as String,
        paymentDate: json.getDateTime('payment_date'),
        paymentMethodType: json['payment_method_type'] as String,
        devReference: json['dev_reference'] as String,
        carrierCode: json['carrier_code'] as String,
        productDescription: json['product_description'] as String,
        currentStatus: json['current_status'] as String,
        amount: json.getInt('amount'),
        carrier: json['carrier'] as String,
        installments: json.getInt('installments'),
        traceNumber: json['trace_number'] as String,
        installmentsType: json['installments_type'] as String,
      );

  final String status;
  final String lotNumber;
  final String authorizationCode;
  final int statusDetail;
  final String message;
  final String id;
  final DateTime paymentDate;
  final String paymentMethodType;
  final String devReference;
  final String carrierCode;
  final String productDescription;
  final String currentStatus;
  final int amount;
  final String carrier;
  final int installments;
  final String traceNumber;
  final String installmentsType;

  Map<String, dynamic> toJson() => {
        'status': status,
        'lot_number': lotNumber,
        'authorization_code': authorizationCode,
        'status_detail': statusDetail,
        'message': message,
        'id': id,
        'payment_date': paymentDate.toIso8601String(),
        'payment_method_type': paymentMethodType,
        'dev_reference': devReference,
        'carrier_code': carrierCode,
        'product_description': productDescription,
        'current_status': currentStatus,
        'amount': amount,
        'carrier': carrier,
        'installments': installments,
        'trace_number': traceNumber,
        'installments_type': installmentsType,
      };
}
