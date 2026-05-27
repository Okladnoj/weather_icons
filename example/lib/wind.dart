import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class WindScreen extends StatefulWidget {
  const WindScreen({super.key});

  @override
  State<WindScreen> createState() => _WindScreenState();
}

class _WindScreenState extends State<WindScreen> {
  double _degree = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wind Icons'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Press the buttons to change wind Direction',
              style: TextStyle(fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 48),
              child: ColoredBox(
                color: Colors.amber,
                child: WindIcon(
                  degree: _degree,
                  size: 100,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  child: const Text('-20'),
                  onPressed: () {
                    _updateHour(_degree - 20);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0),
                  child: Text(
                    '$_degree°',
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ElevatedButton(
                  child: const Text('+20'),
                  onPressed: () {
                    _updateHour(_degree + 20);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateHour(double degree) {
    double degree0 = degree;
    if (degree0 > 360) {
      degree0 = 0;
    } else if (degree0 < 0) {
      degree0 = 360;
    }

    setState(() => _degree = degree0);
  }
}
