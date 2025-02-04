import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
import 'Register/landing_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Helo");
    print(DefaultTextStyle.of(context).style.fontFamily);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: LandingPage1(),
    );
  }
}
