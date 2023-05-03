import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //allows the SystemNavigator to work

import 'main_menu.dart';
//importing the main menu file so the navigator and button
//will work despite the two screens being in different files

/*void main() {
  runApp(const MyApp());
}*/

class GameOverScreen extends StatelessWidget{
  const GameOverScreen({super.key});
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       body: Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

              const Text(
              'GAME OVER',
              style: TextStyle(fontSize: 68, fontWeight: FontWeight.bold),
            ),
             const SizedBox(height: 60),
             const Text(
               'Your Score: 0',
               style: TextStyle(fontSize: 55),
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