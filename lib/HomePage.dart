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
          // centra le modalità di gioco
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            // creo il bottone che ti indirizza alla modalità uno contro uno
            TextButton(
              onPressed: () async {
                var message = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return HostQuiz(); // ritorno l'oggetto della classe della modalità uno contro uno
                }));
                print(message);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(40)
                  //internal content margin
                  ),
              child: const Text('inserisci il tuo nome e crea un nuovo quiz'),
            ),

            // creo il bottone che ti indirizza alla modalità singola
            TextButton(
              onPressed: () async {
                var message = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return ClientQuiz(); // ritorno l'oggetto della classe della modalità contro il bot
                }));
                print(message);
              },
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(40)
                  //internal content margin
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
