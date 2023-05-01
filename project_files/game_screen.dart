import 'package:flutter/material.dart';

//import 'game_over.dart';
//^ ,not needed now but it will be when functionality is added
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        title: 'Tap-it Game',
      debugShowCheckedModeBanner: false,
      //^ this gets rid of the debug tag in the top right of the screen
    );
  }
}

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Tap-it Game'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'High Score: 0',
              style: TextStyle(fontSize: 50),
            ),
            const SizedBox(height: 20),

            SizedBox(//controls the button size
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
                child: const Text(//text in the button
                'Tap-it!',
                style: TextStyle(fontSize: 90),
              ),
            ),
            ),
          ],
        ),
        )
      );
  }
} //TEST