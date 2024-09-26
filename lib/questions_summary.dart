import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summarydata});

  final List<Map<String, Object>> summarydata;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min, // The Column only takes as much space as needed
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to start of the Column
        children: summarydata.map((data) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0), // Add padding for spacing
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${(data['question-index'] as int) + 1}. ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Your answer: ${data['user-answer'] as String}',
                        style: const TextStyle(color: Colors.yellow),
                      ),
                      Text(
                        'Correct answer: ${data['correct-answer'] as String}',
                        style: const TextStyle(color: Colors.green),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
