import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// const String baseURL = "https://763b-182-2-142-170.ngrok-free.app/api"; // Bisa diakses dari HP
//const String baseURL = "http://127.0.0.1:8000/api/"; //chrome localhost
const String baseURL = "http://10.0.2.2:8000/api/"; //emulator localhost
const Map<String, String> headers = {
  "Content-Type": "application/json",
  "Accept": "application/json"
};

errorSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.red,
    content: Text(text),
    duration: const Duration(seconds: 1),
  ));
}
