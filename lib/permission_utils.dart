// permission_utils.dart
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPermission() async {
  if (await Permission.activityRecognition.isDenied) {
    await Permission.activityRecognition.request();
  }
}
