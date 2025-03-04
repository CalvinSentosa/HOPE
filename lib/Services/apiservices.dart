import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:project_android_studio/Models/item.dart';

class ApiService {
  // final String baseURL = "http://172.17.0.1:8000/api"; //docker localhost
// final String baseURL = "https://763b-182-2-142-170.ngrok-free.app/api"; // Bisa diakses dari HP
//final String baseURL = "http://127.0.0.1:8000/api/"; //chrome localhost
  final String baseURL = "http://10.0.2.2:8000/api"; //emulator localhost

  Future<List<Item>> fetchItems() async {
    final response = await http.get(Uri.parse('$baseURL/items'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      return data.map((item) => Item.fromJson(item)).toList();
    } else {
      throw Exception("Gagal mengambil data");
    }
  }
}
