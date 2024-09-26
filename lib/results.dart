import 'package:flutter/material.dart';
import 'package:quiz/data/dummyquestions.dart';
import 'package:quiz/questions_summary.dart';

class Results extends StatelessWidget {
  const Results({
    super.key,
    required this.chosenAnswers,
    required this.onRestart, // Accept the onRestart callback
  });

  final List<String> chosenAnswers;
  final VoidCallback onRestart; // Define the callback type

  List<Map<String, Object>> getSummaryData() {
    List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question-index': i,
          'question': question[i].ques,
          'correct-answer': question[i].answers[0],
          'user-answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numoftotalques = question.length;
    final numofcorrectques = summaryData.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "You answered $numofcorrectques out of $numoftotalques correctly!",
            style: const TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(height: 30),
          QuestionsSummary(
            summarydata: summaryData,
          ),
          const SizedBox(height: 30),
          TextButton(
            onPressed: onRestart, // Use the callback
            child: const Text(
              "Restart quiz",
              style: TextStyle(fontSize: 30),
            ),
          ),
        ],
      ),
    );
  }
}
