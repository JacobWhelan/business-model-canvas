import 'package:business_model_canvas/screens/questions/components/answers.dart';
import 'package:flutter/material.dart';

class QuestionCard extends StatefulWidget {
  final String questionText;

  const QuestionCard({Key key, this.questionText}) : super(key: key);

  @override
  _QuestionCardState createState() => _QuestionCardState();
}

class _QuestionCardState extends State<QuestionCard> {
  //move this list into 'assets' file and populate
  //static const List<String> _questions = ['1?', '2?', '3?', '4?', '5?'];

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
          AnswerField()
        ],
      ),
    );
  }
}
