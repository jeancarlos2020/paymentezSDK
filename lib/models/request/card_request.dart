import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';

class CardRequest extends Equatable {
  const CardRequest({
    required this.user,
    required this.locale,
    required this.requireBillingAddress,
    this.userAgent,
  });

  final UserCard user;
  final String locale;
  final bool requireBillingAddress;
  final String? userAgent;

  Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'locale': locale,
        'requireBillingAddress': requireBillingAddress,
        if (userAgent != null) 'userAgent': userAgent,
      };

  @override
  List<Object?> get props => [
        user,
        locale,
        requireBillingAddress,
        userAgent,
      ];
}
