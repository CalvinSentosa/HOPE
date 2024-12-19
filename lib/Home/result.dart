import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int score;

  const ResultPage({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    String moodText;
    // ignore: unused_local_variable
    String moodStatus;
    IconData moodIcon;

    // Menentukan warna dan ekspresi berdasarkan skor
    if (score >= 90) {
      backgroundColor = Colors.yellow.shade200;
      moodText = "Ini Sample";
      moodStatus = "Happy";
      moodIcon = Icons.sentiment_very_satisfied;
    } else if (score >= 61) {
      backgroundColor = Colors.green.shade200;
      moodText = "Ini Sample";
      moodStatus = "Mid";
      moodIcon = Icons.sentiment_satisfied;
    } else {
      backgroundColor = Colors.blue.shade200;
      moodText = "Ini Sample";
      moodStatus = "Sad";
      moodIcon = Icons.sentiment_very_dissatisfied;
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigasi kembali ke halaman sebelumnya
            Navigator.pop(context);
          },
        ),
        title: const Text("Mood"),
        backgroundColor: backgroundColor,
      ),
      body: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ekspresi wajah
            Icon(moodIcon, size: 100, color: Colors.white),

            // Keterangan mood
            const SizedBox(height: 20),
            Text(
              moodText,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 40),

            // Statistik mood
            const Text(
              "Statistics",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),

            // Grafik mood (Bar chart)
            MoodBarChart(),

            // Navigasi ke halaman sebelumnya
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home, color: Colors.white),
                SizedBox(width: 10),
                Text(
                  "Go to Home",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MoodBarChart extends StatelessWidget {
  const MoodBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    // Mood harian selama seminggu (skor dan label hari)
    List<Map<String, dynamic>> moodData = [
      {"day": "Mon", "score": 80},
      {"day": "Tue", "score": 70},
      {"day": "Wed", "score": 65},
      {"day": "Thu", "score": 90},
      {"day": "Fri", "score": 50},
      {"day": "Sat", "score": null}, // Tidak ada data
      {"day": "Sun", "score": 95},
    ];

    return Positioned(
      bottom: 24, // Jarak bar plot dari tepi bawah layar 24px
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height *
            2 /
            5, // 2/5 bagian bawah layar
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft:
                Radius.circular(524 / 2), // Diameter 524px menjadi radius 262px
            topRight: Radius.circular(524 / 2),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: moodData.map((mood) {
              // Nilai tinggi bar
              double barHeight = 0;
              Color barColor;

              if (mood["score"] != null) {
                barHeight =
                    (mood["score"] / 100) * 110; // Skala maksimal 110 piksel
                // Warna bar berdasarkan skor
                if (mood["score"] >= 90) {
                  barColor = const Color(0xFFFFCE5C); // Kuning
                } else if (mood["score"] >= 61) {
                  barColor = const Color(0xFF9BB168); // Hijau
                } else {
                  barColor = const Color(0xFF019CB0); // Biru
                }
              } else {
                // Jika nilai null, tampilkan bar abu-abu dengan sedikit tinggi
                barHeight = 10; // Sedikit tinggi
                barColor = Colors.grey.shade400; // Warna abu-abu
              }

              return Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Bar
                  Container(
                    width: 30, // Tebal bar plot 30px
                    height: barHeight,
                    decoration: BoxDecoration(
                      color: barColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  const SizedBox(height: 5),
                  // Label hari
                  Text(
                    mood["day"],
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
