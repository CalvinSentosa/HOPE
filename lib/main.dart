import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
// import 'package:project_android_studio/Register/landing_pages.dart';
import 'package:project_android_studio/Services/provider.dart';
import 'package:project_android_studio/Test/resPage.dart';
// import 'package:project_android_studio/Test/resPage.dart';
import 'package:provider/provider.dart';
// import 'Register/landing_pages.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserProvider()..loadUserData()),
      ],
      child: MyApp(),
    ),
  );
}

final GlobalKey<HomePageState> homePageKey = GlobalKey();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      // home: LandingPage1(),
      home: HomePage(key: homePageKey),
      // home: DepressionResultPage(),

    );
  }
}
