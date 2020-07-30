import 'package:business_model_canvas/blocs/tab_bloc.dart';
import 'package:business_model_canvas/screens/questions/components/card_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TabBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Business Canvas Model'),
        ),
        body: CardTabs(),
      ),
    );
  }
}
