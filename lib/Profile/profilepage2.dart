import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_application_1/screens/profilepage.dart';
import 'package:project_android_studio/Profile/camera.dart';
import 'package:project_android_studio/Services/auth_services.dart';
import 'package:project_android_studio/Services/globals.dart';
import 'package:intl/intl.dart';


class ProfilePage2 extends StatelessWidget {
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 16), // Move to the right by 16 pixels
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context); // Navigate back to the previous screen
            },
            child: Container(
              width: 40, // Diameter of the circle
              height: 40, // Diameter of the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Fill the circle with white
                border:
                    Border.all(color: Colors.white, width: 1), // Circle border
              ),
              child: const Icon(Icons.arrow_back,
                  color: Colors.black, size: 20), // Back arrow icon
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header with background and profile picture
            Stack(
              children: [
                ClipPath(
                  clipper: OvalClipper(),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ),
                Positioned(
                  top: 150,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(
                            0), // Adjust padding to control border thickness
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.white, // Border color
                            width: 4, // Border width
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.blue,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 37,
                        child: Container(
                          padding: EdgeInsets.all(
                              0), // Adjust padding to control border thickness
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.black, // Border color
                              width: 0.5, // Border width
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 17,
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: Icon(Icons.camera_alt,
                                  size: 16, color: Colors.black),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CameraApp()),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 60),
            // Input Fields
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileInputField(
                    label: "Full Name",
                    icon: Icons.person,
                    hintText: "Enter your name",
                    controller: _fullNameController, // Pass controller
                  ),
                  SizedBox(height: 16),
                  ProfileInputField(
                    label: "Email Address",
                    icon: Icons.email,
                    hintText: "Enter your email",
                    controller: _emailController, // Pass controller
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileInputField(
                          label: "Date of Birth",
                          icon: Icons.calendar_today,
                          hintText: "DD/MM/YYYY",
                          controller: _dobController, // Pass controller
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ProfileInputField(
                          label: "Gender",
                          icon: Icons.male,
                          hintText: "Male/Female",
                          controller: _genderController, // Pass controller
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: ProfileInputField(
                          label: "Weight",
                          icon: Icons.monitor_weight,
                          hintText: "e.g., 62kg",
                          controller: _weightController, // Pass controller
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: ProfileInputField(
                          label: "Height",
                          icon: Icons.height,
                          hintText: "e.g., 169cm",
                          controller: _heightController, // Pass controller
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30), // Add space for the button
                  // Save Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle saving the profile data
                        String fullName = _fullNameController.text;
                        String email = _emailController.text;
                        
                        final String dobText = _dobController.text;
                        final DateFormat formatter = DateFormat('dd-mm-yyyy');
                        final DateTime dob = formatter.parse(dobText);

                        String gender = _genderController.text;
                        int weight = int.parse(_weightController.text);
                        int height = int.parse(_heightController.text);

                        Future<void> updateData() async {
                          http.Response response = await AuthServices.updateData(email, fullName, gender, dob, weight, height);
                        }

                        updateData();

                        // You can handle saving the data here
                        print(
                            'Saved Profile: $fullName, $email, $dob, $gender, $weight, $height');

                        // Optionally, navigate to a different screen after saving
                        // For example, navigate back to the previous screen:
                        //Navigator.pop(context);
                      },
                      child: Text("Save"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileInputField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String hintText;
  final TextEditingController controller;

  const ProfileInputField({
    required this.label,
    required this.icon,
    required this.hintText,
    required this.controller, // Added controller to allow text input
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller, // Use the controller to capture input
          decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            filled: true, // Optionally make the background filled with a color
            fillColor: Colors.white, // Set background color of input field
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30), // Rounded corners
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(30), // Rounded edges when not focused
              borderSide: BorderSide(
                  color: Colors.grey), // Border color when not focused
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(30), // Rounded edges when focused
              borderSide:
                  BorderSide(color: Colors.blue), // Border color when focused
            ),
          ),
        ),
      ],
    );
  }
}

// Custom Clipper for Oval Shape
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
