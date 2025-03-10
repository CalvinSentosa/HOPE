import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class MeditationArticles extends StatelessWidget {
  const MeditationArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('5 Benefits of Daily Meditation'),
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
            Image.asset(
              'assets/meditation_img.png', // Sesuaikan path gambar
              width: double.infinity,
              height: 200, 
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              "By Ravisha Kathuria\nBased on inputs by Bharathy Harish, Sahaj Samadhi Meditation Teacher",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Have you ever wondered about the speed of thought? You might be here one moment and somewhere else, many light years away, in the next. So, you see, your thoughts can travel faster than the speed of light!\nWherever you put your attention, that will start manifesting in your life. If only we could realize how powerful our thoughts are, we would only put our attention on the positiv\nJust as we fine tune the radio to get the best signal, we need to fine tune our mind to amplify the results of our efforts. A distracted mind yields lesser than a focused one. And, meditation is just the perfect antidote to the poison of too much thinking or wasteful thinking.",
              style: TextStyle(fontSize: 16),
            ),
            _sectionTitle("Send off good vibes"),
            _paragraph("How would it be if every person you come across cannot help smiling just because of the lightness of your presence? Not only will your daily dose of meditation light up your day, but it will also bring joy to others. And such people are always a pleasure to have around.\nAcknowledge the fact that throughout the day, you come across a plethora of events – some good, some bad. Instead of attaching yourself to actions and events, repose in the self."),
            
            _sectionTitle("Feel happy within"),
            _paragraph("Meditation acts on the subtler levels of consciousness and relieves any accumulated stress while at the same time, preventing it from accumulating more stress, making one centered. And you are effortlessly happy for most part of the day.\nThe key to deep meditation is yoga. A good 20 minutes of yoga before meditation makes your practice deep and profound."),

            _sectionTitle("Become resilient"),
            _paragraph("Meditation acts as your windshield for life. It protects you from external and internal storms, making you strong enough to face challenges. Meditation helps you maintain your composure, making life an easy ride.\nSahaj Samadhi Meditation is a simple tool that can be practiced anywhere – at work, on public transport, or before an exam, in just 10 minutes."),

            _sectionTitle("Manage your mind better"),
            _paragraph("Meditation is more than just a breathe-in-breathe-out exercise. It is conscious inhalation of vitality, health, and happiness and conscious exhalation of misery, sorrow, and illness.\nGuided meditation from an expert or spiritual master can help you deepen your practice."),
        
            _sectionTitle("Sustained benefits"),
            _paragraph("Meditation is like the seed of an evergreen tree. We only need to nurture it by daily practice – the sharpness of mind and intellect will follow soon.\nIt is good to choose a quiet place for meditation, but if you can’t find one, just observe and accept the noise within and without – and surpass it."),
            
            const SizedBox(height: 20),
            const Text(
              "Inspired by Gurudev Sri Sri Ravi Shankar's wisdom talks",
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
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.teal),
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

  Widget _quote(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          const Icon(Icons.format_quote, size: 24, color: Colors.grey),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                fontStyle: FontStyle.italic,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tip(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.teal.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(Icons.lightbulb, color: Colors.teal),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
