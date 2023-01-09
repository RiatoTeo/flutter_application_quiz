import 'package:flutter/material.dart';
import 'HostQuiz.dart';
import 'ClientQuiz.dart';
import 'HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.blue,
            minimumSize: const Size(100.0, 20.0),
            padding: const EdgeInsets.all(20),
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
