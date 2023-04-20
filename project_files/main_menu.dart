import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap-it Menu',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tap-it Menu'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'TAP IT',
              style: TextStyle(fontSize: 50),
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
    );
  }
}