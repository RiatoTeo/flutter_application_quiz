import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_quiz/HomePage.dart';
import 'HomePage.dart';
import 'API.dart';

class HostPageQuestions extends StatefulWidget {
  final idQuiz;
  const HostPageQuestions({Key? key, this.idQuiz}) //key:key is used
      : super(key: key);
  @override
  State<HostPageQuestions> createState() => _HostPageQuestions();
}

class _HostPageQuestions extends State<HostPageQuestions> {
  String description = "";
  String answer1 = "";
  String answer2 = "";
  String answer3 = "";
  String answer4 = "";
  String correct = "";
  final _formKey = GlobalKey<FormState>();

  createNewQuestion() {
    //validation dei campi
    if (_formKey.currentState!.validate()) {
      API().newQuestion(widget.idQuiz, description, answer1, answer2, answer3,
          answer4, correct);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return HostPageQuestions(idQuiz: widget.idQuiz);
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crea le domande per il tuo quiz - ${widget.idQuiz}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 16),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Inserisci il testo della domanda',
                      ),
                      onChanged: (value) =>
                          setState(() => description = value)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'risposta 1',
                      ),
                      onChanged: (value) => setState(() => answer1 = value)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'risposta 2',
                      ),
                      onChanged: (value) => setState(() => answer2 = value)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'risposta 3',
                      ),
                      onChanged: (value) => setState(() => answer3 = value)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 120, vertical: 16),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'risposta 4',
                      ),
                      onChanged: (value) => setState(() => answer4 = value)),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 490, vertical: 16),
                  child: TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a number';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Indica il numero della risposta corretta',
                      ),
                      onChanged: (value) => setState(() => correct = value)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => createNewQuestion(),
                      child: const Text('procedi alla prossima domanda'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement<void, void>(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) => const HomePage(),
                          ),
                        );
                      },
                      child: const Text('termina'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
