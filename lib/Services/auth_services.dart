import 'dart:convert';

import 'package:project_android_studio/Services/globals.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  static Future<http.Response> register(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    // var url = Uri.parse(baseURL + '/auth/register');
    var url = Uri.parse(baseURL + '/register'); // Buat hp
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    // var url = Uri.parse(baseURL + '/auth/login');
    var url = Uri.parse(baseURL + '/login');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> updateData(String email, String name,
      String gender, DateTime dob, int weight, int height) async {
    Map data = {
      "email": email,
      "name": name,
      "gender": gender,
      "dob": dob.toIso8601String(),
      "weight": weight,
      "height": height
    };
    var body = json.encode(data);
    // var url = Uri.parse(baseURL + 'auth/updateData');
    var url = Uri.parse(baseURL + '/updateData');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  static Future<http.Response> result(String email, int results) async {
    Map data = {
      "email": email,
      "depression_score": results,
    };

    var body = json.encode(data);
    var url = Uri.parse(baseURL + '/resultpage');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }
}
