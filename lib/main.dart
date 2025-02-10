import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
// import 'Register/landing_pages.dart';

void main() {
  runApp(MyApp());
}

final GlobalKey<HomePageState> homePageKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(key: homePageKey),
    );
  }
}
