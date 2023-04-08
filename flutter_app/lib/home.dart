import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: <Widget>[
              const Text("Home Page"),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/resources');
                },
                child: const Text("Resource page"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/solution');
                }, 
                child: const Text('Solution page')
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/camera');
                }, 
                child: const Text('Camera Page')
              )
            ]),
        ),
      )
    );
  }
}