import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
import 'package:project_android_studio/Services/provider.dart';
import 'package:provider/provider.dart';

class DepressionResultPage extends StatelessWidget {
  // Method to determine depression category and background color based on score
  Map<String, dynamic> getDepressionDetails(int score) {
    if (score <= 4) {
    return {'category': 'No Depression', 'color': Color(0xFF7FA760)};
    } else if (score <= 9) {
      return {'category': 'Mild Depression', 'color': Color(0xFF9BB168)};
    } else if (score <= 14) {
      return {'category': 'Moderate Depression', 'color': Color(0xFFFFCE5C)};
    } else if (score <= 19) {
      return {'category': 'Moderate Severe Depression', 'color': Color(0xFFED7E1C)};
    } else {
      return {'category': 'Severe Depression', 'color': Color(0xFFAF2727)};
    }
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.userData;
    final userResult = userProvider.getDepressionScores();
    print('User Result: $userResult');
    final int score = userData?['depression_score'] ?? 0;
    final depressionDetails = getDepressionDetails(score);
    final Color backgroundColor = depressionDetails['color'] as Color;

    const double maxHeight = 180.0;

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
        title: Text('Depression Score', style: TextStyle(color: Colors.white)),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          // Background decorations
          Positioned(
            top: 200,
            right: 45,
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
            left: 30,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 150,
            right: 40,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Positioned(
            bottom: 400,
            left: 50,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        score.toString(),
                        style: TextStyle(
                          fontSize: 64,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // SizedBox(height: 2),
                      // Text(
                      //   'You have ${depressionDetails['category']}',
                      //   style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                      // ),
                      Text.rich(
                        TextSpan(
                        children: [
                          TextSpan(
                            text: 'You have ',
                            style: TextStyle(fontSize: 24, color: Colors.white),
                          ),
                          TextSpan(
                            text: '${depressionDetails['category']}',
                            style: TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                        ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: FutureBuilder<List>(
                        future: userProvider.getDepressionScores(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(child: Text('Error: ${snapshot.error}'));
                          }

                          final List<Map<String, dynamic>> depressionScores =
                              (snapshot.data ?? []).cast<Map<String, dynamic>>();

                          // Ensure recentScores has at least 7 elements
                          List<Map<String, dynamic>> recentScores = [];
                          DateTime today = DateTime.now();

                          for (int i = 0; i < 7; i++) {
                            DateTime targetDate = today.subtract(Duration(days: i));
                            String targetDateStr = targetDate.toIso8601String().substring(0, 10);
                            print(targetDateStr);

                            // Check if there is a score for this date
                            var scoreData = depressionScores.firstWhere(
                              (element) => element['date'] != null && element['date'].startsWith(targetDateStr),
                              orElse: () => {'score': null, 'date': targetDateStr},
                            );

                            // If the score for the current date is null, replace it with the score obtained earlier
                            if (scoreData['score'] == null && targetDateStr == today.toIso8601String().substring(0, 10)) {
                              scoreData['score'] = score;
                            }

                            recentScores.insert(0, scoreData);
                          }

                          // Debug print to check recentScores
                          print('Raw API Data: $depressionScores');
                          print('Recent Scores: $recentScores');

                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: List.generate(7, (index) {
                              final scoreData = recentScores[index];
                              final score = scoreData['score'];
                              final date = scoreData['date'];

                              final barColor = score != null
                                  ? getDepressionDetails(score)['color'] as Color
                                  : Colors.grey;
                              final barHeight = score != null
                                  ? ((score / 100) * maxHeight).clamp(0.0, maxHeight)
                                  : 10.0;

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
                                    date.substring(8, 10), // Display the day
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              );
                            }),
                          );
                        },
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