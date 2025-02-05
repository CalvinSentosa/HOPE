import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  double _currentSliderValue1 = 0;
  double _currentSliderValue2 = 0;
  double _currentSliderValue3 = 0;
  double _currentSliderValue4 = 0;
  double _currentSliderValue5 = 0;
  double _currentSliderValue6 = 0;
  double _currentSliderValue7 = 0;
  double _currentSliderValue8 = 0;
  double _currentSliderValue9 = 0;
  double _currentSliderValue10 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F4F2),
      appBar: AppBar(
        title: const Text("Question Page"),
        backgroundColor: Color(0xFFF7F4F2),
        foregroundColor: const Color(0xFF4F3422), // Menambahkan warna title
      ),
      body: SafeArea(
        child: SingleChildScrollView(  // Membungkus dengan SingleChildScrollView
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
                        const Text(
                          "60",
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
                      questionText: "Little interest or pleasure in doing things",
                      sliderValue: _currentSliderValue1,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue1 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Feeling down, depressed, or hopeless",
                      sliderValue: _currentSliderValue2,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue2 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Trouble falling or staying asleep, or sleeping too much",
                      sliderValue: _currentSliderValue3,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue3 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Feeling tired or having little energy",
                      sliderValue: _currentSliderValue4,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue4 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Poor appetite or overeating",
                      sliderValue: _currentSliderValue5,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue5 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Feeling bad about yourself or that you are a failure or have let yourself or your family down",
                      sliderValue: _currentSliderValue6,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue6 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Trouble concentrating on things, such as reading the newspaper or watching television",
                      sliderValue: _currentSliderValue7,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue7 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Moving or speaking so slowly that other people could have noticed. Or the opposite, being so fidgety or restless that you have been moving around a lot more than usual",
                      sliderValue: _currentSliderValue8,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue8 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "Thoughts that you would be better off dead, or of hurting yourself",
                      sliderValue: _currentSliderValue9,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue9 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16),
                    _buildQuestionCard(
                      questionText: "How often do you have trouble falling asleep or staying asleep?",
                      sliderValue: _currentSliderValue10,
                      onChanged: (value) {
                        setState(() {
                          _currentSliderValue10 = value;
                        });
                      },
                    ),
                    const SizedBox(height: 32), // Memberikan ruang sebelum tombol
                    ElevatedButton(
                    onPressed: () {
                      // Navigasi ke halaman berikutnya
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => NextPage()),
                      );
                    },
                    child: const Text("Finish"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF9BB168), // Mengganti 'primary' dengan 'backgroundColor'
                      foregroundColor: Colors.white, // Mengganti 'onPrimary' dengan 'foregroundColor'
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF4F3422), // Menambahkan warna teks
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Not at all",
                style: TextStyle(color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
              Text(
                "Several days",
                style: TextStyle(color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
              Text(
                "More than half the days",
                style: TextStyle(color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
              Text(
                "Nearly every day",
                style: TextStyle(color: Color(0xFF4F3422)), // Menambahkan warna teks
              ),
            ],
          )
        ],
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Page"),
      ),
      body: Center(
        child: const Text('This is the next page!'),
      ),
    );
  }
}
