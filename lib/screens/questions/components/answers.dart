import 'package:business_model_canvas/blocs/answer_bloc.dart';
import 'package:business_model_canvas/models/questions_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnswerField extends StatefulWidget {
  final int index;

  const AnswerField({Key key, this.index}) : super(key: key);

  @override
  _AnswerFieldState createState() => _AnswerFieldState();
}

class _AnswerFieldState extends State<AnswerField> {
  final _answerController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Widget _buildFormField(AnswerBloc answerBloc) {
    return FractionallySizedBox(
      widthFactor: .7,
      child: TextFormField(
        controller: _answerController,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          hintText: "Hint Text",
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildSubmitButton(AnswerBloc answerBloc) {
    return RaisedButton(
        child: Text("Submit"),
        onPressed: () {
          QuestionsList.answerList[widget.index] = _answerController.text;
          _answerController.clear();
          answerBloc.add(AnswerSubmit());
        });
  }

  Widget _buildEditButton(AnswerBloc answerBloc) {
    return RaisedButton(
        child: Text("Edit"),
        onPressed: () {
          answerBloc.add(AnswerEdit());
        });
  }

  Widget _buildSubmittedAnswerBox() {
    return FractionallySizedBox(
      widthFactor: .7,
      child: Text(
        QuestionsList.answerList[widget.index],
        textAlign: TextAlign.center,
      ),
    );
  }

  List<Widget> _mapStateToForm({AnswerBloc answerBloc}) {
    final AnswerState currentState = answerBloc.state;

    if (currentState is AnswerInitial
        && QuestionsList.answerList[widget.index] != "No Answer Provided") {
      answerBloc.add(AnswerSubmit());
    }

    if (currentState is AnswerInitial) {
      return [
        _buildFormField(answerBloc),
        _buildSubmitButton(answerBloc),
      ];
    }
    if (currentState is AnswerSubmitted) {
      return [
        _buildSubmittedAnswerBox(),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            _buildEditButton(answerBloc),
            _buildSubmitButton(answerBloc),
          ],
        )
      ];
    }

    if (currentState is AnswerEditing) {
      return [
        _buildSubmittedAnswerBox(),
        _buildFormField(answerBloc),
        _buildSubmitButton(answerBloc),
      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnswerBloc, AnswerState>(
      condition: (previousState, state) =>
      state.runtimeType != previousState.runtimeType,
      builder: (context, state) =>
          Center(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: _mapStateToForm(
                        answerBloc: BlocProvider.of<AnswerBloc>(context)),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}
