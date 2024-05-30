import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/models/request/pay/installments_type.dart';

class OrderPay extends Equatable {
  const OrderPay({
    required this.taxPercentage,
    required this.taxableAmount,
    required this.vat,
    required this.amount,
    required this.description,
    required this.devReference,
    this.installments,
    this.installmentsType,
  });

  final int taxPercentage;
  final double taxableAmount;
  final double vat;
  final double amount;
  final String description;
  final int? installments;
  final InstallmentsType? installmentsType;
  final String devReference;

  Map<String, dynamic> toJson() => {
        'tax_percentage': taxPercentage,
        'taxable_amount': taxableAmount,
        'vat': vat,
        'amount': amount,
        'description': description,
        if (installments != null) 'installments': installments,
        if (installmentsType != null)
          'installments_type': installmentsType!.value,
        'dev_reference': devReference,
      };

  @override
  List<Object?> get props {
    return [
      taxPercentage,
      taxableAmount,
      vat,
      amount,
      description,
      installments,
      installmentsType,
      devReference,
    ];
  }
}
