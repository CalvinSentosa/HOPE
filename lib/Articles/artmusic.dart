import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MusicArticles extends StatelessWidget {
  const MusicArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Therapy for Relaxation'),
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
              'assets/MusicArticles.jpeg', // Sesuaikan path gambar
              width: double.infinity,
              height: 200, 
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              "By Alex Klein, PsyD — Written by Lois Zoppi on November 4, 2020",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Music has powerful effects on the mind. Different styles of music can have a significant effect on a person’s mood very quickly, and it can help them experience and process a wide range of emotions, from happiness to excitement, as well as sadness, calmness, and thoughtfulness.\n\nMaking music can also be as beneficial as listening to music, and music therapy encourages people to actively create the music they find helpful to them.\n\nThis article explains what music therapy is, how it can help improve mental health, and its effects on different mental health conditions.",
              style: TextStyle(fontSize: 16),
            ),
            _sectionTitle("What is music therapy?"),
            _paragraph("Music therapy uses the powerful abilities of music to improve a person’s well-being. It is an alternative to other types of therapy, such as counseling or cognitive behavioral therapy (CBT).\n\nMusic therapists use a person’s responses and connections to music to encourage positive changes in mood and overall mental mindset. Music therapy can include listening to music or creating music with instruments of all types. It may also involve singing or moving to music.\n\nIt can help improve confidence, communication skills, independence, self-awareness and awareness of others, and concentration and attention skills.\n\nLive musical interaction between a person and their therapist is important during music therapy.\n\nImprovisation can also be a key part of music therapy. This involves making music up on the spot in response to a mood or a theme, such as making the sound of a storm using drums and a rainstick."),
            
            _sectionTitle("How does music therapy work?"),
            _paragraph("The way that music affects the brain is very complex. All aspects of music — including pitch, tempo, and melody — are processed by different areas of the brain.\n\nFor instance, the cerebellum processes rhythm, the frontal lobes decode the emotional signals created by the music, and a small portion of the right temporal lobe helps understand pitch.\n\nThe reward center of the brain, called the nucleus accumbens, can even produce strong physical signs of pleasure, such as goosebumps, when it hears powerful music.\n\nMusic therapy can use these deep physical reactions the body has to music to help people with mental health conditions."),

            _sectionTitle("History and origins"),
            _paragraph("Music has been a part of human life for thousands of years. Specifically, experts have found instruments dating back to over 40,000 years ago, suggesting that humans’ desire to express themselves or communicate through music is deep rooted.\n\nThe use of music for therapy and healing dates back to Ancient GreeceTrusted Source, but its therapeutic use today began in the 20th century, after World War II had ended. The earliest reference to music therapy comes from a 1789 article called “Music physically considered.”\n\nThe 1800s saw medical research into the therapeutic nature of music grow, and by the 1940s, universities were offering music therapy programs. E. Thayer Gaston, one of three men who pioneered the use of music as a therapeutic tool, had organized and promoted the practice so that it would become an accepted type of therapy.\n\nNow, there are many music therapy associations around the world, and music therapists work in private care, education, and social care."),

            _sectionTitle("Music therapy vs. other forms of therapy"),
            _paragraph("Music therapy does not rely on verbal communication, so it can be better for people who struggle to communicate verbally. This could be due to a disability, a neurodegenerative condition such as dementia, an acquired brain injury, or a mental health condition.\n\nAs CBT and counseling are both talking therapies, they may not be suitable for people who find verbal communication difficult. This is where music therapy can be beneficial.\n\nAdditionally, mental health practitioners can bring music therapy directly to a person, such as if they cannot get out of bed or are unable to get to a therapist’s office. Enjoying music therapy at home can also benefit children who want to be in a familiar environment during their sessions.\n\nThis is not specific to music therapy, though, as many other types of psychotherapy can take place in the home.\n\nThe skills a person learns in music therapy can be useful in their everyday life, too. They may even take up learning an instrument as a new hobby, which they can use as a tool for improving their mental health and coping with difficult situations throughout their life."),
        
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


