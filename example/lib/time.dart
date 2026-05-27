import 'package:flutter/material.dart';

import 'package:weather_icons/weather_icons.dart';

class TimeScreen extends StatefulWidget {
  const TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  int _hour = DateTime.now().hour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time Icons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the buttons to change the time',
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 48),
              child: Container(
                color: Colors.amber,
                child: BoxedIcon(
                  TimeIcon.fromHour(_hour),
                  size: 100,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('-'),
                  onPressed: () {
                    _updateHour(_hour - 1);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    _getHourDisplay(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  child: const Text('+'),
                  onPressed: () {
                    _updateHour(_hour + 1);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _getHourDisplay() {
    final prefix = _hour >= 12 ? 'PM' : 'AM';
    final hour = _hour > 12 ? _hour - 12 : _hour;
    return '$hour $prefix';
  }

  void _updateHour(int hour) {
    int hour0 = hour;
    if (hour0 > 23) {
      hour0 = 0;
    } else if (hour0 < 0) {
      hour0 = 23;
    }

    setState(() => _hour = hour0);
  }
}
