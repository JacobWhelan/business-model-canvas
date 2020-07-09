import 'package:flutter/material.dart';

class CardTabs extends StatefulWidget {
  @override
  _CardTabsState createState() => _CardTabsState();
}

class _CardTabsState extends State<CardTabs> with TickerProviderStateMixin{
  List<String> myList = ['Question 1', 'Question 2', 'Question 3'];
  TabController _cardController;

  @override
  void initState() {
    super.initState();
    _cardController= new TabController(length: myList.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: _cardController,
      children: myList.isEmpty
          ? <Widget>[]
          : myList.map((questions) {
        return new Card(
          child: new Container(
              height: 450.0,
              width: 300.0,
              child: Center(
                child: Text(questions),
              ),
        ));
      }).toList(),
    );
  }
}