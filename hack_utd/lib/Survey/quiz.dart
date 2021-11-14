import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Question.dart';
import 'answer.dart';

class Quiz extends StatelessWidget {
  final Function _answerQuestion;
  final questions;
  final questionIndex;
  Quiz(this._answerQuestion, this.questions, this.questionIndex);

  @override
  Widget build(BuildContext context) {
    /**********************************************************/
    // full screen width and height
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    // height without status and toolbar
    double height3 = (height - kToolbarHeight) / 2;
    double boxw = height > width ? width : height - 50;
    /**********************************************************/
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Question(questions[questionIndex]["QuestionText"]),
        Container(
          width: width / 1.25,
          child: Divider(
            color: Color(0xffFFC300),
            thickness: 5,
          ),
        ),
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Container(
              child: Answer(() => _answerQuestion(answer["score"]),
                  answer["text"].toString()));
        }).toList()
      ],
    );
  }
}
