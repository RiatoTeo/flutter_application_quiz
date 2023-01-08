import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'ClientQuizAnswer.dart';
import 'ClientQuizStatistics.dart';
import 'API.dart';
import 'ClientQuizHome.dart';

class ClientQuiz extends StatefulWidget {
  @override
  State<ClientQuiz> createState() => _ClientQuiz();
}

class _ClientQuiz extends State<ClientQuiz> {
  var name = "";
  var idQuiz = "";
  var quiz = null;
  int indexQuestion = 0;

  void nextQuestion() {
    setState(() {
      indexQuestion = indexQuestion + 1;
    });
    print(indexQuestion);
  }

  setName(value) {
    setState(() {
      name = value;
    });
  }

  setQuiz(value) async {
    var tempQuiz = await API().getQuizById(value);
    print(tempQuiz["Questions"].length);
    setState(() {
      quiz = tempQuiz;
    });
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Partecipa al quiz del tuo amico';

    return Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: (quiz == null)
            ? ClientQuizHome(setQuiz: setQuiz, setName: setName)
            : (indexQuestion < quiz["Questions"].length)
                ? ClientQuizAnswer(
                    quiz: quiz,
                    name: name,
                    indexQuestion: indexQuestion,
                    nextQuestion: nextQuestion)
                : ClientQuizStatistics(name: name, idQuiz: quiz["id"]));
  }
}
