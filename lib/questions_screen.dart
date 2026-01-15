import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/answer_button.dart';
import 'package:quiz_flutter_app/data/questions.dart';
import 'package:quiz_flutter_app/models/quiz_question.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(context) {
    final int currentQuestion = 0;
    final QuizQuestion question = questions[currentQuestion];

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                question.text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white),
              ),
            ),
            ...question.getShuffledAnswers().map((answer) {
              return AnswerButton(text: answer, callback: () {});
            }),
          ],
        ),
      ),
    );
  }
}
