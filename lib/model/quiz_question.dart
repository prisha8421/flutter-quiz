class QuizQuestion {
  const QuizQuestion(this.ques, this.answers);

  final String ques;
  final List<String> answers;

  List<String> getShuffledanswers() {
    final List<String> shuffledanswers = List.of(answers);
    shuffledanswers.shuffle();
    return shuffledanswers;
  }
}
