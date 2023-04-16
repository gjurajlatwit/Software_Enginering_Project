import 'package:flutter/material.dart';
import 'package:flutter_app/camera.dart';
import 'package:flutter_app/loading.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/resources.dart';
import 'package:flutter_app/solution.dart';
import 'package:camera/camera.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/camera',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/resources': (context) => MyApp(),
        '/solution': (context) => Solution(),
        '/camera': (context) => Camera(),
      },
    ));
