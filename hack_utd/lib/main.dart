import 'package:flutter/material.dart'
    show
        BuildContext,
        Container,
        Image,
        MaterialApp,
        StatelessWidget,
        Widget,
        runApp;
import 'package:flutter/src/widgets/basic.dart';
import 'package:hack_utd/Survey/claim_start.dart';
import 'package:hack_utd/Survey/quiz.dart';
import 'package:hack_utd/Survey/survey.dart';
import 'package:hack_utd/recorder.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MyHome());
  }
}

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClaimStart(),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            child: const Image(
              image: AssetImage("assets/State-Farm-Insurance-Logo.png"),
              fit: BoxFit.fitWidth,
            ),
            height: 150,
            width: 300,
          ),
        ),
      ],
    );
  }
}
