import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'dart:async';
import 'package:project_android_studio/Test/questionPage.dart';

class HeartBPMDetector extends StatefulWidget {
  final Function(int) onBPMDetected;

  const HeartBPMDetector({Key? key, required this.onBPMDetected})
      : super(key: key);

  @override
  _HeartBPMDetectorState createState() => _HeartBPMDetectorState();
}

class _HeartBPMDetectorState extends State<HeartBPMDetector> {
  CameraController? _controller;
  late List<CameraDescription> _cameras;
  bool _isDetecting = false;
  Timer? _timer;
  int _bpm = 0;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    _cameras = await availableCameras();
    _controller = CameraController(_cameras.first, ResolutionPreset.low);
    await _controller!.initialize();
    setState(() {});
    _startBPMDetection();
  }

  void _startBPMDetection() {
    if (_isDetecting) return;
    _isDetecting = true;
    _timer = Timer(Duration(seconds: 5), () {
      setState(() {
        _bpm = _simulateBPMCalculation();
        _isDetecting = false;
      });
      widget.onBPMDetected(_bpm);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuestionPage(bpm: _bpm)),
      );
    });
  }

  int _simulateBPMCalculation() {
    return 75 + (DateTime.now().second % 60); // Simulasi BPM antara 75-95
  }

  @override
  void dispose() {
    _controller?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4F2),
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: Colors.white,
        // leading: IconButton(onPressed: (){
        //   Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(key: homePageKey,)));
        // }, icon: Icon(CupertinoIcons.arrow_left)),
        title: const Text(
          'Heart BPM Detector',
          style: TextStyle(
            color: Color(0xFF4F3422),
            fontWeight: FontWeight.bold, // Membuat teks menjadi tebal (bold)
          ),
        )),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _controller == null || !_controller!.value.isInitialized
              ? CircularProgressIndicator()
              : AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: CameraPreview(_controller!),
                ),
          SizedBox(height: 20),
          Text('Detecting BPM...', style: TextStyle(fontSize: 18)),
          SizedBox(height: 20),
          _bpm > 0
              ? Text('BPM: $_bpm',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              : Container(),
        ],
      ),
    );
  }
}
