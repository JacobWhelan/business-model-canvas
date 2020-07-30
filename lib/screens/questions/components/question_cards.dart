import 'package:business_model_canvas/screens/questions/components/answers.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String questionText;
  final int index;

  const QuestionCard({Key key, this.questionText, this.index})
      : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 60),
              child: Text(widget.questionText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(33, 33, 33, 0.8),
                  ))),
          AnswerField(
            index: widget.index,
          )
        ],
      ),
    );
  }
}
