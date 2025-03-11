import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ThankfulArticles extends StatelessWidget {
  const ThankfulArticles({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('The Power of Gratitude'),
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
              'assets/thankful_img.jpg', // Sesuaikan path gambar
              width: double.infinity,
              height: 200, 
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 10),
            const Text(
              "By Maureen Salamon, Executive Editor, Harvard Women's Health Watch",
              style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            const Text(
              "Several evenings a week, as Tyler VanderWeele gathers around the dinner table with his wife and two young kids, the family deliberately pauses during the meal to do something simple but profound. Each member shares several things for which they're grateful — an act that VanderWeele, co-director of the Initiative on Health, Spirituality, and Religion at the Harvard T.H. Chan School of Public Health, feels changes his family dynamic for the better.\n'I do think it makes a difference and can be a very powerful practice, he says. Even on those bad days where life seems difficult, that effort is worthwhile.'",
              style: TextStyle(fontSize: 16),
            ),
            _sectionTitle("Gratitude, health, and longevity"),
            _paragraph("How can the power of gratitude affect our lives? Recent research has pointed to gratitude's myriad positive health effects, including greater emotional and social well-being, better sleep quality, lower depression risks, and favorable markers of cardiovascular health. Now, new data from the long-term Nurses' Health Study shows that it may extend lives.\n'Gratitude has been one of the most widely studied activities contributing to well-being, but we couldn't find a single prior study that looked at its effects on mortality and longevity, much to our surprise,' says VanderWeele, co-author of the new research."),
            
            _sectionTitle("What did the study look at?"),
            _paragraph("Published July 2024 in JAMA Psychiatry, the new study drew on data from 49,275 women enrolled in the Nurses' Health Study. Their average age was 79. In 2016, participants completed a six-item gratitude questionnaire in which they ranked their agreement with statements such as, 'I have so much in life to be thankful for,' and 'If I had to list everything I felt grateful for, it would be a very long list.'Four years later, researchers combed through participants' medical records to determine who had died. There were 4,608 deaths from all causes, as well as from specific causes such as cardiovascular disease, cancer, respiratory diseases, neurodegenerative disease, infection, and injury. Deaths from cardiovascular disease — a top killer of women and men in the United States — were the most common cause."),

            _sectionTitle("What did the researchers find?"),
            _paragraph("Participants with gratitude scores in the highest third at the study's start had a 9% lower risk of dying over the following four years than participants who scored in the bottom third. This did not change after controlling for physical health, economic circumstances, and other aspects of mental health and well-being. Gratitude seemed to help protect participants from every cause of death studied — including cardiovascular disease.\n\nBut what does this actually mean?\n\n'A 9% reduction in mortality risk is meaningful, but not huge,' VanderWeele says. 'But what's remarkable about gratitude is that just about anyone can practice it. Anyone can recognize what's around them and express thanks to others for what's good in their life.'While the study couldn't pinpoint why gratitude is associated with longer life, VanderWeele believes several factors may contribute.\n\n'We know that gratitude makes people feel happier. That in itself has a small effect on mortality risk,' he says. 'Practicing gratitude may also make someone a bit more motivated to take care of their health. Maybe they're more likely to show up for medical appointments or exercise. It may also help with relationships and social support, which we know contribute to health.s"),

            _sectionTitle("What are the study's limitations and strengths?"),
            _paragraph("The study was observational. This means it can't prove that gratitude helps people live longer — only that an association exists. And the particular sample of people analyzed is both the biggest strength and limitation of the research, VanderWeele says. All were older female nurses with high socioeconomic status. The vast majority were white. 'Does the longevity effect extend to men, to those who are younger, and to those with lower socioeconomic resources?' VanderWeele asks. 'Those are all open questions.'On the plus side, he says, the study sample's large size is one of its biggest strengths. So is the extensive data gathered on potential confounding factors such as participants' physical health, social characteristics, and other aspects of psychological well-being.'Between the quality of the data and the size of the sample, we were able to provide reasonable evidence for this modest longevity effect,' he says."),
        
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

