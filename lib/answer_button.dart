import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.text, required this.callback, super.key});

  final String text;
  final void Function() callback;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: callback,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(15),
        ),
      ),
      child: Text(text, textAlign: TextAlign.center),
    );
  }
}
