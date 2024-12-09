import 'package:flutter/material.dart';
import 'package:project_android_studio/Home/article.dart';
import 'package:project_android_studio/Home/result.dart';

/// Flutter code sample for [SliverAppBar].

// void main() => runApp(const AppBarApp());

class AppBarApp extends StatelessWidget {
  const AppBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SliverAppBarExample(),
    );
  }
}

class SliverAppBarExample extends StatefulWidget {
  const SliverAppBarExample({super.key});

  @override
  State<SliverAppBarExample> createState() => _SliverAppBarExampleState();
}

class _SliverAppBarExampleState extends State<SliverAppBarExample> {
  bool _pinned = true;

// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            expandedHeight: 160.0,
            backgroundColor: Colors.brown,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "HOPE",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              background: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.brown.shade400, Colors.brown.shade700],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Profile Image
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => ResultPage(score: 85)
                            // AlertDialog(
                            //       title: Text("Kamu klik aku ya"),
                            //       content: Text("Yey aku muncul"),
                            //       actions: [
                            //         TextButton(
                            //           onPressed: () {
                            //             Navigator.pop(context); // Tutup dialog
                            //           },
                            //           child: Text('Tutup dong'),
                            //         ),
                            //       ],
                            //     )
                            );
                      },
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'Assets/Profile_test.jpg'), // Replace with your asset
                      ),
                    ),

                    const SizedBox(width: 16),
                    // Greeting and Progress
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Hi, Calvin"),
                          Text(
                            'Care for Your Mind, One Step at a Time...',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Text(
                                'Happy 😊',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: 0.4 * 2, // 80% progress
                                  backgroundColor: Colors.white24,
                                  color: Colors.greenAccent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '80%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Sleep 😊',
                                style: TextStyle(color: Colors.white),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: LinearProgressIndicator(
                                  value: 0.3 * 2, // 60% progress
                                  backgroundColor: Colors.white24,
                                  color: Colors.greenAccent,
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                '60%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // FIRST BODY - START
                      SizedBox(height: 20),

                      // AI Therapy Chatbot Section
                      Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          'AI Therapy Chatbot',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (context) => ResultPage(score: 85));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  'Assets/HIRO.png', // Replace with your asset
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // End of AI Chatbot Section
                      SizedBox(height: 20),

                      // Suggested Activities
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          'Suggested Activity',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                      ),

                      SizedBox(height: 10), //////////////////////////////////
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ActivityCard(
                              title: 'Daily Meditation',
                              icon: Icon(
                                Icons.energy_savings_leaf,
                                color: Colors.green,
                              ),
                            ),
                            ActivityCard(
                              title: 'Gratefulness Journaling',
                              icon: Icon(
                                Icons.book,
                                color: Colors.blue,
                              ),
                            ),
                            ActivityCard(
                              title: 'Music for the Soul',
                              icon: Icon(
                                Icons.music_note,
                                color: Colors.purple,
                              ),
                            ),
                            ActivityCard(
                              title: 'Daily Run',
                              icon: Icon(Icons.run_circle_outlined),
                            ),
                            ActivityCard(
                              title: 'Comedy For Life',
                              icon: Icon(Icons.theater_comedy_rounded),
                            ),
                            ActivityCard(
                              title: 'Relaxing Yoga',
                              icon: Icon(Icons.mediation),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 10), /////////////////

                      // Mindful Articles
                      Container(
                        width: 600,
                        alignment: Alignment.topLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SizedBox(
                            //   height: 10,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                'Mindful Articles',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ArticlePage()));
                                },
                                child: Text('See All')),
                          ],
                        ),
                      ),

                      ////////////
                      ///

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticlePage(),
                              ));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(top: 5),
                          child: Card(
                            // elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    'Assets/mindful_image.jpg', // Replace with your asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Healing Minds: Exploring the Path'),
                                      Icon(Icons.arrow_forward),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      PopUp()
                      // ENDING BODY - END
                    ],
                  ),
                );
              },
              childCount: 1,
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final String title;
  final Icon icon;
  const ActivityCard({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Container(
        height: 120,
        width: 120,
        // color: Colors.blue,
        padding: EdgeInsets.all(9),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.grey[300]!,
              blurRadius: 5,
              // offset: Offset(2, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            icon,
            SizedBox(height: 30),
            Text(
              title,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}

class PopUp extends StatelessWidget {
  const PopUp({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Hayo Mau Kemana Kamu"),
              content: Text("Udah isi test belom?"),
            );
          });
    });
    return Container();
  }
}
