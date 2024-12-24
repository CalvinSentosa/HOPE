import 'package:flutter/material.dart';

class DepressionResultPage extends StatelessWidget {
  final List<int?> weeklyScores;

  DepressionResultPage({required this.weeklyScores});

  // Method to determine depression category and background color based on score
  Map<String, dynamic> getDepressionDetails(int score) {
    if (score <= 25) {
      return {'category': 'No Depression', 'color': Color(0xFF9BB167)};
    } else if (score <= 50) {
      return {'category': 'Mild Depression', 'color': Color(0xFFFFCE5C)};
    } else if (score <= 75) {
      return {'category': 'Moderate Depression', 'color': Color(0xFFED7E1C)};
    } else {
      return {'category': 'Severe Depression', 'color': Color(0xFFAF2727)};
    }
  }

  @override
  Widget build(BuildContext context) {
    final depressionScore = weeklyScores.last ?? 0; // Default to 0 if null
    final depressionDetails = getDepressionDetails(depressionScore);
    final backgroundColor = depressionDetails['color'] as Color;
    final depressionCategory = depressionDetails['category'] as String;

    const double maxHeight = 180.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Depression Score', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        clipBehavior: Clip.none, // Allow decoration to overflow
        children: [
          // Background decorations
          Positioned(
            top: 250,
            right: 50,
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: -150,
            right: -40,
            child: Container(
              width: 270,
              height: 270,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: 20,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 200,
            left: 50,
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            top: 280,
            left: 250,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Main content
          Column(
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
                        style: TextStyle(fontSize: 24, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),

              // Bar plot section
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none, // Ensure no clipping
                  children: [
                    Positioned(
                      bottom: 0,
                      right: -50,
                      left: -50,
                      child: Container(
                        height: maxHeight + 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(240),
                            topRight: Radius.circular(240),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: List.generate(7, (index) {
                          final score = index < weeklyScores.length ? weeklyScores[index] : null;
                          final barColor = score != null ? getDepressionDetails(score)['color'] as Color : Colors.grey;
                          final barHeight = score != null ? ((score / 100) * maxHeight).clamp(0.0, maxHeight) : 10.0;

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 45,
                                height: barHeight,
                                decoration: BoxDecoration(
                                  color: barColor,
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(30),
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
        ],
      ),
    );
  }
}
