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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Your Score!: 0',
              style: TextStyle(fontSize: 40),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              // Navigate back to the first screen by popping the current route
              // off the stack.
              Navigator.pop(context);

},
              child: const Text(
                'Back To Menu',
                style: TextStyle(fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    );