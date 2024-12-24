import 'package:flutter/material.dart';

class DepressionResultPage extends StatelessWidget {
  final List<int?> weeklyScores;

  DepressionResultPage({
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
    // Current score is the last entry in weeklyScores
    final depressionScore = weeklyScores.last ??
        0; // Handle the case where last score might be null
    final depressionDetails = getDepressionDetails(depressionScore);
    final backgroundColor = depressionDetails['color'] as Color;
    final depressionCategory = depressionDetails['category'] as String;

    // Limit max bar height to avoid overflow
    const double maxHeight = 180.0;

    // Calculate the maximum bar height from weekly scores
    double maxBarHeight = 0;
    for (var score in weeklyScores) {
      if (score != null) {
        double barHeight = (score / 100) * maxHeight;
        if (barHeight > maxBarHeight) {
          maxBarHeight = barHeight;
        }
      }
    }

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

          // Bar plot section with white background behind the bars
          Expanded(
            flex: 2,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                // White background container behind the bars (spanning full width)
                Positioned(
                  bottom: -20,
                  right: -50,
                  left: -50,
                  child: ClipRect(
                    // Prevent clipping of the white background
                    child: Container(
                      height: maxBarHeight + 120,
                      decoration: BoxDecoration(
                        color: Colors.white, // White background
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(200),
                          topRight: Radius.circular(200),
                        ),
                      ),
                    ),
                  ),
                ),
                // Row containing the bars
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(7, (index) {
                      int? score = index < weeklyScores.length
                          ? weeklyScores[index]
                          : null;
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

                      // Limit bar height to avoid overflow
                      double barHeight =
                          (score != null ? (score / 100) * maxHeight : 10);
                      barHeight = barHeight > maxHeight ? maxHeight : barHeight;

                      return Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: 45, // Wider bar width
                            height: barHeight,
                            decoration: BoxDecoration(
                              color: barColor,
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(
                                    30), // Enlarged radius for a semi-circle
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            [
                              "Mon",
                              "Tue",
                              "Wed",
                              "Thu",
                              "Fri",
                              "Sat",
                              "Sun"
                            ][index],
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


// to do
// 1. benerin background putih
// 2. bikin efektif & efisien
// 3. tambahin bubble