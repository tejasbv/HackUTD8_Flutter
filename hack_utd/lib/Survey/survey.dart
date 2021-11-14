import 'package:flutter/material.dart';
import 'package:hack_utd/Survey/quiz.dart';
import 'package:hack_utd/Survey/result.dart';

import '../support.dart';
import '../recorder.dart';

class Survey extends StatefulWidget {
  @override
  _SurveyState createState() => _SurveyState();
}

class _SurveyState extends State<Survey> {
  final _questions = [
    {
      "QuestionText": "was 911 called",
      "answers": [
        {"text": "Yes", "score": 10},
        {"text": "No ", "score": 0},
      ]
    },
    {
      "QuestionText": "Was anyone injured",
      "answers": [
        {"text": "yes", "score": 10},
        {"text": "no", "score": 0},
      ]
    },
    {
      "QuestionText": "any property damage",
      "answers": [
        {"text": "Yes ", "score": 10},
        {"text": "No", "score": 0},
      ]
    },
    {
      "QuestionText":
          "any witnesses? *pleeas ask for permission and then record ",
      "answers": [
        {"text": "Yes", "score": 10},
        {"text": "No", "score": 0},
      ]
    },
    {
      "QuestionText": "number of vehicles involved",
      "answers": [
        {"text": "1 ", "score": 1},
        {"text": "2", "score": 2},
        {"text": "3 ", "score": 3},
        {"text": "4", "score": 4},
      ]
    },
  ];
  int questionIndex = 0;
  int _totalScore = 0;
  bool cops_called = false;
  void reset() {
    setState(() {
      questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (questionIndex == 0) {
      if (score == 10) {
        cops_called = true;
      }
    } else if (questionIndex == 1) {
      if (score == 10 && !cops_called) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Support()));
      }
    } else if (questionIndex == 2) {
      if (score == 10) {}
    } else if (questionIndex == 3) {
      if (score == 10) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => RecordingScreen()));
      }
    }
    setState(() {
      questionIndex += 1;
    });
    _totalScore += score;

    print(_totalScore);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                const Color(0xFF0652C5),
                Colors.lightGreenAccent.shade200
              ])),
          child: questionIndex < _questions.length
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Question ${questionIndex + 1} of ${_questions.length}",
                      style: TextStyle(fontSize: 36, color: Colors.cyan[200]),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Quiz(_answerQuestion, _questions, questionIndex)
                  ],
                )
              : Result(),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
