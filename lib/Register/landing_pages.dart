import 'dart:async';

import 'package:flutter/material.dart';
import 'login_page.dart';

class LandingPage1 extends StatefulWidget {
  @override
  _LandingPage1State createState() => _LandingPage1State();
}

class _LandingPage1State extends State<LandingPage1> {
  @override
  void initState() {
    super.initState();
    // Timer untuk berpindah ke halaman berikutnya setelah 2 detik
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LandingPage2()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
            'Assets/logo.png',
            width: 300,
            height: 300,
          ),
          ],
        ),
      ),
    );
  }
}

class LandingPage2 extends StatelessWidget {
 @override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: const Color(0xFF9BB168),
    body: Stack(
      children: [
        // Lingkaran dekoratif di background
        Positioned(
          top: 270,
          right: 60,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          top: 70,
          right: 100,
          child: Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        Positioned(
          bottom: -70,
          left: -70,
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
          ),
        ),
        // Konten utama
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '“Life doesn’t get easier or more forgiving, '
                'we get stronger and resilient.”',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '- Steve Maraboli',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 50),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
                  },
                  child: Text('Get Started', style: TextStyle(fontFamily: 'Urbanist')),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
}
