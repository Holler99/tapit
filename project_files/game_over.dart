import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
   return MaterialApp(
     title: 'Game Over',
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
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Close the app
               // SystemNavigator.pop();
              },
              child: const Text(
                'Exit',
                style: TextStyle(fontSize: 36),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
}