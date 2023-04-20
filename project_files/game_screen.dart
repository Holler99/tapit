import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tap-it Game',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tap-it Game'),
        ),
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'High Score: 0',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text(
                'Tap-it!',
                style: TextStyle(fontSize: 36),
              ),
            ),
          ],
        ),
        )
      ),
    );
  }
}