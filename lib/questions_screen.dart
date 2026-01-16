import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/answer_button.dart';
import 'package:quiz_flutter_app/data/questions.dart';
import 'package:quiz_flutter_app/models/quiz_question.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void onAnswer() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex += 1;
      } else {
        currentQuestionIndex = 0;
      }
    });
  }

  @override
  Widget build(context) {
    // final int currentQuestion = 0;
    final QuizQuestion question = questions[currentQuestionIndex];

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
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ...question.getShuffledAnswers().map((answer) {
              return AnswerButton(text: answer, callback: onAnswer);
            }),
          ],
        ),
      ),
    );
  }
}
