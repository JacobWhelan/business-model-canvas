import 'package:business_model_canvas/blocs/tab_bloc.dart';
import 'package:business_model_canvas/models/questions_list.dart';
import 'package:business_model_canvas/screens/questions/components/question_cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CardTabs extends StatefulWidget {
  @override
  _CardTabsState createState() => _CardTabsState();
}

class _CardTabsState extends State<CardTabs> with TickerProviderStateMixin{
  List<String> myList = QuestionsList.questionList;
  TabController _cardController;
  int tempIndex = 0;

  @override
  void initState() {
    super.initState();
    _cardController = new TabController(length: myList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TabBloc, List<TabState>>(
      listener: (BuildContext context, state) {
        /*if( state[_cardController.index] is SubmittedState){
            if(_cardController.index+1 < QuestionsList.questionList.length){
              _cardController.animateTo(_cardController.index+1);
            }
          }*/ // Functionality to add auto swiping after the user submits an answer
      },
      child: TabBarView(
        controller: _cardController,
        children: myList.isEmpty
            ? <Widget>[]
            : myList.map((questions) {
                return new QuestionCard(
                  questionText: questions,
                  index: tempIndex++,
                );
              }).toList(),
      ),
    );
  }
}
