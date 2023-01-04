import 'dart:convert';
import 'dart:ffi';

import 'package:http/http.dart' as http;

class API {
  final _host = "127.0.0.1:30000";

  Future<Map> getQuizById(id) async {
    var url = Uri.http(_host, 'quiz/$id');

    var response = await http.get(url);

    var decodedResponse =
        await jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);

    return decodedResponse;
  }

  Future<Map> newQuiz(name) async {
    var url = Uri.http(_host, 'quiz/$name');

    var response = await http.put(url);

    var decodedResponse =
        await jsonDecode(utf8.decode(response.bodyBytes)) as Map;

    return decodedResponse;
  }

  Future<Map> newQuestion(
      idQuiz, description, answer1, answer2, answer3, answer4, correct) async {
    var url = Uri.http(_host, 'quiz/${idQuiz}');

    Map question = {
      "description": description,
      "answer1": answer1,
      "answer2": answer2,
      "answer3": answer3,
      "answer4": answer4,
      "correct": correct
    };

    //encode Map to JSON
    var body = json.encode(question);
    print(body);

    var response = await http.post(url,
        headers: {"Content-Type": "application/json"}, body: body);

    var decodedResponse =
        await jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);

    return decodedResponse;
  }

  Future<Map> getQuestionsAnswers(idQuiz) async {
    var url = Uri.http(_host, 'quiz/${idQuiz.Questions.id}');

    var response = await http.get(url);

    var decodedResponse =
        await jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    print(decodedResponse);

    return decodedResponse;
  }
}