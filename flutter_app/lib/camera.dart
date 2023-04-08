import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/camera_page.dart';

class Camera extends StatelessWidget {
  const Camera({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text('Camera'),
        elevation: 0,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await availableCameras().then(
              (value) => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CameraPage(cameras: value,),
                ),
              ),
            );
          },
          child: const Text('Launch Camera'),
        ),
      ),
    );
  }
}