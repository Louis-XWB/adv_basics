import 'package:flutter/material.dart';
import 'questions_summary.dart';
import 'data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chooseAnswers, required this.onRestart});

  final List<String> chooseAnswers;
  final void Function() onRestart;

  List<Map<String, Object>> get summaryData {
    List<Map<String, Object>> summaryData = [];
    for (var i = 0; i < chooseAnswers.length; i++) {
      summaryData.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': chooseAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }
    return summaryData;
  }

  @override
  Widget build(BuildContext context) {
    final numTotalQuestions = questions.length;
    final numCorrectAnswers = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions correctly!',
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(onPressed: onRestart, child: const Text('Restart Quiz')),
          ],
        ),
      ),
    );
  }
}
