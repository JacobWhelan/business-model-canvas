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
          Text(widget.questionText,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline)),
          AnswerField(
            index: widget.index,
          )
        ],
      ),
    );
  }
}
