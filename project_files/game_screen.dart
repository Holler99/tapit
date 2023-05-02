import 'package:flutter/material.dart';
import 'game_manager.dart';
import 'game_over.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final _gameManager = GameManager();

  @override
  void initState() {
    super.initState();
    _gameManager.startGame(context);
  }

  @override
  void dispose() {
    _gameManager.stopGame();
    super.dispose();
  }

  void _onTapButtonPressed() {
    _gameManager.checkUserInput('tap', context);
  }

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
            Text(
              'Score: ${_gameManager.score}',
              style: const TextStyle(fontSize: 80),
            ),
            if (_gameManager.currentCommand == 'tap')
              SizedBox(
                width: 300.0,
                height: 300.0,
                child: ElevatedButton(
                  onPressed: _onTapButtonPressed,
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(200),
                      ),
                    ),
                  ),
                  child: const Text(
                    'TAP-IT!',
                    style: TextStyle(fontSize: 80),
                  ),
                ),
              ),
            if (_gameManager.currentCommand == 'shake')
              Text(
                'SHAKE YOUR PHONE!',
                style: const TextStyle(fontSize: 80),
              ),
            if (_gameManager.currentCommand == 'shout')
              Text(
                'SHOUT IT!',
                style: const TextStyle(fontSize: 80),
              ),
          ],
        ),
      ),
    );
  }
}
