import 'package:business_model_canvas/routes.dart';
import 'package:business_model_canvas/theme/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BusinessApp());
}

class BusinessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) {},
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Business Model Canvas",
        theme: appTheme(),
        routes: routes,
        initialRoute: "questions",
      ),
    );
  }
}
