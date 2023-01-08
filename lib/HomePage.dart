import 'package:flutter/material.dart';
import 'HostQuiz.dart';
import 'ClientQuiz.dart';
import 'API.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz"),
      ),
      body: Center(
          child: Column(children: [
        Center(
          child: Container(
            child: Image.asset('assets/images/logo.png'),
            width: 300,
            margin: const EdgeInsets.symmetric(vertical: 10),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return HostQuiz();
                  }));
                },
                child: const Text('Crea il tuo quiz'),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: TextButton(
                onPressed: () async {
                  var message = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return ClientQuiz();
                  }));
                },
                child: const Text('Partecipare al quiz di un amico'),
              ),
            ),
          ],
        ),
      ])),
    );
  }
}
