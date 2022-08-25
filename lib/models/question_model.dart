
class QuestionModel{
  String? question;
  Map<String , int>? answer;

  QuestionModel(this.question,this.answer);
}

List<QuestionModel> questions1 = [
  QuestionModel(
      "what is your experience?", {
    "good": 1,
    "not good": 2,
    "it's so interested": 3,
    "perfect": 4,
  }),
  QuestionModel(
      "what is your experience?", {
    "good": 1,
    "not good": 2,
    "it's so interested": 3,
    "perfect": 4,
  }),
  QuestionModel(
      "what is your experience?", {
    "good": 1,
    "not good": 2,
    "it's so interested": 3,
    "perfect": 4,
  }),

];
