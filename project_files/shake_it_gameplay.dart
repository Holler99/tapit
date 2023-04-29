import 'package:sensors/sensors.dart';

class ShakeIt {
  void listenForShake(Function onShake) {
    accelerometerEvents.listen((AccelerometerEvent event) {
      // Check for shake event
      if (event.x.abs() > 10 || event.y.abs() > 10 || event.z.abs() > 10) {
        // Call the onShake function provided by the game manager
        onShake();
      }
    });
  }
}