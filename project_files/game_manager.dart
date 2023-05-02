import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'game_over.dart';

class GameManager {
  static const List<String> _commands = ['tap', 'shake', 'shout'];
  static const int _commandDurationSeconds = 5;

  int score = 0;
  String currentCommand = _getRandomCommand();
  Timer? commandTimer;
  bool _isListening = false;

  void startGame(BuildContext context) {
    score = 0;
    currentCommand = _getRandomCommand();
    _startCommandTimer(context);
    _startListening();
  }

  void stopGame() {
    commandTimer?.cancel();
    _stopListening();
  }

  void checkUserInput(String input, BuildContext context) {
    if (input == currentCommand) {
      score++;
      currentCommand = _getRandomCommand();
      _restartCommandTimer(context);
    } else {
      stopGame();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GameOverScreen(score: score)),
      );
    }
  }

  void _startCommandTimer(BuildContext context) {
    commandTimer = Timer(Duration(seconds: _commandDurationSeconds), () {
      stopGame();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => GameOverScreen(score: score)),
      );
    });
  }

  void _restartCommandTimer(BuildContext context) {
    commandTimer?.cancel();
    _startCommandTimer(context);
  }

  static String _getRandomCommand() {
    final randomIndex = _getRandomInt(0, _commands.length - 1);
    return _commands[randomIndex];
  }

  static int _getRandomInt(int min, int max) {
    final random = Random();
    return min + random.nextInt(max - min + 1);
  }

  void _startListening() {
    if (!_isListening) {
      _isListening = true;
      accelerometerEvents.listen((AccelerometerEvent event) {
        if (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12) {
          _onShakeDetected();
        }
      });
      userAccelerometerEvents.listen((UserAccelerometerEvent event) {
        if (event.x.abs() > 12 || event.y.abs() > 12 || event.z.abs() > 12) {
          _onShakeDetected();
        }
      });
      gyroscopeEvents.listen((GyroscopeEvent event) {
        if (event.x.abs() > 3 || event.y.abs() > 3 || event.z.abs() > 3) {
          _onShakeDetected();
        }
      });
    }
  }

  void _stopListening() {
    if (_isListening) {
      _isListening = false;
      accelerometerEvents.drain();
      userAccelerometerEvents.drain();
      gyroscopeEvents.drain();
    }
  }

  void _onShakeDetected() {
    if (currentCommand == 'shake') {
      score++;
      currentCommand = _getRandomCommand();
    }
  }
}
