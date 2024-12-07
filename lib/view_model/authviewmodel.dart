import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authviewmodel extends ChangeNotifier {
  String? token;

  Authviewmodel() {
    _loadToken();
  }

  Future<void> _loadToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    try {
      var response = await http.post(Uri.parse('https://reqres.in/api/login'),
          body: {"email": email, "password": password});

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data != null) {
          token = data['token'];
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token ?? '');
          notifyListeners();
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');
    token = null;
    notifyListeners();
  }
}
