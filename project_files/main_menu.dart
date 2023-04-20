import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap-it Menu',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tap-it Menu'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(
                'TAP IT',
                style: TextStyle(fontSize: 50),
                //alignment: Alignment.topCenter,

              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  'PLAY',
                  style: TextStyle(fontSize: 36),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}