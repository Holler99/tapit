import 'package:flutter/material.dart';

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
      home: GameOverScreen(),
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
                   Navigator.pop(context);
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
}