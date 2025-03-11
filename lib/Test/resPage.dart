import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/home_page.dart';
import 'package:project_android_studio/Services/provider.dart';
import 'package:project_android_studio/main.dart';
import 'package:provider/provider.dart';

class DepressionResultPage extends StatelessWidget {
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
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.userData;
    print("Score: ${userData?['depression_Score']}");
    final depressionDetails = getDepressionDetails(userData?['depressionScore']);
    final backgroundColor = depressionDetails['color'] as Color;

    const double maxHeight = 180.0;

    return Scaffold(
      backgroundColor: backgroundColor, // Fix backgroundColor reference
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.white),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomePage(
                  key: homePageKey,
                ),
              ),
            );
          },
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
                        userData?['depressionScore'],
                        style: TextStyle(
                          fontSize: 64,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'You have ${getDepressionDetails(userData?['depressionScore'] ?? 0)['category']}',
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 16.0),
                      child: FutureBuilder(
                        future: userProvider.getDepressionScores(), // Get depression scores from database
                        builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return CircularProgressIndicator(); // Show loading indicator
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}'); // Error handling
                          } else if (!snapshot.hasData || snapshot.hasData) {
                            return Center(child: Text('No data available'));
                          } else {
                            final depressionScores = snapshot.data as List<Map<String, dynamic>>;
                            final recentScores = depressionScores.take(7).toList(); // Take 7 days of scores
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
                                      date != null
                                          ? DateTime.parse(date).day.toString()
                                          : '', // Show date of the depression test
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                );
                              }),
                            );
                          }
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

// perbaiki kesalahan berikut

// Undefined name 'backgroundColor'.
// Try correcting the name to one that is defined, or defining the name.dartundefined_identifier
// Type: InvalidType


// The getter 'depressionScore' isn't defined for the type 'Map<String, dynamic>'.
// Try importing the library that defines 'depressionScore', correcting the name to the name of an existing getter, or defining a getter or field named 'depressionScore'.dartundefined_getter
// Type: InvalidType


// The property 'isEmpty' can't be unconditionally accessed because the receiver can be 'null'.
// Try making the access conditional (using '?.') or adding a null check to the target ('!').dartunchecked_use_of_nullable_value
// Type: InvalidType


