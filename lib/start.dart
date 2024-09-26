import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.screen, {super.key});

  final void Function() screen;
  press() {}

  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'images/img/quiz-logo.png',
          width: 200,
        ),
        const SizedBox(height: 50),
        const Text(
          "Learn Flutter the fun way!!",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        const SizedBox(height: 50),
        OutlinedButton(
            onPressed: screen,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            child: const Text("start quiz"))
      ],
    ));
  }
}
