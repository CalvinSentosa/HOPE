import 'package:flutter/material.dart';

class MoodCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Background color for the whole screen
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.orange.shade300, // Box background color
            borderRadius: BorderRadius.circular(16),
          ),
          width: 300, // Define the width of the orange card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min, // Adjust the height dynamically
            children: [
              // Title Row
              Row(
                children: [
                  Icon(Icons.emoji_emotions, color: Colors.white, size: 24),
                  SizedBox(width: 8),
                  Text(
                    "Mood",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              // Mood Bars
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MoodBar(day: "Sun", color: Colors.green, fillHeight: 80),
                  MoodBar(day: "Mon", color: Colors.green, fillHeight: 90),
                  MoodBar(day: "Tue", color: Colors.yellow, fillHeight: 60),
                  MoodBar(day: "Wed", color: Colors.red, fillHeight: 30),
                  MoodBar(day: "Thu", color: Colors.grey, fillHeight: 0),
                  MoodBar(day: "Fri", color: Colors.grey, fillHeight: 0),
                  MoodBar(day: "Sat", color: Colors.grey, fillHeight: 0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MoodBar extends StatelessWidget {
  final String day;
  final Color color;
  final double fillHeight; // Height of the filled portion

  const MoodBar({
    required this.day,
    required this.color,
    required this.fillHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Grey background bar
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: 10,
              height: 100, // Full bar height
              decoration: BoxDecoration(
                color: Colors.grey, // Grey background
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            Container(
              width: 10,
              height: fillHeight, // Filled height
              decoration: BoxDecoration(
                color: color, // Fill color
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ],
        ),
        SizedBox(height: 8),
        // Day label
        Text(
          day,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}

void main() => runApp(MaterialApp(home: MoodCard()));
