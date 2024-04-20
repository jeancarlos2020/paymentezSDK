import 'package:equatable/equatable.dart';

class CardToken extends Equatable {
  const CardToken({
    required this.token,
  });

  final String token;

  Map<String, dynamic> toJson() => {
        'token': token,
      };

  @override
  List<Object> get props => [token];
}
