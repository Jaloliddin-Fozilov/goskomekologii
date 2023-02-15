import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goskomekologii/models/animal_model.dart';
import 'package:goskomekologii/models/checkout_model.dart';
import 'package:goskomekologii/services/update_all_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CheckoutProvider extends ChangeNotifier {
  List<String> _regions = [
    "Ташкентская область",
  ];

  List<String> get regions => [..._regions];

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

  List<String> get districts => [..._districts];

  CheckoutModel _currentCheckout = CheckoutModel(
    regionId: 0,
    districtId: 0,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    type: 0,
    status: 0,
    price: 0,
    friendId: 0,
    animals: [
      AnimalModel(
        id: '0',
        name: 'Перепел',
        count: 653,
        price: 2344,
        input: 0,
      ),
      AnimalModel(
        id: '1',
        name: 'Утки',
        count: 4812,
        price: 2344,
        input: 0,
      ),
      AnimalModel(
        id: '2',
        name: 'Гуси',
        count: 1983,
        price: 8028,
        input: 0,
      ),
    ],
  );

  get currentCheckout => _currentCheckout;

  void updateCheckout(CheckoutModel newCheckout) {
    _currentCheckout = newCheckout;

    notifyListeners();
  }

  int getCount() {
    int currentCount = 0;
    _currentCheckout.animals.forEach((animal) {
      currentCount = currentCount + animal.input!;
    });
    return currentCount;
  }

  double get getPrice {
    double currentPrice = 0;
    _currentCheckout.animals.forEach((animal) {
      currentPrice = currentPrice + (animal.price! * animal.input!);
    });
    return currentPrice;
  }

  Future<bool> createPermission() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final url = Uri.parse(
          'http://u1939697.cp.regruhosting.ru/public/api/permissionCreate');
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final animal = _currentCheckout.animals;

      animal.forEach((element) {
        print(element.name);
      });

      final response = await http.post(url, headers: headers, body: {
        'friend_id': _currentCheckout.friendId.toString(),
        "region_id": _currentCheckout.regionId.toString(),
        "district_id": _currentCheckout.districtId.toString(),
        "start_date":
            "${_currentCheckout.startDate.day}.${_currentCheckout.startDate.month}.${_currentCheckout.startDate.year}",
        "end_date":
            "${_currentCheckout.endDate.day}.${_currentCheckout.endDate.month}.${_currentCheckout.endDate.year}",
        "type": _currentCheckout.type.toString(),
        "status": _currentCheckout.status.toString(),
        "price": "$getPrice",
        'animals[0][id]': animal.isNotEmpty ? animal[0].id : '0',
        'animals[0][minus_amount]':
            animal.isNotEmpty ? animal[0].input.toString() : '0',
        'animals[1][id]': animal.length > 1 ? animal[1].id : '0',
        'animals[1][minus_amount]':
            animal.length > 1 ? animal[1].input.toString() : '0',
        'animals[2][id]': animal.length > 2 ? animal[2].id : '0',
        'animals[2][minus_amount]':
            animal.length > 2 ? animal[2].input.toString() : '0',
        'animals[3][id]': animal.length > 3 ? animal[3].id : '0',
        'animals[3][minus_amount]':
            animal.length > 3 ? animal[3].input.toString() : '0',
        // _currentCheckout.animals
        //     .map((animal) => {
        //           'id': int.parse(animal.id),
        //           'minus_amount': animal.input,
        //         })
        //     .toList()
        //     .toString(),
      });
      print(response.body);
      return response.statusCode < 300 ? true : false;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
