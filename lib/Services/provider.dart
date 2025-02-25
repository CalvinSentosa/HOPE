import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier {
  Map<String, dynamic>? _userData = {}; //pake {} biar gak null

  Map<String, dynamic>? get userData => _userData;

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("user_data");
    if (userJson != null) {
      _userData = jsonDecode(userJson);
      notifyListeners(); // Memberi tahu UI untuk update
    }
  }

  Future<void> setUserData(Map<String, dynamic> newUserData) async {
    _userData = newUserData;
    notifyListeners(); // Update UI

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_data", jsonEncode(newUserData));
  }
}
