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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Quiz'),
    );
  }
}

// aggiungi pulsante exit dalle domande
// aggiungi pulsante per vedere i risultati quando inserisici id e nome per partecipare ad un quiz
// sistema layout