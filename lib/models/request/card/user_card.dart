import 'package:equatable/equatable.dart';

class UserCard extends Equatable {
  const UserCard({
    required this.id,
    required this.email,
  });

  factory UserCard.fromJson(Map<String, dynamic> json) => UserCard(
        id: json['id'] as String,
        email: json['email'] as String,
      );

  final String id;
  final String email;

  Map<String, dynamic> toJson() => {
        'id': id,
        'email': email,
      };

  @override
  List<Object> get props => [id, email];
}
