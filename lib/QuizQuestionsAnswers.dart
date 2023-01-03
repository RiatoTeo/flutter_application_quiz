import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'API.dart';

class QuizQuestionsAswers extends StatefulWidget {
  final quiz;
  final name;
  const QuizQuestionsAswers({Key? key, this.quiz, this.name}) //key:key is used
      : super(key: key);

  @override
  State<QuizQuestionsAswers> createState() => _QuizQuestionsAswers();
}

class _QuizQuestionsAswers extends State<QuizQuestionsAswers> {
  @override
  Widget build(BuildContext context) {
    print(widget.quiz);

    const appTitle = 'Rispondi alle seguenti domande';

    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              child: Text('domanda da inserire'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 120, vertical: 16),
              child: Text(
                'answer1',
              ),
            ),
            TextButton(
              onPressed: () async {
                // var message = await Navigator.push(context,
                //     MaterialPageRoute(builder: (context) {
                //       return s;
                // }));
                // print(message);
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                backgroundColor: Color.fromARGB(255, 17, 97, 163),
              ),
              child: const Text(
                'invio',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
