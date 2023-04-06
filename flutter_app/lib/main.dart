import 'package:flutter/material.dart';
import 'package:flutter_app/loading.dart';
import 'package:flutter_app/home.dart';
import 'package:flutter_app/resources.dart';
import 'package:flutter_app/solution.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/home',
      routes: {
        '/': (context) => Loading(),
        '/home': (context) => Home(),
        '/resources': (context) => MyApp(),
        '/solution': (context) => Solution()
      },
    ));
