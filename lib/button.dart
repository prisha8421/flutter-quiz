import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({required this.text, required this.ontap, super.key});
  final String text;
  final void Function() ontap;
  @override
  Widget build(context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 227, 153, 178)),
        child: Text(style:const TextStyle(color: Colors.white,fontSize: 20),text));
  }
}
