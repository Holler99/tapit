import 'package:sensors_plus/sensors_plus.dart';
import 'game_manager.dart'
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