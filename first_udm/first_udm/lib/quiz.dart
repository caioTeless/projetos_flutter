import 'package:first_udm/answer.dart';
import 'package:first_udm/questions.dart';
import 'package:flutter/material.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int? selectedQuestion;
  final void Function(int) answer;

  Quiz({
    required this.questions,
    required this.selectedQuestion,
    required this.answer,
  });

  bool get hasSelectedQuestion {
    return selectedQuestion! < questions.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> answers = hasSelectedQuestion
        ? questions[selectedQuestion!].cast()['answers']
        : [];
    return Column(
      children: <Widget>[
        Question(questions[selectedQuestion!]['text'].toString()),
        ...answers.map((resp) {
          return Answer(
            resp['text'],
            () => answer(resp['pontuacao']),
          );
        }).toList(),
      ],
    );
  }
}
