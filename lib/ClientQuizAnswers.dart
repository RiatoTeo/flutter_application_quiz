import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'API.dart';

class ClientQuizAnswers extends StatefulWidget {
  final idQuiz;
  final name;
  const ClientQuizAnswers({Key? key, this.idQuiz, this.name}) //key:key is used
      : super(key: key);

  @override
  State<ClientQuizAnswers> createState() => _ClientQuizAnswers();
}

class _ClientQuizAnswers extends State<ClientQuizAnswers> {
  buttonPressed() async {}
  answerButtonPressed(idDomanda, name, correct) async {}

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Rispondi alle seguenti domande';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: FutureBuilder<Map>(
          future: API().getQuizById(
              widget.idQuiz), // a previously-obtained Future<String> or null
          builder: (BuildContext context, AsyncSnapshot<Map> quiz) {
            List<Widget> children;
            if (quiz.hasData) {
              children = <Widget>[];
              for (var statistic in quiz.data?["statistics"]) {
                children.add(Row(children: [
                  Text(statistic["name"]),
                  Text("${statistic["answer"]}"),
                ]));
              }
              for (var domanda in quiz.data?["Questions"]) {
                children.add(Column(
                  children: [
                    Column(
                      children: [
                        Text(domanda["description"]),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => answerButtonPressed(
                              domanda["id"], widget.name, 1),
                          child: Text(domanda["answer1"]),
                        ),
                        TextButton(
                          onPressed: () => answerButtonPressed(
                              domanda["id"], widget.name, 2),
                          child: Text(domanda["answer2"]),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => answerButtonPressed(
                              domanda["id"], widget.name, 3),
                          child: Text(domanda["answer3"]),
                        ),
                        TextButton(
                          onPressed: () => answerButtonPressed(
                              domanda["id"], widget.name, 4),
                          child: Text(domanda["answer4"]),
                        ),
                      ],
                    )
                  ],
                ));
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
        ),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     Column(
        //       children: domande,
        //     ),
        //     TextButton(
        //       onPressed: () => buttonPressed(),
        //       style: ElevatedButton.styleFrom(
        //         padding:
        //             const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        //         backgroundColor: Color.fromARGB(255, 17, 97, 163),
        //       ),
        //       child: const Text(
        //         'Salva',
        //         style: TextStyle(color: Colors.white),
        //       ),
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
