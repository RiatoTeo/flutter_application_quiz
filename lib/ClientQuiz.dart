import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'QuizQuestionsAnswers.dart';
import 'API.dart';

class ClientQuiz extends StatefulWidget {
  @override
  State<ClientQuiz> createState() => _ClientQuiz();
}

class _ClientQuiz extends State<ClientQuiz> {
  var name = "";
  var idQuiz = "";

  buttonPressed() async {
    var quiz = API().getQuizById(idQuiz);
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return QuizQuestionsAswers(name: name, quiz: quiz);
    }));
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Partecipa al quiz del tuo amico';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Inserisci ID del tuo amico',
                ),
                onChanged: (value) => setState(() => idQuiz = value),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Inserisci il tuo nome',
                ),
                onChanged: (value) => setState(() => name = value),
              ),
            ),
            TextButton(
              onPressed: () => buttonPressed(),
              style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(40)
                  //internal content margin
                  ),
              child: const Text('prova anche tu'),
            ),
          ],
        ),
      ),
    );
  }
}
