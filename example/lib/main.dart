import 'package:flutter/material.dart';

import 'package:weather_icons/weather_icons.dart';

import 'all.dart';
import 'dynamic.dart';
import 'time.dart';
import 'wind.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'weather_icons Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        'all': (context) => AllScreen(),
        'all-boxed': (context) => AllScreen(isBoxed: true),
        'dynamic': (context) => DynamicScreen(),
        'time': (context) => TimeScreen(),
        'wind': (context) => WindScreen(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('weather_icons Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Click both of the 'All Icons' buttons to see the difference between using BoxedIcon vs Icon",
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
              child: const Text('All icons (Regular Icon())'),
              onPressed: () => _navigate(context, 'all'),
            ),
            ElevatedButton(
              child: const Text('All icons (BoxedIcon())'),
              onPressed: () => _navigate(context, 'all-boxed'),
            ),
            ElevatedButton(
              child: const Text('Dynamic icon'),
              onPressed: () => _navigate(context, 'dynamic'),
            ),
            ElevatedButton(
              child: const Text('Time icons'),
              onPressed: () => _navigate(context, 'time'),
            ),
            ElevatedButton(
              child: const Text('Wind icons'),
              onPressed: () => _navigate(context, 'wind'),
            ),
            IconButton(
              icon: const BoxedIcon(WeatherIcons.day_cloudy_gusts),
              onPressed: () {},
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Text(
                'Fonts generated at: ${DateTime.fromMillisecondsSinceEpoch(10000)}',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigate(BuildContext context, String dest) {
    Navigator.pushNamed(context, dest);
  }
}
