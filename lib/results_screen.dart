import 'package:flutter/material.dart';
import 'package:quiz_flutter_app/data/questions.dart';
import 'package:quiz_flutter_app/questions_summary.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(this.onRestartQuiz, this.selectedAnswers, {super.key});

  final void Function() onRestartQuiz;
  final List<String> selectedAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < selectedAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': selectedAnswers[i],
      });
    }
    return summary;
  }

  int getCorrectAnswerCount() {
    int count = 0;
    List<Map<String, Object>> summaryData = getSummaryData();
    for (final Map<String, Object> data in summaryData) {
      if (data['user_answer'] == data['correct_answer']) {
        count++;
      }
    }
    return count;
  }

  @override
  Widget build(context) {
    final num questionsLength = questions.length;
    final num correctAnswersCount = getCorrectAnswerCount();

    return Container(
      padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          Text(
            'You answered $correctAnswersCount out of $questionsLength question correctly',
            style: const TextStyle(color: Colors.white, fontSize: 20),
            textAlign: TextAlign.center,
          ),
          QuestionsSummary(getSummaryData()),
          TextButton.icon(
            onPressed: onRestartQuiz,
            icon: const Icon(Icons.refresh),
            label: Text("Restart Quiz", style: TextStyle(fontSize: 20)),
            style: TextButton.styleFrom(foregroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
}
