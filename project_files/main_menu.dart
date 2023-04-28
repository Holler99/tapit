import 'package:flutter/material.dart';

import 'game_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainMenu(),
    );
  }
}

  class MainMenu extends StatelessWidget{
    const MainMenu({super.key});
    @override
    Widget build(BuildContext context) {
      return Scaffold(
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
                   onPressed: () {
                     _navigateToNextScreen(context);
                   },
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
      );
  }

  void _navigateToNextScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const GameScreen()));
  }
}
