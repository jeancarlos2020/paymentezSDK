import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/utils/utils.dart';

class Configuration extends Equatable {
  const Configuration({
    required this.defaultCountry,
    required this.requireBillingAddress,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) => Configuration(
        defaultCountry: json['default_country'] as String,
        requireBillingAddress: json.getBool('require_billing_address'),
      );

  final String defaultCountry;
  final bool requireBillingAddress;

  Map<String, dynamic> toJson() => {
        'default_country': defaultCountry,
        'require_billing_address': requireBillingAddress,
      };

  @override
  List<Object> get props => [defaultCountry, requireBillingAddress];
}
