import 'package:equatable/equatable.dart';

class RefundRequest extends Equatable {
  const RefundRequest({
    required this.transactionID,
  });

  final String transactionID;

  Map<String, dynamic> toJson() => {
        'transaction': <String, dynamic>{
          'id': transactionID,
        },
      };

  @override
  List<Object> get props => [transactionID];
}
