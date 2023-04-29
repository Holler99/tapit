import 'package:flutter/material.dart';
import 'package:sensors/sensors.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:vibration/vibration.dart';
import 'dart:async';
import 'game_over.dart';
import 'tap_it_gameplay.dart';
import 'shake_it_gameplay.dart';
import 'shout_it.dart';

class GameManager extends StatefulWidget {
  const GameManager({Key? key}) : super(key: key);

  @override
  _GameManagerState createState() => _GameManagerState();
}

class _GameManagerState extends State<GameManager> {
  String currentCommand = "";
  stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => GameOverScreen(),
        ),
      );
    });
  }

  void resetTimer() {
    _timer?.cancel();
    startTimer();
  }

  void checkCommand(String command) {
    resetTimer();
    setState(() {
      currentCommand = command;
    });
    switch (currentCommand) {
      case "tap it":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TapItScreen()),
        );
        break;
      case "shake it":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShakeItScreen()),
        );
        break;
      case "shout it":
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ShoutItScreen()),
        );
        break;
      default:
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => GameOverScreen(),
          ),
        );
        break;
    }
  }

  void startListening() {
    _speech.listen(
        onResult: (result) {
          if (result.finalResult) {
            checkCommand(result.recognizedWords.toLowerCase());
            stopListening();
          }
        },
        listenFor: Duration(seconds: 5),
        pauseFor: Duration(seconds: 5),
        onSoundLevelChange: null,
        cancelOnError: true,
        localeId: 'en_US',
        onDevice: true,
        partialResults: false,
        speechMode: stt.SpeechMode.normal,
        listenMode: stt.ListenMode.confirmation);
    setState(() {
      _isListening = true;
    });
  }

  void stopListening() {
    _speech.stop();
    setState(() {
      _isListening = false;
    });
  }

  void startAccelerometer() {
    accelerometerEvents.listen((AccelerometerEvent event) {
      if (event.x > 10) {
        Vibration.vibrate(duration: 500);
        checkCommand("shake it");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startAccelerometer();
    return Scaffold(
      appBar: AppBar(
        title: const Text('TAP IT'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          const Text(
            'Say the command:',
            style: TextStyle(fontSize: 20),
          ),

