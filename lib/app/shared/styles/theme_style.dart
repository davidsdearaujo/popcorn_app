import 'package:flutter/material.dart';

class AppTheme {
  ThemeData themeData() {
    return ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.grey[800],
        backgroundColor: Colors.black,
        textTheme: _textTheme());
  }

  TextTheme _textTheme() {
    return TextTheme(
      body1: TextStyle(fontSize: 16),
      body2: TextStyle(fontSize: 14),
      title: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w900,
        fontSize: 30,
      ),
    );
  }
}
