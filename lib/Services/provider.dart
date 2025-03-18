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

  Map<String, dynamic>? _userResult = {};
  Map<String, dynamic>? get userResult=> _userResult;

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
  _userData = {
    ...?_userData,  // data lama
    ...newUserData, // data baru menimpa jika ada key yang sama
  };
  notifyListeners(); // Update UI

  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString("user_data", jsonEncode(_userData));
}


  Future<List> getDepressionScores() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? userJson = prefs.getString("user_data");
  if (userJson == null) return [];

  final userData = jsonDecode(userJson);
  final email = userData['email'];

  final url = Uri.parse(baseURL + '/resultpages?email=$email');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final responseBody = response.body.trim();
    final jsonData = jsonDecode(responseBody);

    // Check if response contains "data" key and extract it
    if (jsonData is Map<String, dynamic> && jsonData.containsKey('data')) {
      List<dynamic> data = jsonData['data'];
      return data.map((item) {
        return {
          'score': item['score'],
          'date': item['date'],
        };
      }).toList();
    } else if (jsonData is List) {
      // If already an array, return it directly
      return jsonData.map((item) {
        return {
          'score': item['score'],
          'date': item['date'],
        };
      }).toList();
    } else {
      throw Exception('Invalid JSON format: $responseBody');
    }
  } else {
    throw Exception('Failed to fetch depression scores');
  }
}


}