import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
import 'package:project_android_studio/Profile/profilepage2.dart';
import 'package:project_android_studio/Services/provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUserData();
    final userData = userProvider.userData;
    // print("Name: $name");
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding:
              const EdgeInsets.only(left: 16), // Move to the right by 16 pixels
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
            child: Container(
              width: 40, // Diameter of the circle
              height: 40, // Diameter of the circle
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white, // Fill the circle with white
                border:
                    Border.all(color: Colors.black, width: 1), // Circle border
              ),
              child: const Icon(CupertinoIcons.arrow_left,
                  color: Colors.black, size: 20), // Back arrow icon
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: OvalClipper(),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/background_profil.jpg'),
                        fit: BoxFit.cover,
                        )
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
                              icon: Icon(CupertinoIcons.pen,
                                  size: 20, color: Colors.black),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProfilePage2()),
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
            SizedBox(height: 16),
            Text(
              userData?['name']?.toString() ?? 'User',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileInfoCard(label: 'Age', value: '19'),
                Container(
                  height: 30,
                  width: 1.5,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                ProfileInfoCard(
                    label: 'Weight',
                    value: userData?['weight']?.toString() ?? '-'),
                Container(
                  height: 30,
                  width: 1.5,
                  color: Colors.black,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                ),
                ProfileInfoCard(
                    label: 'Height',
                    value: userData?['height']?.toString() ?? '-'),
              ],
            ),
            SizedBox(height: 20),
            MoodCard(),

            // MoodCard2(),
          ],
        ),
      ),
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

class ProfileInfoCard extends StatelessWidget {
  final String label;
  final String value;

  const ProfileInfoCard({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}

// MoodCard
class MoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF9BB167),
        borderRadius: BorderRadius.circular(16),
      ),
      width: 300,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.graph_square_fill, color: Colors.white, size: 24),
              SizedBox(width: 8),
              Text(
                "Depression Score",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MoodBar(day: "Sun", color: Colors.green, fillHeight: 80),
              MoodBar(day: "Mon", color: Colors.green, fillHeight: 90),
              MoodBar(day: "Tue", color: Color(0xFFED7E1C), fillHeight: 60),
              MoodBar(day: "Wed", color: Color(0xFFF44343), fillHeight: 30),
              MoodBar(day: "Thu", color: Colors.grey, fillHeight: 0),
              MoodBar(day: "Fri", color: Colors.grey, fillHeight: 0),
              MoodBar(day: "Sat", color: Colors.grey, fillHeight: 0),
            ],
          ),
        ],
      ),
    );
  }
}

class MoodBar extends StatelessWidget {
  final String day;
  final Color color;
  final double fillHeight;

  const MoodBar({
    required this.day,
    required this.color,
    required this.fillHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 10,
              height: 100,
              decoration: BoxDecoration(
                color: Color(0xFFE8DDD9),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: 10,
              height: fillHeight,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        Text(
          day,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}

// class MoodCard2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.green.shade300,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       width: 300,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Icon(Icons.bedtime, color: Colors.white, size: 24),
//               SizedBox(width: 8),
//               Text(
//                 "Sleep Quality",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               MoodBar(day: "Sun", color: Colors.green, fillHeight: 70),
//               MoodBar(day: "Mon", color: Colors.green, fillHeight: 80),
//               MoodBar(day: "Tue", color: Colors.yellow, fillHeight: 60),
//               MoodBar(day: "Wed", color: Colors.red, fillHeight: 30),
//               MoodBar(day: "Thu", color: Colors.grey, fillHeight: 0),
//               MoodBar(day: "Fri", color: Colors.grey, fillHeight: 0),
//               MoodBar(day: "Sat", color: Colors.grey, fillHeight: 0),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
