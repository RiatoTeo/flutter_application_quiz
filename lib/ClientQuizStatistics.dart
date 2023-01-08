import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'API.dart';

class ClientQuizStatistics extends StatefulWidget {
  final idQuiz;
  final name;

  const ClientQuizStatistics(
      {Key? key, required this.idQuiz, required this.name}) //key:key is used
      : super(key: key);

  @override
  State<ClientQuizStatistics> createState() => _ClientQuizStatistics();
}

class _ClientQuizStatistics extends State<ClientQuizStatistics> {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'Risultati di tutti gli utenti che hanno partecipato';
    print(widget.name);
    print(widget.idQuiz);
    return FutureBuilder<Map>(
      future: API().getStatisticsById(
          widget.idQuiz), // a previously-obtained Future<String> or null
      builder: (BuildContext context, AsyncSnapshot<Map> quiz) {
        List<Widget> children;
        if (quiz.hasData) {
          children = <Widget>[];
          for (var statistic in quiz.data?["statistics"]) {
            children.add(
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(statistic["namePlayer"]),
              ),
              Text("${statistic["numCorrect"]}/${statistic["totQuestions"]}"),
            ]));
          }
        } else {
          children = const <Widget>[
            SizedBox(
              width: 60,
              height: 60,
              child: CircularProgressIndicator(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: Text('Awaiting result...'),
            ),
          ];
        }

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: children,
          ),
        );
      },
    );
  }
}
