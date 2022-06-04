import 'package:bmiapp/home.dart';
import 'package:bmiapp/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.teal,
          canvasColor: Colors.grey[200],
          iconTheme: IconThemeData(color: Colors.white),
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontFamily: 'kurdish',
                  fontWeight: FontWeight.bold),
              headline2: TextStyle(
                  fontSize: 24,
                  fontFamily: 'kurdish',
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              bodyText1: TextStyle(
                  color: Colors.black,
                  fontFamily: 'kurdish',
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        home: Home());
  }
}
