import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_android_studio/Home/appbar.dart';
import 'package:project_android_studio/Test/testpage.dart';

import '../Chatbot/chatbot.dart';
// import 'package:project_android_studio/Test/resPage.dart';
// import 'package:flutter_tester/test_heart/test_heart.dart';

class HomePage extends StatefulWidget {
  final Function(int)? onTabChanged;
  const HomePage({super.key, this.onTabChanged});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int page = 0;
  final GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  List<Widget> body = [
    const AppBarApp(),
    const ChatPage(),
    const TakePictureScreen(),
  ];
  void changeTab(int index) {
    setState(() {
      page = index;
    });

    final navBarState = _bottomNavigationKey.currentState;
    if (navBarState != null) {
      navBarState.setPage(index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        items: const [
          Icon(CupertinoIcons.home),
          Icon(CupertinoIcons.rocket),
          Icon(CupertinoIcons.square_list_fill)
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        // backgroundColor: Colors.white,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            page = index;
          });
        },
        letIndexChange: (index) => true,
      ),
      body: body[page],
    );
  }
}
