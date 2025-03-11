import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MeditationVideoPage extends StatefulWidget {
  const MeditationVideoPage({super.key});

  @override
  _MeditationVideoPageState createState() => _MeditationVideoPageState();
}

class _MeditationVideoPageState extends State<MeditationVideoPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Meditation for Inner Peace',
          style: TextStyle(
            color: Color(0xFF4F3422),
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left,
                  color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Image.asset('assets/meditation_thumbnail.png'),
            const SizedBox(height: 10),
            _sectionTitle("Manfaat Meditasi"),
            _paragraph("Meditasi memiliki berbagai manfaat bagi kesehatan mental dan fisik. Beberapa manfaat utama meditasi meliputi:"),
            _bulletPoint("Mengurangi stres dan kecemasan"),
            _bulletPoint("Meningkatkan konsentrasi dan fokus"),
            _bulletPoint("Membantu mengontrol emosi"),
            _bulletPoint("Meningkatkan kualitas tidur"),
            _bulletPoint("Meningkatkan kesehatan jantung dan tekanan darah"),
            _sectionTitle("Langkah-langkah Meditasi"),
            _step("1. Cari tempat yang tenang dan nyaman."),
            _step("2. Duduk dengan posisi yang nyaman, punggung tegak namun rileks."),
            _step("3. Tutup mata dan fokus pada pernapasan."),
            _step("4. Biarkan pikiran mengalir tanpa menahan atau menghakimi."),
            _step("5. Jika pikiran mulai mengembara, kembalikan fokus pada napas."),
            _step("6. Lakukan meditasi selama 5-15 menit sesuai kenyamanan."),
            const SizedBox(height: 20),
            const Text(
              "Terinspirasi dari ajaran Gurudev Sri Sri Ravi Shankar",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF9BB167)),
      ),
    );
  }

  Widget _paragraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _bulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, bottom: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(CupertinoIcons.circle, size: 8, color: Colors.black54),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _step(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(CupertinoIcons.check_mark_circled, size: 20, color: Color(0xFF9BB167)),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
