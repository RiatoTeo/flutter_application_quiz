import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'API.dart';
import 'ClientQuizStatistics.dart';

class ClientQuizAnswer extends StatefulWidget {
  final quiz;
  final String name;
  final int indexQuestion;
  final Function nextQuestion;

  const ClientQuizAnswer(
      {Key? key,
      required this.quiz,
      required this.name,
      required this.indexQuestion,
      required this.nextQuestion}) //key:key is used
      : super(key: key);

  @override
  State<ClientQuizAnswer> createState() => _ClientQuizAnswer();
}

class _ClientQuizAnswer extends State<ClientQuizAnswer> {
  answerButtonPressed(idDomanda, name, correct, callback) {
    //salvare risutlato
    API().saveAnswer(idDomanda, name, correct);
    callback();
  }

  answerButton(idDomanda, textDomanda, namePlayer, nRisposta, callback) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: TextButton(
          onPressed: () =>
              answerButtonPressed(idDomanda, namePlayer, nRisposta, callback),
          child: Text(textDomanda),
        ));
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Rispondi alle seguenti domande';
    print(widget.indexQuestion);
    var domanda = widget.quiz["Questions"][widget.indexQuestion];

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Text(domanda["description"]),
                ],
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    answerButton(domanda["id"], domanda["answer1"], widget.name,
                        1, widget.nextQuestion),
                    answerButton(domanda["id"], domanda["answer2"], widget.name,
                        2, widget.nextQuestion),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    answerButton(domanda["id"], domanda["answer3"], widget.name,
                        3, widget.nextQuestion),
                    answerButton(domanda["id"], domanda["answer4"], widget.name,
                        4, widget.nextQuestion),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
