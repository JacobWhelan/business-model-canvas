import 'package:flutter/material.dart';

class AnswerField extends StatefulWidget {
  @override
  _AnswerFieldState createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<AnswerField> {
  final _answerController = TextEditingController();
  List<String> _answers = <String>[];
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                FractionallySizedBox(
                  widthFactor: .7,
                  child: TextFormField(
                    controller: _answerController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                      hintText: "Hint Text",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                RaisedButton(
                    child: Text("Submit"),
                    onPressed: () {
                      _answers.add(_answerController.text);
                    }),
                //Temporary button to display submitted answers
                OutlineButton(
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
          ),
        ],
      ),
    );
  }
}
