import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:goskomekologii/models/friend_model.dart';
import 'package:goskomekologii/providers/friend_provider.dart';
import 'package:goskomekologii/services/update_all_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String _token = '';
  String _phoneNumber = '';

  void getLocalToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token') ?? '';
    _phoneNumber = prefs.getString('phone') ?? '';
    notifyListeners();
  }

  String get getToken {
    return _token;
  }

  String get getPhoneNumber {
    return _phoneNumber;
  }

  Future<bool> authWithPhone(String phone, BuildContext context) async {
    final url = Uri.parse('http://u1939697.cp.regruhosting.ru/public/api/auth');

    try {
      final response = await http.post(url, body: {'phone': phone});
      if (response.statusCode <= 300) {
        _token = jsonDecode(response.body)['token'];
        final profileDetails = jsonDecode(response.body)['user'];

        _phoneNumber = phone;
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', _token);
        prefs.setString('phone', phone);
        prefs.setInt('currentUserId', profileDetails['id'] ?? 0);
        await updateAllData(context);
        notifyListeners();
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }
}
