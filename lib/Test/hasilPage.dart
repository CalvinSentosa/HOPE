import 'package:flutter/material.dart';

class DepressionResultPage extends StatelessWidget {
  final int depressionScore;
  final String depressionCategory;
  final Color backgroundColor;
  final List<int> weeklyScores;

  DepressionResultPage({
    required this.depressionScore,
    required this.depressionCategory,
    required this.backgroundColor,
    required this.weeklyScores,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            // TODO: Add navigation link to the previous page
          },
        ),
        title: Text(
          'Depression Score',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          // Top section with depression score and category
          Expanded(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    depressionScore.toString(),
                    style: TextStyle(
                      fontSize: 64,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'You are $depressionCategory',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bar plot section
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: weeklyScores.asMap().entries.map((entry) {
                    int index = entry.key;
                    int score = entry.value;
                    Color barColor;
                    
                    if (score == 0) {
                      barColor = Colors.grey;
                    } else if (score <= 20) {
                      barColor = Colors.green;
                    } else if (score <= 40) {
                      barColor = Colors.yellow;
                    } else if (score <= 60) {
                      barColor = Colors.orange;
                    } else {
                      barColor = Colors.red;
                    }

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 20,
                          height: (score / 100) * 150, // Adjust max height
                          color: barColor,
                        ),
                        SizedBox(height: 8),
                        Text(
                          ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index],
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}