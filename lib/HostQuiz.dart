import 'dart:async';
import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/API.dart';
import 'package:flutter_application_quiz/HostPageQuestions.dart';
import 'API.dart';

class HostQuiz extends StatefulWidget {
  @override
  State<HostQuiz> createState() => _HostQuiz();
}

class _HostQuiz extends State<HostQuiz> {
  final appTitle = 'Crea il tuo quiz, scrivendo le tue domande';
  String _name = "";
  int idQuiz = -1;

  createNewQuiz() async {
    if (idQuiz < 0) {
      Map quiz = await API().newQuiz(_name);
      setState(() {
        idQuiz = quiz["id"];
      });
    }
    print(idQuiz);
    await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HostPageQuestions(idQuiz: idQuiz);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
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
                    labelText: 'Inserisci il tuo nome',
                  ),
                  onChanged: (value) => setState(() => _name = value)),
            ),
            TextButton(
              onPressed: () => createNewQuiz(),
              child: const Text('Inizia ora'),
            ),
          ],
        ),
      ),
    );
  }
}
