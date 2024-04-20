import 'package:paymentez_sdk/models/request/card/user_card.dart';

sealed class UserCardFactory {
  static UserCard create({
    String? id,
    String? email,
  }) {
    return UserCard(
      id: id ?? 'id_mock',
      email: email ?? 'email@mock.com',
    );
  }
}
