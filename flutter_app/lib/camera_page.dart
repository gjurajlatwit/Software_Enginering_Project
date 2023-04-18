import 'dart:convert';
//import 'dart:io';
//import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app/resources.dart';
import 'package:http/http.dart' as http;

class CameraPage extends StatefulWidget {
  final List<CameraDescription>? cameras;
  const CameraPage({this.cameras, Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late CameraController controller;
  XFile? pictureFile;

  //Future pixcall() async {}

  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras![0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: SizedBox(
              height: 300,
              width: 300,
              child: CameraPreview(controller),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () async {
              pictureFile = await controller.takePicture();
              setState(() {});
              getData(Future.value(pictureFile!.readAsBytes()));  // Testing methods. This converts image to bytes and sends it to the Mathpix API 
            },
            child: const Text('Capture Image'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/solution');
            },
            child: const Text('Solution'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/resources'),
            child: const Text('Resources'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/history'),
            child: const Text('Problem History'),
          ),
        ),
        if (pictureFile != null)
          Image.network(
            pictureFile!.path,
            height: 200,
          ),
          
        //Android/iOS
        // Image.file(File(pictureFile!.path)))
      ],
    );
  }
}


void getData(Future<List<int>> image) async {
  String url = 'https://api.mathpix.com/v3/text';
  String apiId = '';
  String apiKey = '';
  String imageData = base64Encode(await image);  // Encodes image in base64

  Map<String, String> headers = {
    'content-type': 'application/json',
    'app_id': apiId,
    'app_key': apiKey,
  };  

  String body = jsonEncode({
    'src': 'data:image/jpeg;base64, $imageData',
    'formats': ['text'],
  });

  http.Response response = await http.post(Uri.parse(url), headers: headers, body: body);  // Makes request to Mathpix

  Map<String, dynamic> json = jsonDecode(response.body);  // Decodes response to json
  String text = json['text'];
  print(text);  // Prints Text to Console
  print("Sent Data");
}
