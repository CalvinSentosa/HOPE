import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

/// Class to store one sample data point
class SensorValue {
  /// timestamp of datapoint
  final DateTime time;

  /// value of datapoint
  final num value;

  SensorValue({required this.time, required this.value});

  /// Returns JSON mapped data point
  Map<String, dynamic> toJSON() => {'time': time, 'value': value};

  /// Map a list of data samples to a JSON formatted array.
  static List<Map<String, dynamic>> toJSONArray(List<SensorValue> data) =>
      List.generate(data.length, (index) => data[index].toJSON());
}

/// Obtains heart beats per minute using camera sensor
// ignore: must_be_immutable
class HeartBPMDialog extends StatefulWidget {
  final Widget? centerLoadingWidget;
  final double? cameraWidgetHeight;
  final double? cameraWidgetWidth;
  bool? showTextValues = false;
  final double? borderRadius;
  final void Function(int) onBPM;
  final void Function(SensorValue)? onRawData;
  final int sampleDelay;
  final BuildContext context;
  double alpha = 0.6;
  final Widget? child;

  HeartBPMDialog({
    Key? key,
    required this.context,
    this.sampleDelay = 2000 ~/ 30,
    required this.onBPM,
    this.onRawData,
    this.alpha = 0.8,
    this.child,
    this.centerLoadingWidget,
    this.cameraWidgetHeight,
    this.cameraWidgetWidth,
    this.showTextValues,
    this.borderRadius,
  });

  void setAlpha(double a) {
    if (a <= 0)
      throw Exception("$HeartBPMDialog: smoothing factor cannot be 0 or negative");
    if (a > 1)
      throw Exception("$HeartBPMDialog: smoothing factor cannot be greater than 1");
    alpha = a;
  }

  @override
  _HeartBPPView createState() => _HeartBPPView();
}

class _HeartBPPView extends State<HeartBPMDialog> {
  CameraController? _controller;
  bool _processing = false;
  int currentValue = 0;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void dispose() {
    _deinitController();
    super.dispose();
  }

  void _deinitController() async {
    isCameraInitialized = false;
    if (_controller == null) return;
    await _controller!.dispose();
  }

  Future<void> _initController() async {
    if (_controller != null) return;
    try {
      List<CameraDescription> _cameras = await availableCameras();
      _controller = CameraController(_cameras.first, ResolutionPreset.low,
          enableAudio: false, imageFormatGroup: ImageFormatGroup.yuv420);

      await _controller!.initialize();
      Future.delayed(Duration(milliseconds: 500))
          .then((value) => _controller!.setFlashMode(FlashMode.torch));

      _controller!.startImageStream((image) {
        if (!_processing && mounted) {
          _processing = true;
          _scanImage(image);
        }
      });

      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static const int windowLength = 50;
  final List<SensorValue> measureWindow = List<SensorValue>.filled(windowLength, SensorValue(time: DateTime.now(), value: 0), growable: true);

  void _scanImage(CameraImage image) async {
    double _avg = image.planes.first.bytes.reduce((value, element) => value + element) / image.planes.first.bytes.length;
    measureWindow.removeAt(0);
    measureWindow.add(SensorValue(time: DateTime.now(), value: _avg));

    _smoothBPM(_avg).then((value) {
      if (widget.onRawData != null) {
        widget.onRawData!(SensorValue(time: DateTime.now(), value: _avg));
      }

      Future.delayed(Duration(milliseconds: widget.sampleDelay)).then((onValue) {
        if (mounted) setState(() => _processing = false);
      });
    });
  }

  Future<int> _smoothBPM(double newValue) async {
    double maxVal = 0, _avg = 0;

    measureWindow.forEach((element) {
      _avg += element.value / measureWindow.length;
      if (element.value > maxVal) maxVal = element.value.toDouble();
    });

    double _threshold = (maxVal + _avg) / 2;
    int _counter = 0, previousTimestamp = 0;
    double _tempBPM = 0;

    for (int i = 1; i < measureWindow.length; i++) {
      if (measureWindow[i - 1].value < _threshold && measureWindow[i].value > _threshold) {
        if (previousTimestamp != 0) {
          _counter++;
          _tempBPM += 60000 / (measureWindow[i].time.millisecondsSinceEpoch - previousTimestamp);
        }
        previousTimestamp = measureWindow[i].time.millisecondsSinceEpoch;
      }
    }

    if (_counter > 0) {
      _tempBPM /= _counter;
      _tempBPM = (1 - widget.alpha) * currentValue + widget.alpha * _tempBPM;
      setState(() {
        currentValue = _tempBPM.toInt();
      });
      widget.onBPM(currentValue);
    }

    return currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isCameraInitialized
          ? Column(
              children: [
                Container(
                  constraints: BoxConstraints.tightFor(
                    width: widget.cameraWidgetWidth ?? 100,
                    height: widget.cameraWidgetHeight ?? 130,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(widget.borderRadius ?? 10),
                    child: _controller!.buildPreview(),
                  ),
                ),
                if (widget.showTextValues == true) ...{
                  Text(currentValue.toStringAsFixed(0)),
                } else
                  SizedBox(),
                widget.child == null ? SizedBox() : widget.child!,
              ],
            )
          : Center(
              child: widget.centerLoadingWidget != null
                  ? widget.centerLoadingWidget
                  : CircularProgressIndicator(),
            ),
    );
  }
}
