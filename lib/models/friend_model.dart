class FriendModel {
  final int id;
  final String surname;
  final String firstName;
  final String patronymic;
  final String imageUrl;
  final String phone_number;
  final String hunting_ticketCode;
  final int hunting_ticketNumber;
  final String weapon_permitCode;
  final int weapon_permitNumber;

  FriendModel({
    required this.id,
    required this.surname,
    required this.firstName,
    required this.patronymic,
    required this.imageUrl,
    required this.phone_number,
    required this.hunting_ticketCode,
    required this.hunting_ticketNumber,
    required this.weapon_permitCode,
    required this.weapon_permitNumber,
  });
}
