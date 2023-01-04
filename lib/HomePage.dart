import 'package:flutter/material.dart';
import 'HostQuiz.dart';
import 'ClientQuiz.dart';
import 'API.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            TextButton(
              onPressed: () async {
                var message = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return HostQuiz(); 
                }));
                print(message);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(40)
                  ),
              child: const Text('inserisci il tuo nome e crea un nuovo quiz'),
            ),

            TextButton(
              onPressed: () async {
                var message = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ClientQuiz(); 
                }));
                print(message);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(40)
                  ),
              child: const Text(
                  'inserisci ID del tuo amico per partecipare al quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
