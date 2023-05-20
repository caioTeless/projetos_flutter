import 'package:first_udm/quiz.dart';
import 'package:first_udm/result.dart';
import 'package:flutter/material.dart';

main() => runApp(PerguntaApp());

class PerguntaAppState extends State<PerguntaApp> {
  var _selectedQuestion = 0;
  var _totalPoints = 0;
  //final List<Map<String, Object>> questions = const [
  final questions = [
    {
      'text': 'What is your favorite color?',
      'answers': [
        {'text': 'Black', 'pontuacao': 10},
        {'text': 'Red', 'pontuacao': 5},
        {'text': 'Green', 'pontuacao': 3},
        {'text': 'White', 'pontuacao': 1},
      ],
    },
    {
      'text': 'What is your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'pontuacao': 10},
        {'text': 'Snake', 'pontuacao': 5},
        {'text': 'Elephant', 'pontuacao': 3},
        {'text': 'Lion', 'pontuacao': 1},
      ],
    },
    {
      'text': 'What is your favorite teacher?',
      'answers': [
        {'text': 'Maria', 'pontuacao': 10},
        {'text': 'João', 'pontuacao': 5},
        {'text': 'Leo', 'pontuacao': 3},
        {'text': 'Pedro', 'pontuacao': 1},
      ],
    }
  ];


  void _answerQuestions(int? points) {
    if (hasSelectedQuestion) {
      setState(() {
        _selectedQuestion += 1;
        _totalPoints += points!;
      });
    }
  }

  void _restartQuiz(){
    setState(() {
      _selectedQuestion = 0;
      _totalPoints = 0;
    });
  }

  bool get hasSelectedQuestion {
    return _selectedQuestion < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Questions'),
        ),
        body: hasSelectedQuestion
            ? Quiz(
                questions: questions,
                selectedQuestion: _selectedQuestion,
                answer: _answerQuestions,
              )
            : Result(_totalPoints, _restartQuiz),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
