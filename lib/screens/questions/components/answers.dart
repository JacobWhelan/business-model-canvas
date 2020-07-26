import 'package:business_model_canvas/blocs/tab_bloc.dart';
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
  TabBloc tabBloc;

  @override
  initState() {
    super.initState();
    tabBloc = BlocProvider.of<TabBloc>(context);
  }

  Widget _buildFormField() {
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

  Widget _buildButton(String label) {
    return RaisedButton(
        child: Text(label),
        onPressed: () {
          switch (label) {
            case "Submit":
              tabBloc.add(SubmitEvent(widget.index));
              QuestionsList.answerList[widget.index] = _answerController.text;
              break;
            case "Edit":
              tabBloc.add(EditEvent(widget.index));
              break;
            case "Cancel":
              tabBloc.add(CancelEvent(widget.index));
              break;
            case "Delete":
              tabBloc.add(DeleteEvent(widget.index));
              QuestionsList.answerList[widget.index] = "No Answer Provided";
              break;
          }
          _answerController.clear();
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

  List<Widget> _mapStateToForm() {
    final TabState currentState = tabBloc.state[widget.index];

    if (currentState is InitialState) {
      return [
        _buildFormField(),
        _buildButton("Submit"),
      ];
    }
    if (currentState is SubmittedState) {
      return [
        _buildSubmittedAnswerBox(),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            _buildButton("Delete"),
            _buildButton("Edit"),
          ],
        )
      ];
    }

    if (currentState is EditingState) {
      return [
        _buildSubmittedAnswerBox(),
        _buildFormField(),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            _buildButton("Cancel"),
            _buildButton("Submit"),
          ],
        )

      ];
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, List<TabState>>(
        builder: (context, state) {
          return Center(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: _mapStateToForm(),
                  ),
                ),
              ],
            ),
          );
        }
    );
  }


}
