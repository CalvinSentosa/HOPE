import 'package:flutter/material.dart';
import 'sign_up_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F5F5),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SizedBox(height: 200), // Memberikan ruang di atas untuk gambar
                  Text(
                    "Sign In To HOPE",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Urbanist',
                      color: Color(0xFF4F3422)
                    ),
                  ),
                  SizedBox(height: 24),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // Mengatur warna border ketika fokus
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4), // Hijau ketika fokus
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.visibility_off),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // Mengatur warna border ketika tidak fokus
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // Mengatur warna border ketika fokus
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green, width: 4), // Hijau ketika fokus
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // Menyesuaikan gaya label ketika fokus
                      labelStyle: TextStyle(
                        color: Colors.grey, // Warna default label
                      ),
                      // Menambahkan perubahan warna label ketika fokus
                      // focusedLabelStyle: TextStyle(
                      //   color: Colors.green, // Warna label saat fokus
                      // ),
                    ),
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Aksi login
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          // Login dengan Facebook
                        },
                        icon: Icon(Icons.facebook),
                      ),
                      IconButton(
                        onPressed: () {
                          // Login dengan Google
                        },
                        icon: Icon(Icons.g_mobiledata),
                      ),
                      IconButton(
                        onPressed: () {
                          // Login dengan Instagram
                        },
                        icon: Icon(Icons.camera_alt),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman Sign Up
                      Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    child: Text(
                      "Don't have an account? Sign Up.",
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Navigasi ke halaman Forgot Password
                    },
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Colors.orange,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: -10, // Mengatur jarak gambar dari atas
              left: 0, // Mengatur jarak gambar dari kiri
              right: 0, // Mengatur gambar agar sejajar dengan kanan
              child: Align(
                alignment: Alignment.topCenter, // Posisi gambar di tengah atas
                child: Stack(
                  clipBehavior: Clip.none, // Agar gambar tidak terpotong oleh container
                  children: [
                    // Setengah lingkaran sebagai hiasan
                    ClipPath(
                      clipper: OvalClipper(),
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: const Color(0xFF9BB168), // Green background
                        ),
                      ),
                    ),

                    // Gambar logo
                    Positioned(
                      top: 0, // Gambar lebih ke atas agar tampak di atas setengah lingkaran
                      left: 80,
                      child: Image.asset(
                        'Assets/logo_gambar.png',
                        width: 250,
                        height: 250,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OvalClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 100); // Adjust the height of the curve
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; // Return true if the path needs to be redrawn
  }
}
