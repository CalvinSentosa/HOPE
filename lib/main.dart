import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
<<<<<<< HEAD
// import 'Register/landing_pages.dart';
=======
import 'Register/landing_pages.dart';
>>>>>>> c5153ba5624ffa05bb14416329be7f803aeefc6d

void main() {
  runApp(MyApp());
}

final GlobalKey<HomePageState> homePageKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Helo");
    print(DefaultTextStyle.of(context).style.fontFamily);
<<<<<<< HEAD
    print("Helo");
    print(DefaultTextStyle.of(context).style.fontFamily);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(key: homePageKey),
=======
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: LandingPage1(),
>>>>>>> c5153ba5624ffa05bb14416329be7f803aeefc6d
    );
  }
}
