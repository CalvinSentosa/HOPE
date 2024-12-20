import 'package:flutter/material.dart';

class ArticlePage extends StatelessWidget {
  final List<Map<String, String>> articles = [
    {
      'title': '5 Benefits of Daily Meditation',
      'description': 'Learn how meditation can improve your daily life.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'The Power of Gratitude',
      'description': 'Discover how being thankful can change your mindset.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'Music Therapy for Relaxation',
      'description': 'Explore the healing power of music for stress relief.',
      'image': 'https://via.placeholder.com/150',
    },
    {
      'title': 'How to Start Journaling',
      'description': 'Step-by-step guide to start your journaling journey.',
      'image': 'https://via.placeholder.com/150',
    },
  ];

  ArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mindful Articles'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Featured Articles',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  final article = articles[index];
                  return ArticleCard(
                    title: article['title']!,
                    description: article['description']!,
                    imageUrl: article['image']!,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const ArticleCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6.0,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
