import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeartTestResultPage extends StatelessWidget {
  final int heartBpm; // BPM yang diterima dari halaman sebelumnya

  // Constructor untuk menerima heartBpm
  HeartTestResultPage({required this.heartBpm});

  @override
  Widget build(BuildContext context) {
    // Cek apakah BPM lebih kecil atau lebih besar dari 120 untuk menentukan apakah Lie atau Truth
    bool isLie = heartBpm > 120;

    return Scaffold(
      appBar: AppBar(
        title: Text('Heart BPM Test Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Menampilkan angka heart rate di tengah ikon hati
            Stack(
              alignment: Alignment.center,
              children: [
                // Menampilkan kumpulan ikon hati dalam satu layer bertumpuk
                Transform.scale(
                  scale: 1.5,
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.orange.withOpacity(0.1),
                    size: 180,
                  ),
                ),
                Transform.scale(
                  scale: 1.2,
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: Colors.orange.withOpacity(0.3),
                    size: 155,
                  ),
                ),
                Icon(
                  CupertinoIcons.heart_fill,
                  color: Colors.orange,
                  size: 130,
                ),
                // Menampilkan angka BPM tepat di tengah hati dan di atas ikon
                Positioned(
                  child: Text(
                    '$heartBpm',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Warna angka di atas hati
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Menampilkan status berdasarkan BPM
            Text(
              isLie ? 'Honesty: Lie' : 'Honesty: Truth',
              style: TextStyle(
                fontSize: 24,
                color: isLie ? Colors.red : Colors.green,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            // Tombol untuk melanjutkan dengan warna latar belakang E1CCC4 dan teks 4F3422
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE1CCC4), // Warna latar belakang tombol
                foregroundColor: Color(0xFF4F3422), // Warna teks tombol
              ),
              onPressed: () {
                if (isLie) {
                  // Jika Lie, kembali ke halaman tes sebelumnya
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionPage()), // Arahkan ke QuestionPage di sini
                  );
                } else {
                  // Jika Truth, lanjut ke halaman berikutnya
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResPage()), // Arahkan ke ResPage di sini
                  );
                }
              },
              child: Text(
                isLie ? 'Take Another Test' : 'Continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman QuestionPage
class QuestionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Question Page'),
      ),
      body: Center(
        child: Text('This is the Question Page'),
      ),
    );
  }
}

// Halaman ResPage
class ResPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result Page'),
      ),
      body: Center(
        child: Text('This is the Result Page'),
      ),
    );
  }
}
