import 'package:goskomekologii/models/animal_model.dart';
import 'package:flutter/material.dart';

class CheckoutModel {
  final int regionId;
  final int districtId;
  final DateTime startDate;
  final DateTime endDate;
  final int type;
  final int status;
  final double price;
  final List<AnimalModel> animals;
  int friendId;

  CheckoutModel({
    required this.regionId,
    required this.districtId,
    required this.startDate,
    required this.endDate,
    required this.type,
    required this.status,
    required this.price,
    required this.animals,
    this.friendId = 0,
  });
}
