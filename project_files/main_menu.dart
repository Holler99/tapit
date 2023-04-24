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
        body: Center(
          child: Column(
            children: <Widget>[
              Container(//contains the tap it text
                alignment: Alignment.center,
                  child: const Text(
                  'TAP IT',
                  style: TextStyle(fontSize: 120),
                ),
              ),

               Container(//contains the play button
                 alignment: Alignment.bottomCenter,
                 child: SizedBox(
                 width: 300.0,
                 height: 300.0,
                  child: ElevatedButton(
                   onPressed: () {},
                   style: ButtonStyle(
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(200)//makes the button a circle
                         ),
                       )
                   ),
                   child: const Text(//play text in the button
                     'PLAY',
                     style: TextStyle(fontSize: 100),
                   ),
                 ),
               ),
               )
            ],
          ),
        ),
      ),
    );
  }
}