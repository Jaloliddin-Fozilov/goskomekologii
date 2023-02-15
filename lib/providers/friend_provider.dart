import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/friend_model.dart';

class FriendProvider with ChangeNotifier {
  FriendModel _currentUser = FriendModel(
    id: 0,
    surname: 'Пономарев',
    firstName: 'Дмитрий',
    patronymic: 'Сергеевич',
    imageUrl: 'assets/images/friend.png',
    phone_number: '+998 99 999 99 99',
    hunting_ticketCode: 'Код',
    hunting_ticketNumber: 000,
    weapon_permitCode: 'Код',
    weapon_permitNumber: 000,
  );
  FriendModel get currentUser {
    return _currentUser;
  }

  Future<void> getProfileDetails() async {
    final url = Uri.parse('http://u1939697.cp.regruhosting.ru/public/api/user');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final phone = prefs.getString('phone');
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.get(url, headers: headers);
    if (response.statusCode < 300) {
      final profileDetails = json.decode(response.body);
      print(profileDetails);
      _currentUser = FriendModel(
        id: profileDetails['id'] ?? 0,
        surname: profileDetails['surname'] ?? '',
        firstName: profileDetails['name'] ?? '',
        patronymic: profileDetails['patronymic'] ?? '',
        imageUrl: profileDetails['image'] ?? 'assets/images/friend.png',
        phone_number: profileDetails['phone'] ?? phone,
        hunting_ticketCode: profileDetails['hunting_ticket'] ?? '',
        hunting_ticketNumber:
            int.parse(profileDetails['hunting_number'] ?? '0'),
        weapon_permitCode: profileDetails['permisssion_ticket'] ?? '',
        weapon_permitNumber:
            int.parse(profileDetails['permission_number'] ?? '0'),
      );
      notifyListeners();
    }

    notifyListeners();
  }

  // save user
  Future<void> saveProfile(FriendModel user) async {
    final url =
        Uri.parse('http://u1939697.cp.regruhosting.ru/public/api/saveProfile');

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await http.post(url, headers: headers, body: {
        'surname': user.surname,
        'name': user.firstName,
        'patronymic': user.patronymic,
        'hunting_ticket': user.hunting_ticketCode,
        'hunting_number': user.hunting_ticketNumber.toString(),
        'permission_ticket': user.weapon_permitCode,
        'permission_number': user.weapon_permitNumber.toString(),
      });
      if (response.statusCode <= 300) {
        _currentUser = user;
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  List<FriendModel> _list = [];

  List<FriendModel> get list {
    return [..._list];
  }

  // get friends
  Future<void> getFriends() async {
    final url =
        Uri.parse('http://u1939697.cp.regruhosting.ru/public/api/getFriends');
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      print(token);
      final headers = {
        'Authorization': 'Bearer $token',
      };
      final response = await http.get(url, headers: headers);
      if (response.statusCode <= 300) {
        final data = json.decode(response.body);
        _list.clear();
        data.forEach((friend) {
          _list.add(
            FriendModel(
              id: friend['id'] ?? 0,
              surname: friend['surname'] ?? '',
              firstName: friend['name'] ?? '',
              patronymic: friend['patronymic'] ?? '',
              imageUrl: 'assets/images/friend.png',
              phone_number: friend['phone'] ?? '',
              hunting_ticketCode: friend['hunting_ticket'] ?? '',
              hunting_ticketNumber: int.parse(friend['hunting_number'] ?? '0'),
              weapon_permitCode: friend['permisssion_ticket'] ?? '',
              weapon_permitNumber:
                  int.parse(friend['permission_number'] ?? '0'),
            ),
          );
        });
        notifyListeners();
      }
    } catch (e) {
      print(e);
    }
  }

  FriendModel findById(int id) {
    return _list.firstWhere((friend) => friend.id == id);
  }

  int changeTab(int index) {
    return index;
  }

  Future<void> createFriend(FriendModel friend) async {
    final url =
        Uri.parse('http://u1939697.cp.regruhosting.ru/public/api/friendCreate');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    final headers = {
      'Authorization': 'Bearer $token',
    };
    final response = await http.post(url, headers: headers, body: {
      'name': friend.firstName,
      'surname': friend.surname,
      'patronymic': friend.patronymic,
      'hunting_ticket': friend.hunting_ticketCode,
      'hunting_number': friend.hunting_ticketNumber.toString(),
      'permisssion_ticket': friend.weapon_permitCode,
      'permission_number': friend.weapon_permitNumber.toString(),
      'phone': friend.phone_number,
    });
    if (response.statusCode <= 300) {
      friend = FriendModel(
        id: jsonDecode(response.body)['friend_id'],
        surname: friend.surname,
        firstName: friend.firstName,
        patronymic: friend.patronymic,
        imageUrl: friend.imageUrl,
        phone_number: friend.phone_number,
        hunting_ticketCode: friend.hunting_ticketCode,
        hunting_ticketNumber: friend.hunting_ticketNumber,
        weapon_permitCode: friend.weapon_permitCode,
        weapon_permitNumber: friend.weapon_permitNumber,
      );

      _list.add(friend);
      notifyListeners();
    }
  }

  Future<void> updateFriend(FriendModel friend) async {
    final url = Uri.parse(
        'http://u1939697.cp.regruhosting.ru/public/api/friendEdit/${friend.id}');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    final headers = {
      'Authorization': 'Bearer $token',
    };

    final response = await http.post(url, headers: headers, body: {
      'name': friend.firstName,
      'surname': friend.surname,
      'patronymic': friend.patronymic,
      'hunting_ticket': friend.hunting_ticketCode,
      'hunting_number': friend.hunting_ticketNumber.toString(),
      'permisssion_ticket': friend.weapon_permitCode,
      'permission_number': friend.weapon_permitNumber.toString(),
      'phone': friend.phone_number,
    });
    if (response.statusCode <= 300) {
      // update friend
      final index = _list.indexWhere((friend) => friend.id == friend.id);
      _list[index] = friend;
      notifyListeners();
    }
  }

  Future<bool> updateProfilePicture(File image) async {
    final url =
        Uri.parse('http://u1939697.cp.regruhosting.ru/public/api/saveProfile');

    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token') ?? '';
      final headers = {
        'Authorization': 'Bearer $token',
      };
      FriendModel _user = FriendModel(
        id: _currentUser.id,
        surname: _currentUser.surname,
        firstName: _currentUser.firstName,
        patronymic: _currentUser.patronymic,
        imageUrl: image.path,
        phone_number: _currentUser.phone_number,
        hunting_ticketCode: _currentUser.hunting_ticketCode,
        hunting_ticketNumber: _currentUser.hunting_ticketNumber,
        weapon_permitCode: _currentUser.weapon_permitCode,
        weapon_permitNumber: _currentUser.weapon_permitNumber,
      );
      final response = await http.post(url, headers: headers, body: {
        'surname': _currentUser.surname,
        'name': _currentUser.firstName,
        'patronymic': _currentUser.patronymic,
        'hunting_ticket': _currentUser.hunting_ticketCode,
        'hunting_number': _currentUser.hunting_ticketNumber.toString(),
        'permission_ticket': _currentUser.weapon_permitCode,
        'permission_number': _currentUser.weapon_permitNumber.toString(),
        'image': image,
      });
      if (response.statusCode <= 300) {
        notifyListeners();
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
