import 'package:flutter/material.dart';

class DepressionResultPage extends StatelessWidget {
  final int depressionScore;
  final List<int?> weeklyScores;

  DepressionResultPage({
    required this.depressionScore,
    required this.weeklyScores,
  });

  // Method to determine depression category and background color based on score
  Map<String, dynamic> getDepressionDetails(int score) {
    if (score <= 25) {
      return {'category': 'No Depression', 'color': Colors.green};
    } else if (score <= 50) {
      return {'category': 'Mild Depression', 'color': Colors.yellow};
    } else if (score <= 75) {
      return {'category': 'Moderate Depression', 'color': Colors.orange};
    } else {
      return {'category': 'Severe Depression', 'color': Colors.red};
    }
  }

  @override
  Widget build(BuildContext context) {
    final depressionDetails = getDepressionDetails(depressionScore);
    final backgroundColor = depressionDetails['color'] as Color;
    final depressionCategory = depressionDetails['category'] as String;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
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
                    'You have $depressionCategory',
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
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    width: 554, // Fixed width for the circle
                    height: 554, // Fixed height for the circle
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    transform: Matrix4.translationValues(0, 100, 0), // Positioned without considering padding
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(7, (index) {
                      int? score = index < weeklyScores.length ? weeklyScores[index] : null;
                      Color barColor;

                      if (score == null) {
                        barColor = Colors.grey;
                      } else if (score <= 25) {
                        barColor = Colors.green;
                      } else if (score <= 50) {
                        barColor = Colors.yellow;
                      } else if (score <= 75) {
                        barColor = Colors.orange;
                      } else {
                        barColor = Colors.red;
                      }

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 30, // Wider bar width
                            height: (score != null ? (score / 100) * 200 : 10),
                            decoration: BoxDecoration(
                              color: barColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15), // Enlarged radius for a semi-circle
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][index],
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      );
                    }),
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
