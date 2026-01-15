import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 40,
      children: [
        Center(
          child: Image.asset(
            'assets/images/quiz-logo.png',
            opacity: const AlwaysStoppedAnimation(0.3),
            width: 300,
            color: Colors.amber,
          ),
        ),
        const Text(
          'Learn Flutter the fun way!',
          style: TextStyle(color: Colors.white, fontSize: 24),
        ),
        OutlinedButton.icon(
          onPressed: startQuiz,
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: Colors.white10,
          ),
          icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
          label: Text(
            'Start Quiz',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }
}
