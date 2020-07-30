import 'package:business_model_canvas/blocs/tab_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Header extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HeaderState createState() => _HeaderState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HeaderState extends State<Header> {
  TabBloc tabBloc;

  @override
  initState() {
    super.initState();
    tabBloc = BlocProvider.of<TabBloc>(context);
  }

  Widget questionsHeader() {
    final List<TabState> currentState = tabBloc.state;

    AppBar header = AppBar(
      title: Text("Business Canvas Model"),
      actions: [FlatButton(onPressed: () {}, child: Text("Finish"))],
    );

    currentState.forEach((element) {
      if (!(element is SubmittedState)) {
        header = AppBar(
          title: Text("Business Canvas Model"),
        );
      }
    });

    return header;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBloc, List<TabState>>(builder: (context, state) {
      return questionsHeader();
    });
  }
}
