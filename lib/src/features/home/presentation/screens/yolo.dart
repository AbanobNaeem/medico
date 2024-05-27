import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vision/flutter_vision.dart';
import 'package:xpert/src/app/app.dart';
import 'package:xpert/src/core/resources/assets_manager.dart';
import 'package:xpert/src/core/resources/color_manager.dart';
import 'package:xpert/src/core/resources/constants.dart';
import 'package:xpert/src/core/resources/font_manager.dart';
import 'package:xpert/src/core/resources/styles_manager.dart';
import 'package:xpert/src/core/resources/utils.dart';
// import 'package:flutter_tts/flutter_tts.dart';

class YoloScreen extends StatefulWidget {
  const YoloScreen({
    super.key,
    required this.gpu,
    required this.resolutionPreset,
    required this.labels,
    required this.modelPath,
    this.numThreads = 1,
    this.iouThreshold = 0.4,
    this.confThreshold = 0.4,
    this.classThreshold = 0.5,
  });

  final bool gpu;
  final ResolutionPreset resolutionPreset;
  final String labels;
  final String modelPath;
  final int numThreads;

  final double iouThreshold;
  final double confThreshold;
  final double classThreshold;

  @override
  State<YoloScreen> createState() => _YoloScreenState();
}

class _YoloScreenState extends State<YoloScreen> with WidgetsBindingObserver {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  late FlutterVision vision;
  // late FlutterTts tts;
  late List<Map<String, dynamic>> yoloResults;

  CameraImage? cameraImage;
  bool isLoaded = false;
  bool isDetecting = false;

  String? previousResult;
  DateTime previousSpeechTime = DateTime.now();
  Duration repeatDuration = const Duration(seconds: 5);

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    cameraController?.dispose();
    vision.closeYoloModel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      cameraController!.dispose();
    } else if (state == AppLifecycleState.resumed) {
      _initializeCameraController();
    }
  }

  Future<void> init() async {
    cameras = await availableCameras();
    vision = FlutterVision();
    // tts = FlutterTts();

    _initializeCameraController();

    await loadYoloModel();

    setState(() {
      isLoaded = true;
      isDetecting = false;
      yoloResults = [];
    });
  }

  void _initializeCameraController() async {
    try {
      cameraController = CameraController(cameras[0], widget.resolutionPreset);
      await cameraController!.initialize();
      showSuccessToast("Camera initialized: ${cameraController!.description}",
          navigatorKey.currentContext!);
      setState(() {});
    } catch (error) {
      showErrorToast(
          "Error initializing camera: $error", navigatorKey.currentContext!);
    }
  }

  Future<void> startDetection() async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      showWarningToast("Camera not initialized", navigatorKey.currentContext!);
      return;
    }

    try {
      setState(() {
        isDetecting = true;
      });
      if (cameraController!.value.isStreamingImages) {
        return;
      }
      await cameraController!.startImageStream((image) async {
        if (isDetecting) {
          cameraImage = image;
          await yoloOnFrame(image);
        }
      });
    } catch (error) {
      showErrorToast(
          "Error starting image stream: $error", navigatorKey.currentContext!);
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    if (!isLoaded ||
        cameraController == null ||
        !cameraController!.value.isInitialized) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AssetsManager.logo),
            Center(
              child: Text(
                textAlign: TextAlign.center,
                "Model not loaded or camera\nnot initialized, waiting...",
                style: StyleManager.getSemiBoldStyle(
                    color: ColorManager.primary, fontSize: FontSize.s18),
              ),
            ),
          ],
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            AspectRatio(
              aspectRatio: cameraController!.value.aspectRatio,
              child: CameraPreview(cameraController!),
            ),
            ...displayBoxesAroundRecognizedObjects(size),
            Positioned(
              bottom: 75,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 80.h,
                width: 80.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 5.w,
                      color: Colors.white,
                      style: BorderStyle.solid),
                ),
                child: isDetecting
                    ? IconButton(
                        onPressed: () async {
                          stopDetection();
                        },
                        icon: const Icon(
                          Icons.stop,
                          color: Colors.red,
                        ),
                        iconSize: 50,
                      )
                    : IconButton(
                        onPressed: () async {
                          await startDetection();
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                        ),
                        iconSize: 50,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> loadYoloModel() async {
    await vision.loadYoloModel(
      labels: widget.labels,
      modelPath: widget.modelPath,
      modelVersion: AppConstants.yolov8,
      numThreads: widget.numThreads,
      useGpu: widget.gpu,
    );
    setState(() {
      isLoaded = true;
    });
  }

  Future<void> yoloOnFrame(CameraImage cameraImage) async {
    final result = await vision.yoloOnFrame(
      bytesList: cameraImage.planes.map((plane) => plane.bytes).toList(),
      imageHeight: cameraImage.height,
      imageWidth: cameraImage.width,
      iouThreshold: widget.iouThreshold,
      confThreshold: widget.confThreshold,
      classThreshold: widget.classThreshold,
    );
    if (result.isNotEmpty) {
      setState(() {
        yoloResults = result;
      });
    }
  }

  Future<void> stopDetection() async {
    setState(() {
      isDetecting = false;
      yoloResults.clear();
    });
  }

  speak(Map<String, dynamic> result) {
    String currentResult = result['tag'].toString();
    DateTime currentTime = DateTime.now();

    if (currentResult != previousResult ||
        currentTime.difference(previousSpeechTime) >= repeatDuration) {
      // tts.speak(currentResult);
      previousResult = currentResult;
      previousSpeechTime = currentTime;
    }
  }

  List<Widget> displayBoxesAroundRecognizedObjects(Size screen) {
    if (yoloResults.isEmpty) return [];
    double factorX = screen.width / (cameraImage?.height ?? 1);
    double factorY = screen.height / (cameraImage?.width ?? 1);

    Color colorPick = const Color.fromARGB(255, 50, 233, 30);

    return yoloResults.map((result) {
      double objectX = result["box"][0] * factorX;
      double objectY = result["box"][1] * factorY;
      double objectWidth = (result["box"][2] - result["box"][0]) * factorX;
      double objectHeight = (result["box"][3] - result["box"][1]) * factorY;

      speak(result);

      return Positioned(
        left: objectX,
        top: objectY,
        width: objectWidth,
        height: objectHeight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: Colors.pink, width: 2.0),
          ),
          child: Text(
            "${result['tag']} ${(result['box'][4] * 100)}",
            style: TextStyle(
              background: Paint()..color = colorPick,
              color: const Color.fromARGB(255, 115, 0, 255),
              fontSize: 18.0,
            ),
          ),
        ),
      );
    }).toList();
  }
}
