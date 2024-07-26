import 'dart:async';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:newapps/permission_utils.dart';
import 'package:pedometer/pedometer.dart';
import 'package:newapps/homepage.dart';
import 'package:newapps/step_data_storage.dart';
import 'package:intl/intl.dart'; // For date formatting

class PedometerPage extends StatefulWidget {
  const PedometerPage({super.key});

  @override
  _PedometerPageState createState() => _PedometerPageState();
}

class _PedometerPageState extends State<PedometerPage> {
  String _stepCount = '0';
  StreamSubscription<StepCount>? _stepCountSubscription;
  final Logger _logger = Logger();

  static const int averageStepsPerMinute = 100;

  @override
  void initState() {
    super.initState();
    _initializePedometer();
  }

  void _initializePedometer() async {
    await requestPermission();

    _stepCountSubscription = Pedometer.stepCountStream.listen(
      (StepCount event) async {
        setState(() {
          _stepCount = event.steps.toString();
        });
        _logger.i('Step count updated: ${event.steps}');

        // Calculate and save daily data
        String today = DateFormat('yyyy-MM-dd').format(DateTime.now());
        int steps = event.steps;
        double minutes = steps / averageStepsPerMinute;
        double hours = minutes / 60;

        await StepDataStorage.saveStepData(today, steps, hours);
      },
      onError: (error) {
        _logger.e('Error: $error');
      },
    );
  }

  @override
  void dispose() {
    _stepCountSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return HomePage(stepCountValue: _stepCount);
  }
}
