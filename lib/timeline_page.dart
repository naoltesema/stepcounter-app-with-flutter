import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';
import 'package:newapps/step_data_storage.dart';
import 'package:intl/intl.dart';

class TimelinePage extends StatefulWidget {
  const TimelinePage({super.key});

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  List<Map<String, dynamic>> _events = [];

  @override
  void initState() {
    super.initState();
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    List<Map<String, dynamic>> events = [];
    DateTime now = DateTime.now();
    for (int i = 6; i >= 0; i--) {
      DateTime date = now.subtract(Duration(days: i));
      String formattedDate = DateFormat('yyyy-MM-dd').format(date);
      int steps = await StepDataStorage.getStepData(formattedDate);
      double hours = await StepDataStorage.getWalkingHours(formattedDate);

      events.add({
        'date': formattedDate,
        'steps': steps,
        'hours': hours,
      });
    }
    setState(() {
      _events = events;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daily Walk Timeline'),
      ),
      body: Timeline.tileBuilder(
        builder: TimelineTileBuilder.connected(
          connectionDirection: ConnectionDirection.before,
          itemCount: _events.length,
          contentsBuilder: (context, index) {
            final event = _events[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date: ${event['date']}',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Steps: ${event['steps']}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Walk Hours: ${event['hours'].toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            );
          },
          indicatorBuilder: (context, index) {
            return DotIndicator(
              size: 20,
              color: Colors.blue,
            );
          },
          connectorBuilder: (context, index, connectorType) {
            return SolidLineConnector(
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }
}
