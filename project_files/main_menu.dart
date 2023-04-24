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
              const SizedBox(
                //alignment: Alignment.topCenter,
                child: Text(
                  'TAP IT',
                  style: TextStyle(fontSize: 150),
                ),
              ),

               Container(
                 alignment: Alignment.bottomCenter,
                 child: SizedBox(
                 width: 200.0,
                 height: 200.0,
                  child: ElevatedButton(
                   onPressed: () {},
                   style: ButtonStyle(
                       shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(200)//makes the button a circle
                         ),
                       )
                   ),
                   child: const Text(
                     'PLAY',
                     style: TextStyle(fontSize: 60),
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