import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_android_studio/Services/apiservices.dart';
import 'package:shared_preferences/shared_preferences.dart';

// const String baseURL = "http://172.17.0.1:8000/api"; //docker localhost
// const String baseURL = "https://763b-182-2-142-170.ngrok-free.app/api"; // Bisa diakses dari HP
// const String baseURL = "http://127.0.0.1:8000/api"; //chrome localhost
const String baseURL = "http://10.0.2.2:8000/api"; //emulator localhost
// const String baseURL = "http://192.168.104.103:8000/api";

class UserProvider with ChangeNotifier {
  Map<String, dynamic>? _userData = {}; //pake {} biar gak null

  Map<String, dynamic>? get userData => _userData;

  UserProvider() {
    loadUserData();
  }

  Future<void> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userJson = prefs.getString("user_data");
    if (userJson != null) {
      _userData = jsonDecode(userJson);
      // _userData = (await ApiService().fetchItems()) as Map<String, dynamic>?;
      notifyListeners(); // Memberi tahu UI untuk update
    }
  }

  Future<void> setUserData(Map<String, dynamic> newUserData) async {
    _userData = newUserData;
    notifyListeners(); // Update UI

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_data", jsonEncode(newUserData));
  }

  Future<List<Map<String, dynamic>>> getDepressionScores() async {
  try {
    final email = _userData?['email'];
    if (email == null) throw Exception("Email tidak ditemukan");

    final response = await http.get(Uri.parse('$baseURL/depression_scores?email=$email'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map<Map<String, dynamic>>((item) => {
        'score': item['score'],
        'date': item['date'],
      }).toList();
    } else {
      throw Exception("Gagal mengambil skor");
    }
  } catch (e, stacktrace) {
    debugPrint("Error di getDepressionScores: $e");
    debugPrint("Stacktrace: $stacktrace");
    rethrow;
  }
}


}
