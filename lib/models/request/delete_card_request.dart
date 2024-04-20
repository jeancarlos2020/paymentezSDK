import 'package:equatable/equatable.dart';

class DeleteCardRequest extends Equatable {
  const DeleteCardRequest({
    required this.cardToken,
    required this.userId,
  });

  final String cardToken;
  final String userId;

  Map<String, dynamic> toJson() => {
        'card': <String, dynamic>{
          'token': cardToken,
        },
        'user': <String, dynamic>{
          'id': userId,
        },
      };

  @override
  List<Object> get props => [cardToken, userId];
}
