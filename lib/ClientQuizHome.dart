import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'ClientQuizAnswer.dart';
import 'API.dart';

class ClientQuizHome extends StatefulWidget {
  final Function setName;
  final Function setQuiz;
  const ClientQuizHome(
      {Key? key,
      required this.setName,
      required this.setQuiz}) //key:key is used
      : super(key: key);
  @override
  State<ClientQuizHome> createState() => _ClientQuizHome();
}

class _ClientQuizHome extends State<ClientQuizHome> {
  String name = "";
  String idQuiz = "";

  buttonPressed() async {
    widget.setName(name);
    widget.setQuiz(idQuiz);
  }

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Partecipa al quiz del tuo amico';

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
          child: TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Inserisci ID del tuo amico',
            ),
            onChanged: (value) => setState(() => idQuiz = value),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
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
          child: const Text('Inizia ora'),
        ),
      ],
    );
  }
}
