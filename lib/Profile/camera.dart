import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController _cameraController;
  late List<CameraDescription> _cameras;
  bool _isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    // Fetch available cameras
    _cameras = await availableCameras();

    if (_cameras.isNotEmpty) {
      // Initialize camera controller
      _cameraController = CameraController(
        _cameras[0], // Use the first available camera
        ResolutionPreset.high,
      );

      try {
        await _cameraController.initialize();
        setState(() {
          _isCameraInitialized = true;
        });
      } catch (e) {
        debugPrint("Error initializing camera: $e");
      }
    } else {
      debugPrint("No cameras available");
    }
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Preview'),
        leading: IconButton(
          icon: const Icon(CupertinoIcons.arrow_left,
                  color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: _isCameraInitialized
          ? CameraPreview(_cameraController) // Display the live camera feed
          : const Center(
              child: CircularProgressIndicator(), // Show a loader while initializing
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (_cameraController.value.isInitialized) {
            try {
              // Capture an image
              final image = await _cameraController.takePicture();
              debugPrint("Image saved at: ${image.path}");
              // Optionally, you can navigate to another screen to view the captured image
            } catch (e) {
              debugPrint("Error capturing image: $e");
            }
          }
        },
        child: const Icon(CupertinoIcons.camera),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CameraApp(),
  ));
}
