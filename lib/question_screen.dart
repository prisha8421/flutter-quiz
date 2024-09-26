import 'package:flutter/material.dart';
import 'package:quiz/button.dart';
import 'package:quiz/data/dummyquestions.dart';

class Question extends StatefulWidget {
  const Question({required this.onSelectAnswer, super.key});
  final void Function(String) onSelectAnswer;

  @override
  State<Question> createState() {
    return _Question();
  }
}

class _Question extends State<Question> {
  var questionindex = 0;

  void answertext(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // Corrected the function call
    setState(() {
      questionindex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final questiontext = question[questionindex];
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text(
            style: const TextStyle(color: Colors.white, fontSize: 25),
            questiontext.ques),
        const SizedBox(height: 40),
        ...questiontext.getShuffledanswers().map((answers) {
          return Button(
              text: answers,
              ontap: () {
                answertext(answers);
              });
        }),
      ]),
    );
  }
}
