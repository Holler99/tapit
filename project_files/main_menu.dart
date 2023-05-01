import 'package:flutter/material.dart';

import 'game_screen.dart';
//importing the game screen file so the navigator and button
//will work despite the two screens being in different files

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //^ this gets rid of the debug tag in the top right of the screen
      home: MainMenu(),//had to add this so the navigator would work
      //because the class needed to be a descendant of
      //the navigator and my app
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
                  style: TextStyle(fontSize: 120, fontWeight: FontWeight.bold),
                ),

              SizedBox(//this controls how big the button will be
                 width: 300.0,
                 height: 300.0,
                  child: ElevatedButton(
                   onPressed: () {
                     _navigateToNextScreen(context);
                     //will go to next screen when the button is pressed
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
    //function that allows the navigator to access and display the next screen
  }
}
