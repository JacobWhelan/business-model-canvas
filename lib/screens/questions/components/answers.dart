import 'package:flutter/material.dart';

class AnswerField extends StatefulWidget {
  @override
  _AnswerFieldState createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<AnswerField> {
  final _answerController = TextEditingController();
  List<String> _answers = <String>[];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextField(
            controller: _answerController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: "hint Example"),
          ),
          RaisedButton(
              child: Text("Submit"),
              onPressed: () {
                _answers.add(_answerController.text);
              }),
          //Temporary button to display submitted answers
          RaisedButton(
              child: Text("Show Answers"),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text(_answers.toString()),
                      );
                    });
              })
        ],
      ),
    );
  }
}
