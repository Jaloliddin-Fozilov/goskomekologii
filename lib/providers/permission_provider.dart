import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/animal_model.dart';
import '../models/permission_model.dart';

class PermissonProvider with ChangeNotifier {
  List<PermissionModel> _list = [];
  List<PermissionModel> _archiveList = [];
  List<PermissionModel> _currentList = [];
  List<String> _regions = [
    "Ташкентская область",
    "Ташкентская область",
  ];

  List<String> _districts = [
    "Юкоричирчикский район",
    "Янгиюльский район",
    "Уртачирчикский район",
    "Куйичирчикский район",
    "Пскентский район",
    "Паркентский район",
    "Аккурганский район",
    "Ахангаранский район",
    "Кибрайский район",
    "Чиназский район",
    "Букинский район",
    "Бостанлыкский район",
    "Бекабадский район",
    "Зангиатинский район",
  ];
  List<PermissionModel> get list {
    return [..._list];
  }

  List<PermissionModel> get currentList {
    return [..._currentList];
  }

  List<PermissionModel> get archiveList {
    return [..._archiveList];
  }

  String statusGetter(int status) {
    String newStatus;
    if (status == 2) {
      newStatus = "canceled";
    } else if (status == 1) {
      newStatus = 'done';
    } else {
      newStatus = "active";
    }
    return newStatus;
  }

  // add permission if not exist
  void addPermission(PermissionModel permission) {
    if (!_list.contains(permission)) {
      _list.add(permission);
    }
  }

  Future<void> getPermissions() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final url = Uri.parse(
          'http://u1939697.cp.regruhosting.ru/public/api/getPermissions');
      final token = prefs.getString("token");

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(url, headers: headers);

      final datas = jsonDecode(response.body);
      _list.clear();

      datas.forEach((permession) {
        List<AnimalModel> animals = [];
        permession['animals'].forEach((animal) {
          final currentAnimal = AnimalModel(
            id: animal['id'].toString(),
            name: animal['name'],
            price: double.parse(animal['price'].toString()),
            purchased: animal['minus_amount'],
            mined: animal['died'] ?? 0,
          );
          animals.add(currentAnimal);
        });
        final newPermission = PermissionModel(
          id: permession['id'],
          friendId: permession['friend_id'] ?? 0,
          title: '№${permession['number'] ?? 0}',
          qrUrl: 'assets/images/qr.png',
          status: statusGetter(permession['status'] ?? 0),
          address:
              '${_regions[permession['region_id'] ?? 0]}, ${_districts[permession['district_id'] ?? 0]}',
          startDate: permession['start_date'] ?? '',
          endDate: permession['end_date'] ?? '',
          animals: animals,
          dontSend: false,
        );
        _list.add(newPermission);
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getCurrentPermissions() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final url = Uri.parse(
          'http://u1939697.cp.regruhosting.ru/public/api/getCurrentPermissions');
      final token = prefs.getString("token");

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(url, headers: headers);

      final datas = jsonDecode(response.body);
      _currentList.clear();
      String statusGetter(int status) {
        String newStatus;
        if (status == 3) {
          newStatus = "canceled";
        } else if (status == 1) {
          newStatus = 'done';
        } else {
          newStatus = "active";
        }
        return newStatus;
      }

      datas.forEach((permession) {
        List<AnimalModel> animals = [];
        permession['animals'].forEach((animal) {
          final currentAnimal = AnimalModel(
            id: animal['id'].toString(),
            name: animal['name'],
            price: double.parse(animal['price'].toString()),
            purchased: animal['minus_amount'],
            mined: animal['died'] ?? 0,
          );
          animals.add(currentAnimal);
        });
        final newPermission = PermissionModel(
          id: permession['id'],
          friendId: permession['friend_id'] ?? 0,
          title: '№${permession['number'] ?? 0}',
          qrUrl: 'assets/images/qr.png',
          status: statusGetter(permession['status'] ?? 0),
          address:
              '${_regions[permession['region_id'] ?? 0]}, ${_districts[permession['district_id'] ?? 0]}',
          startDate: permession['start_date'] ?? '',
          endDate: permession['end_date'] ?? '',
          animals: animals,
          dontSend: false,
        );
        _currentList.add(newPermission);
        addPermission(newPermission);
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> getArchivePermissions() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final url = Uri.parse(
          'http://u1939697.cp.regruhosting.ru/public/api/getArchivePermissions');
      final token = prefs.getString("token");

      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.get(url, headers: headers);

      final datas = jsonDecode(response.body);
      print(_archiveList[0].friendId);
      _archiveList.clear();
      String statusGetter(int status) {
        String newStatus;
        if (status == 3) {
          newStatus = "canceled";
        } else if (status == 1) {
          newStatus = 'done';
        } else {
          newStatus = "active";
        }
        return newStatus;
      }

      datas.forEach((permession) {
        List<AnimalModel> animals = [];
        permession['animals'].forEach((animal) {
          final currentAnimal = AnimalModel(
            id: animal['id'].toString(),
            name: animal['name'],
            price: double.parse(animal['price'].toString()),
            purchased: animal['minus_amount'],
            mined: animal['died'] ?? 0,
          );
          animals.add(currentAnimal);
        });
        final newPermission = PermissionModel(
          id: permession['id'],
          friendId: permession['friend_id'] ?? 0,
          title: '№${permession['number'] ?? 0}',
          qrUrl: 'assets/images/qr.png',
          status: statusGetter(permession['status'] ?? 0),
          address:
              '${_regions[permession['region_id'] ?? 0]}, ${_districts[permession['district_id'] ?? 0]}',
          startDate: permession['start_date'] ?? '',
          endDate: permession['end_date'] ?? '',
          animals: animals,
          dontSend: false,
        );
        _archiveList.add(newPermission);

        addPermission(newPermission);
      });
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  void changePermissionAnimals(int permissionId, int animalId, int died) {
    final permissionIndex =
        _list.indexWhere((element) => element.id == permissionId);
    final animalIndex = _list[permissionIndex]
        .animals
        .indexWhere((animal) => int.parse(animal.id) == animalId);
    _list[permissionIndex].animals[animalIndex].mined = died;
    notifyListeners();
  }

  // update animals permission
  Future<void> updateAnimalPermissions(int permissionId) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final url = Uri.parse(
          'http://u1939697.cp.regruhosting.ru/public/api/reportPermission/$permissionId');
      final token = prefs.getString("token");
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final index =
          _list.indexWhere((permission) => permission.id == permissionId);
      print(_list[index].animals[0].mined);
      final animal = _list[index].animals;
      final body = {
        'mined[0][id]': animal.length > 0 ? animal[0].id : '0',
        'mined[0][died_amount]':
            animal.length > 0 ? animal[0].mined.toString() : '0',
        'mined[1][id]': animal.length > 1 ? animal[1].id : '0',
        'mined[1][died_amount]':
            animal.length > 1 ? animal[1].mined.toString() : '0',
        'mined[2][id]': animal.length > 2 ? animal[2].id : '0',
        'mined[2][died_amount]':
            animal.length > 2 ? animal[2].mined.toString() : '0',
        // 'mined': _list[index]
        //     .animals
        //     .map((animal) => {
        //           'id': int.parse(animal.id),
        //           'died_amount': animal.mined,
        //         })
        //     .toList()
        //     .toString(),
      };

      print(body);

      final response = await http.post(url, headers: headers, body: body);
      print('body ${jsonDecode(response.body)}');
    } catch (e) {
      print(e);
    }
  }

  Future<bool> finishPermission(int id) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      final url = Uri.parse(
          'http://u1939697.cp.regruhosting.ru/public/api/finishPermission/$id');
      final token = prefs.getString("token");

      final headers = {
        'Authorization': 'Bearer $token',
      };
      updateAnimalPermissions(id);
      final response = await http.post(url, headers: headers);
      if (response.statusCode < 300) {
        getPermissions();
        return true;
      } else {
        getPermissions();
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  PermissionModel findById(int id) {
    return _list.firstWhere((permession) => permession.id == id);
  }
}
