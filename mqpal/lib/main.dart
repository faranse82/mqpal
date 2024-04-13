import 'package:flutter/material.dart';
import 'package:mqpal/screens/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MQPal',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: 'Ubuntu',
      ),
      home: const HomeScreen(),
    );
  }
}
