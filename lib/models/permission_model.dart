import 'animal_model.dart';

class PermissionModel {
  final int id;
  final int friendId;
  final String title;
  final String qrUrl;
  final String status;
  final String address;
  final String startDate;
  final String endDate;
  final List<AnimalModel> animals;
  final bool dontSend;

  PermissionModel({
    required this.id,
    required this.friendId,
    required this.title,
    required this.qrUrl,
    required this.status,
    required this.address,
    required this.startDate,
    required this.endDate,
    required this.animals,
    required this.dontSend,
  });
}
