import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //allows the SystemNavigator to work

import 'main_menu.dart';
//importing the main menu file so the navigator and button
//will work despite the two screens being in different files

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,//this isn't working for some reason. works in the other two files, but not this one
      //^ this gets rid of the debug tag in the top right of the screen
      home: GameOverScreen(),//had to add this so the navigator would work
      //because the class needed to be a descendant of
      //the navigator and my app
    );
  }
}

class GameOverScreen extends StatelessWidget{
  const GameOverScreen({super.key});
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     home: Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

              const Text(
              'GAME OVER',
              style: TextStyle(fontSize: 65, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 60),
             const Text(
               'Your Score: 0',
               style: TextStyle(fontSize: 50),
             ),
               const SizedBox(height: 100),
             SizedBox(//menu button, goes back to main menu
               width: 160,
               height: 160,
               child: ElevatedButton(
                 onPressed: () {
                   // Navigate back to the first screen by popping the current route
                   // off the stack.
                   _navigateToPreviousScreen(context);
                   //will go to next screen when the button is pressed

                 },
                 style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(//makes the button a circle
                           borderRadius: BorderRadius.circular(200)
                       ),
                     )
                 ),
                 child: const Text(
                   'MENU',
                   style: TextStyle(fontSize: 45),
                 ),
               ),
             ),

             const SizedBox(height: 10),

             SizedBox(//exit button, exits the app
               width: 160,
               height: 160,
               child: ElevatedButton(
                 onPressed: () {
                   // Closes the app
                   SystemNavigator.pop();
                 },
                 style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                       RoundedRectangleBorder(//makes the button a circle
                           borderRadius: BorderRadius.circular(200)
                       ),
                     )
                 ),
                 child: const Text(
                   'EXIT',
                   style: TextStyle(fontSize: 45),
                 ),
               ),
             ),

          ],
        ),
      ),
    ),
  );
}

  void _navigateToPreviousScreen(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => const MainMenu()));
    //function that allows the navigator to access and display the next screen
  }
}