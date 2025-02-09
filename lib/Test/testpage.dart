import 'dart:async';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'questionpage.dart'; // Pastikan file ini ada

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({Key? key}) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    WidgetsFlutterBinding.ensureInitialized();
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    _initializeControllerFuture = _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF7F4F2),
      appBar: AppBar(
        title: Text('Detect BPM'),
        backgroundColor: Color(0xFFF7F4F2),
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        elevation: 0,
      ),
      body: _initializeControllerFuture == null
          ? Center(child: CircularProgressIndicator())
          : FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.orange.withOpacity(0.1),
                                size: 190,
                              ),
                            ),
                            Transform.scale(
                              scale: 1.2,
                              child: Icon(
                                Icons.favorite,
                                color: Colors.orange.withOpacity(0.3),
                                size: 150,
                              ),
                            ),
                            Icon(
                              Icons.favorite,
                              color: Colors.orange,
                              size: 100,
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        ClipOval(
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: CameraPreview(_controller),
                          ),
                        ),
                        SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            // Langsung navigasi ke halaman QuestionPage
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => QuestionPage(),
                              ),
                            );
                          },
                          child: Text("Start BPM Detection"),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
    );
  }
}
