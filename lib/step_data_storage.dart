import 'package:shared_preferences/shared_preferences.dart';

class StepDataStorage {
  static Future<void> saveStepData(String date, int steps, double hours) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('$date-steps', steps);
    await prefs.setDouble('$date-hours', hours);
  }

  static Future<int> getStepData(String date) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('$date-steps') ?? 0;
  }

  static Future<double> getWalkingHours(String date) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('$date-hours') ?? 0.0;
  }
}
