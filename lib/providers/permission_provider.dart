import 'package:flutter/material.dart';

import '../models/animal_model.dart';
import '../models/permission_model.dart';

class PermissonProvider with ChangeNotifier {
  List<PermissionModel> _list = [
    PermissionModel(
      id: 0,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'canceled',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: false,
    ),
    PermissionModel(
      id: 1,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'active',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: true,
    ),
    PermissionModel(
      id: 2,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'done',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: false,
    ),
    PermissionModel(
      id: 3,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'active',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: false,
    ),
    PermissionModel(
      id: 4,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'done',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: false,
    ),
    PermissionModel(
      id: 5,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'done',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: false,
    ),
    PermissionModel(
      id: 6,
      title: '№025-015/22',
      qrUrl: 'assets/images/qr.png',
      status: 'done',
      address: 'Ташкентская обл., Пскентский р-н',
      startDate: DateTime(2022, 09, 26),
      endDate: DateTime(2022, 09, 30),
      animals: [
        AnimalModel(id: '0', name: 'Перепел', purchased: 10, mined: 2),
        AnimalModel(id: '1', name: 'Утки', purchased: 5, mined: 0),
        AnimalModel(id: '2', name: 'Гуси', purchased: 12, mined: 2),
      ],
      hunting_ticket: 'Ю-144',
      weapon_permit: 'П-6',
      dontSend: false,
    ),
  ];

  List<PermissionModel> get list {
    return [..._list];
  }

  List<PermissionModel> get currentList {
    List<PermissionModel> currentList = [];
    _list.forEach((permession) {
      return permession.status == 'active' ? currentList.add(permession) : null;
    });
    return [...currentList];
  }

  PermissionModel findById(int id) {
    return _list.firstWhere((permession) => permession.id == id);
  }
}
