import 'package:flutter/material.dart';

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
      debugShowCheckedModeBanner: false,
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
              'GAME OVER!',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
             const Text(
               'Your Score!: 0',
               style: TextStyle(fontSize: 40),
             ),
               const SizedBox(height: 20),
             SizedBox(//menu button, goes back to main menu
               width: 150,
               height: 150,
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
                   style: TextStyle(fontSize: 36),
                 ),
               ),
             ),

             const SizedBox(height: 10),

             SizedBox(//exit button, exits the app
               width: 150,
               height: 150,
               child: ElevatedButton(
                 onPressed: () {
                   // Close the app
                   // SystemNavigator.pop();
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
                   style: TextStyle(fontSize: 36),
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