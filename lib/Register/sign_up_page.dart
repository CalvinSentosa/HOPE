import 'dart:convert';
import 'package:flutter/material.dart';
import 'login_page.dart';
import 'package:project_android_studio/Services/auth_services.dart';
import 'package:project_android_studio/Services/globals.dart';
import 'package:http/http.dart' as http;

class SignUpPage extends StatelessWidget {
  String _email = '';
  String _password = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    createAccountPressed() async {
      bool emailValid = true;
      if (emailValid) {
        _email = emailController.text;
        _password = passwordController.text;
        http.Response response = await AuthServices.register(_email, _password);
        Map responseMap = jsonDecode(response.body);
        if (response.statusCode == 200) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => LoginPage(),
              ));
        } else {
          errorSnackBar(context, responseMap.values.first[0]);
        }
      } else {
        errorSnackBar(context, 'email not valid');
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Image
              Positioned(
                top: 0, // Mengatur jarak gambar dari atas
                left: 0, // Mengatur jarak gambar dari kiri
                right: 0, // Mengatur gambar agar sejajar dengan kanan
                child: Align(
                  alignment:
                      Alignment.topCenter, // Posisi gambar di tengah atas
                  child: Stack(
                    clipBehavior:
                        Clip.none, // Agar gambar tidak terpotong oleh container
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
                        top:
                            0, // Gambar lebih ke atas agar tampak di atas setengah lingkaran
                        left: 50,
                        child: Image.asset(
                          'assets/logo_gambar.png',
                          width: 250,
                          height: 250,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(height: 16),
                    Text(
                      "Sign Up For Free",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.brown,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),

              // Email Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email Address",
                  hintText: "Enter your email...",
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
                    borderSide: BorderSide(
                        color: Colors.green, width: 4), // Hijau ketika fokus
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Enter your password...",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons
                      .visibility_off), // Tambahkan logika toggle jika diperlukan
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Mengatur warna border ketika fokus
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green, width: 4), // Hijau ketika fokus
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Confirm Password Field
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password Confirmation",
                  hintText: "Confirm your password...",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons
                      .visibility_off), // Tambahkan logika toggle jika diperlukan
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // Mengatur warna border ketika fokus
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.green, width: 4), // Hijau ketika fokus
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 32),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Logika registrasi di sini
                    createAccountPressed();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Footer
              SizedBox(height: 16),
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Navigasi ke halaman Sign In
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "Already have an account? Sign In.",
                    style: TextStyle(
                      color: Colors.orange,
                      fontFamily: 'Urbanist',
                    ),
                  ),
                ),
              ),
            ],
          ),
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
