import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final optionButton;
  final void Function() selected;

  Answer(this.optionButton, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Text(
          optionButton,
          style: TextStyle(color: Colors.white),
        ),
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        onPressed: selected,
      ),
    );
  }
}
