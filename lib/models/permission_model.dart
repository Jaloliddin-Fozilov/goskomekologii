import 'animal_model.dart';

class PermissionModel {
  final int id;
  final String title;
  final String qrUrl;
  final String status;
  final String address;
  final DateTime startDate;
  final DateTime endDate;
  final List<AnimalModel> animals;
  final String hunting_ticket;
  final String weapon_permit;
  final bool dontSend;

  PermissionModel({
    required this.id,
    required this.title,
    required this.qrUrl,
    required this.status,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.animals,
    required this.hunting_ticket,
    required this.weapon_permit,
    required this.dontSend,
  });
}
