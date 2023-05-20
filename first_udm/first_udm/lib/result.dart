import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int pontuacao;
  final void Function() restartQuiz;

  Result(this.pontuacao, this.restartQuiz);

  String get resultSentence {
    if (pontuacao < 8) {
      return 'Congratulations !';
    } else if (pontuacao < 12) {
      return 'You are good !';
    } else if (pontuacao < 16) {
      return 'Awesome !';
    } else {
      return 'Jedi level';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            resultSentence,
            style: TextStyle(
              fontSize: 28,
            ),
          ),
        ),
        TextButton(
          child: Text(
            'Restart ?',
            style: TextStyle(color: Colors.blue, fontSize: 20),
          ),
          style: TextButton.styleFrom(
            primary: Colors.blue,
          ),
          onPressed: restartQuiz,
        ),
      ],
    );
  }
}
