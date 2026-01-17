import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/data/questions.dart';
import 'package:quiz_flutter_app/questions_screen.dart';
import 'package:quiz_flutter_app/start_screen.dart';
import 'package:quiz_flutter_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  Widget? activeScreen;

  final List<String> userAnswers = [];

  void updateUserAnswers(String answer) {
    userAnswers.add(answer);

    if (userAnswers.length == questions.length) {
      setState(() {
        activeScreen = ResultsScreen(onRestartQuiz, userAnswers);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchQuestionScreen);
  }

  void switchQuestionScreen() {
    setState(() {
      activeScreen = QuestionsScreen(updateUserAnswers);
    });
  }

  void onRestartQuiz() {
    userAnswers.clear();
    setState(() {
      activeScreen = QuestionsScreen(updateUserAnswers);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: AlignmentGeometry.topLeft,
              end: AlignmentGeometry.bottomRight,
              colors: [Colors.deepPurple, Colors.purple],
            ),
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}
