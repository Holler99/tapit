import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              const Text(//contains the TAP IT header text
                  'TAP IT',
                  style: TextStyle(fontSize: 120),
                ),

              SizedBox(//this controls how big the button will be
                 width: 300.0,
                 height: 300.0,
                  child: ElevatedButton(
                   onPressed: () {},
                   style: ButtonStyle(
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(//makes the button a circle
                             borderRadius: BorderRadius.circular(200)
                         ),
                       )
                   ),
                   child: const Text(//play text in the button
                     'PLAY',
                     style: TextStyle(fontSize: 100),
                   ),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}