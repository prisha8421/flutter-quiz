import 'package:flutter/material.dart';
import 'package:quiz/data/dummyquestions.dart';
import 'package:quiz/results.dart';
import 'package:quiz/start.dart';
import 'package:quiz/question_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizPage();
  }
}

class _QuizPage extends State<Quiz> {
  List<String> selectedAnswers = [];
  Widget? screen;

  void chooseAnswer(String ans) {
    setState(() {
      selectedAnswers.add(ans);

      if (selectedAnswers.length == question.length) {
        screen = Results(
          chosenAnswers: selectedAnswers,
          onRestart: () {
            setState(() {
              selectedAnswers = []; // Clear the selected answers
              screen = StartPage(switchScreen); // Show the start page again
            });
          },
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    screen = StartPage(switchScreen);
  }

  void switchScreen() {
    setState(() {
      screen = Question(onSelectAnswer: chooseAnswer);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 150, 212, 219),
                Color.fromARGB(255, 102, 211, 226),
              ],
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
