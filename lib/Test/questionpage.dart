import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_android_studio/Home/home_page.dart';
import 'package:project_android_studio/Profile/profilepage2.dart';
import 'package:project_android_studio/Services/auth_services.dart';
import 'package:project_android_studio/Services/provider.dart';
import 'package:project_android_studio/Test/bpm_detector1.dart';
import 'package:project_android_studio/main.dart';
import 'package:provider/provider.dart';

class QuestionPage extends StatefulWidget {
  final int bpm;

  const QuestionPage({super.key, required this.bpm});

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

// Buat function untuk menghitung skor PHQ-9
class _QuestionPageState extends State<QuestionPage> {
  // String email = '';
  String calculateDepressionScore(List<double> answers) {
    // Konversi nilai slider ke skor PHQ-9
    int totalScore = val.fold(0, (sum, vals) => sum + (vals.toInt() - 1));

    // Menentukan kategori depresi berdasarkan skor
    if (totalScore <= 4) {
      return "Tidak ada/mild depression";
    } else if (totalScore <= 9) {
      return "Depresi ringan";
    } else if (totalScore <= 14) {
      return "Depresi sedang";
    } else if (totalScore <= 19) {
      return "Depresi cukup berat";
    } else {
      return "Depresi berat";
    }
  }

  int DepressionScore(List<double> answers) {
    // Konversi nilai slider ke skor PHQ-9
    int totalScore = val.fold(0, (sum, vals) => sum + (vals.toInt() - 1));

    // Menentukan kategori depresi berdasarkan skor
    return totalScore;
  }

  double _currentValue = 1; // Nilai default slider
  List<double> val = List.filled(10, 1); // Menyimpan jawaban user

  void updateScore(int index, double value) {
    setState(() {
      val[index] = value;
    });
  }

  String submitAnswers() {
    String results = calculateDepressionScore(val);
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final userData = userProvider.userData;
    result() async {
      if (userProvider.userData == null) {
        userProvider.loadUserData();
      }
      String email = '${userData?['email'] ?? 'Email kosong'}';
      int depression_score = DepressionScore(val);

      http.Response response =
          await AuthServices.result(email, depression_score);

      if (response.statusCode == 200) {
        successSnackBar(context, "Data updated!");
        userProvider.setUserData({
          "userEmail": email,
          "depression_score": depression_score,
        });
      } else {
        Map<String, dynamic> responseMap = jsonDecode(response.body);
        String errorMessage =
            responseMap['message'] ?? 'Terjadi kesalahan, coba lagi.';
        errorSnackBar(context, errorMessage);
      }
    }

    return Scaffold(
      backgroundColor: Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(CupertinoIcons.arrow_left, color: Colors.black),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage(
                          key: homePageKey,
                        )));
          },
        ),
        title: Text('Question Page', style: TextStyle(color: Colors.black)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          // Membungkus dengan SingleChildScrollView
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Section with Heart Icon and Score
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.favorite,
                          color: Colors.orange.shade100,
                          size: 100,
                        ),
                        Text(
                          '${widget.bpm}',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Honesty: Truth",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildQuestionCard(
                      questionText:
                          "Little interest or pleasure in doing things",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(1, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Feeling down, depressed, or hopeless",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(2, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText:
                          "Trouble falling or staying asleep, or sleeping too much",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(3, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Feeling tired or having little energy",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(4, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Poor appetite or overeating",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(5, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText:
                          "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(6, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText:
                          "Trouble concentrating on things, such as reading the newspaper or watching television",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(7, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText:
                          "Moving or speaking so slowly that other people could have noticed. Or the opposite, being so fidgety or restless that you have been moving around a lot more than usual",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(8, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText:
                          "Thoughts that you would be better off dead, or of hurting yourself",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(9, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText:
                          "How often do you have trouble falling asleep or staying asleep?",
                      sliderValue: _currentValue,
                      onChanged: (value) {
                        setState(() {
                          _currentValue = value;
                          updateScore(10, _currentValue);
                        });
                      },
                    ),
                    const SizedBox(
                        height: 32), // Memberikan ruang sebelum tombol
                    ElevatedButton(
                      onPressed: () {
                        result();
                        // Navigasi ke halaman berikutnya
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HeartBPMDetector1(
                                    onBPMDetected: (bpm) {})));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(
                            0xFF9BB168), // Mengganti 'primary' dengan 'backgroundColor'
                        foregroundColor: Colors
                            .white, // Mengganti 'onPrimary' dengan 'foregroundColor'
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Finish"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestionCard({
    required String questionText,
    required double sliderValue,
    required ValueChanged<double> onChanged,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.brown.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            questionText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF4F3422), // Menambahkan warna teks
            ),
          ),
          const SizedBox(height: 16),
          Slider(
            value: sliderValue,
            max: 3,
            divisions: 3,
            label: sliderValue.round().toString(),
            onChanged: onChanged,
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Not at all",
                // "1",
                style: TextStyle(
                    color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
              Text(
                // "Several days",
                "2",
                style: TextStyle(
                    color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
              Text(
                // "More than half the days",
                "3",
                style: TextStyle(
                    color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
              Text(
                "Nearly every day",
                // "4",
                style: TextStyle(
                    color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
            ],
          )
        ],
      ),
    );
  }
}
