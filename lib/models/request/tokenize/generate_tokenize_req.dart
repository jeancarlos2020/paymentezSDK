import 'package:equatable/equatable.dart';
import 'package:paymentez_sdk/models/request/antifraud.dart';
import 'package:paymentez_sdk/models/request/card/user_card.dart';
import 'package:paymentez_sdk/models/request/tokenize/tokenize_configuration.dart';
import 'package:paymentez_sdk/utils/utils.dart';

class GenerateTokenizeReq extends Equatable {
  const GenerateTokenizeReq({
    required this.locale,
    required this.user,
    required this.configuration,
    required this.origin,
    required this.antifraud,
  });

  factory GenerateTokenizeReq.fromJson(Map<String, dynamic> json) =>
      GenerateTokenizeReq(
        locale: json['locale'] as String,
        user: UserCard.fromJson(json.getMap('user')),
        configuration:
            TokenizeConfiguration.fromJson(json.getMap('configuration')),
        origin: json['origin'] as String,
        antifraud: Antifraud.fromJson(json.getMap('antifraud')),
      );

  final String locale;
  final UserCard user;
  final TokenizeConfiguration configuration;
  final String origin;
  final Antifraud antifraud;

  Map<String, dynamic> toJson() => {
        'locale': locale,
        'user': user.toJson(),
        'configuration': configuration.toJson(),
        'origin': origin,
        'antifraud': antifraud.toJson(),
      };

  @override
  List<Object> get props {
    return [
      locale,
      user,
      configuration,
      origin,
      antifraud,
    ];
  }
}
