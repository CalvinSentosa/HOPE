// import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:project_android_studio/Home/article.dart';
import 'package:project_android_studio/Home/home_page.dart';
import 'package:project_android_studio/Profile/profilepage.dart';
import 'package:project_android_studio/Services/provider.dart';
import 'package:project_android_studio/Test/questionpage.dart';
import 'package:provider/provider.dart';

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
  final GlobalKey<HomePageState> homePageKey = GlobalKey<HomePageState>();
  final bool _pinned = true;
  bool _isSubmitted = true;
// [SliverAppBar]s are typically used in [CustomScrollView.slivers], which in
// turn can be placed in a [Scaffold.body].
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    userProvider.loadUserData();
    final userData = userProvider.userData;
    // print(userData);
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: _pinned,
            expandedHeight: 180.0,
            backgroundColor: Colors.brown,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                "Hi, ${userData?['name']?.toString() ?? 'User'}",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
              background: Container(
                padding: const EdgeInsets.all(16.0),
                margin: EdgeInsets.only(top: 30),
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
                            builder: (context) => ProfilePage());
                      },
                      child: const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(
                            'assets/Profile_test.jpg'), // Replace with your asset
                      ),
                    ),

                    const SizedBox(width: 16),
                    // Greeting and Progress
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          // Text("Hi, Calvin"),
                          Text(
                            'Care for Your Mind, One Step at a Time...',
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 8),
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
                              SizedBox(width: 10),
                              Text(
                                '80%',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                'Sleep 😴',
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
                              SizedBox(width: 10),
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
                      const SizedBox(height: 20),

                      // AI Therapy Chatbot Section
                      const Padding(
                        padding: EdgeInsets.only(left: 18),
                        child: Text(
                          'AI Therapy Chatbot',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          homePageKey.currentState?.changeTab(1);
                        },
                        child: Center(
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 150,
                                margin: EdgeInsets.only(
                                    left: 12, right: 12, top: 5),
                                // padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFD3DDBC),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: Image.asset(
                                        'assets/HIRO_nobg.png', // Replace with your asset
                                        // fit: BoxFit.cover,
                                        scale: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 30,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Chat with ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "H.I.R.O",
                                          style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Positioned(
                                  bottom: -25,
                                  left:
                                      (MediaQuery.of(context).size.width / 2) -
                                          30,
                                  child: GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () {
                                      homePageKey.currentState?.changeTab(1);
                                      // showDialog(
                                      //     context: context,
                                      //     builder: (context) => ChatPage());
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(15),
                                      decoration: BoxDecoration(
                                          color: Color(0xFFFFD5B5),
                                          shape: BoxShape.circle),
                                      child: Icon(
                                        CupertinoIcons.chat_bubble_text_fill,
                                        color: Color(0xFFED7E1C),
                                      ),
                                    ),
                                  ))
                            ],
                          ),
                        ),
                      ),
                      // End of AI Chatbot Section
                      const SizedBox(height: 20),

                      // Suggested Activities
                      Container(
                        child: Padding(
                          padding: EdgeInsets.only(left: 18),
                          child: Text(
                            'Suggested Activity',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      ),

                      //////////////////////////////////
                      ///
                      Container(
                        margin: EdgeInsets.only(left: 3, right: 3),
                        width: double.infinity,
                        height: 130,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ActivityCard(
                                title: 'Daily Meditation',
                                icon: Icon(
                                  FontAwesome.leaf,
                                  color: Colors.green,
                                ),
                              ),
                              ActivityCard(
                                title: 'Gratefulness Journaling',
                                icon: Icon(
                                  CupertinoIcons.book,
                                  color: Colors.blue,
                                ),
                              ),
                              ActivityCard(
                                title: 'Music for the Soul',
                                icon: Icon(
                                  CupertinoIcons.music_note,
                                  color: Colors.purple,
                                ),
                              ),
                              ActivityCard(
                                title: 'Daily Run',
                                icon: Icon(CupertinoIcons.speedometer),
                              ),
                              ActivityCard(
                                title: 'Comedy For Life',
                                icon: Icon(CupertinoIcons.smiley),
                              ),
                              ActivityCard(
                                title: 'Relaxing Yoga',
                                icon: Icon(CupertinoIcons.eye),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /////////////////

                      // Mindful Articles
                      Container(
                        width: double.infinity,
                        height: 40,
                        alignment: Alignment.topLeft,
                        margin: EdgeInsets.only(right: 8, left: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Padding(
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
                              child: Text('See All'),
                            ),
                          ],
                        ),
                      ),

                      ////////////
                      ///
                      ///
                      ///

                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticlePage(),
                              ));
                        },
                        child: Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: Card(
                            // elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(16),
                                  ),
                                  child: Image.asset(
                                    'assets/mindful_image.jpg', // Replace with your asset
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Healing Minds: Exploring the Path'),
                                      Icon(CupertinoIcons.arrow_right),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      _isSubmitted ? Container() : PopUp()

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
  const ActivityCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Container(
        height: 120,
        width: 120,
        // color: Colors.blue,
        padding: const EdgeInsets.all(9),
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
            const SizedBox(height: 30),
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
              title: Text("Test Reminder"),
              content: Container(
                child: Row(
                  children: [
                    Text("Kamu belum isi test ya?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionPage()));
                      },
                      child: Text("Yuk isi tes!"),
                    )
                  ],
                ),
              ),
            );
          });
    });
    return Container();
  }
}
