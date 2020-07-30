import 'package:flutter/material.dart';

ThemeData appTheme() => ThemeData(
      primaryColor: Colors.blue,
      accentColor: Colors.white,
      buttonTheme: ButtonThemeData(
          buttonColor: Colors.blue, textTheme: ButtonTextTheme.accent),
      appBarTheme: AppBarTheme(
        color: Colors.blueAccent,
      ),
    );
