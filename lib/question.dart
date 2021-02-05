class Question {
  String questionText;
  String option1;
  String option2;
  String option3;
  String option4;
  int answer;

  Question(this.questionText, this.option1, this.option2, this.option3,
      this.option4, this.answer);

  static List<Question> getQuestionList() {
    List<Question> question = [];
    String questionText = 'O QUE É FLUTTER?';
    String option1 = 'Uma biblioteca';
    String option2 = 'Um framework da Google';
    String option3 = 'Uma Linguagem de Programação';
    String option4 = 'Android';
    int answer = 2;
    question.add(
        Question(questionText, option1, option2, option3, option4, answer));
    return question;
  }
}
