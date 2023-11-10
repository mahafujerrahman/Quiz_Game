// To parse this JSON data, do
//
//     final quizDataList = quizDataListFromJson(jsonString);

import 'dart:convert';

QuizDataList quizDataListFromJson(String str) => QuizDataList.fromJson(json.decode(str));

String quizDataListToJson(QuizDataList data) => json.encode(data.toJson());

class QuizDataList {
  List<Question> questions;

  QuizDataList({
    required this.questions,
  });

  factory QuizDataList.fromJson(Map<String, dynamic> json) => QuizDataList(
    questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
  };
}

class Question {
  String question;
  Answers answers;
  String? questionImageUrl;
  String correctAnswer;
  int score;

  Question({
    required this.question,
    required this.answers,
    this.questionImageUrl,
    required this.correctAnswer,
    required this.score,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
    question: json["question"],
    answers: Answers.fromJson(json["answers"]),
    questionImageUrl: json["questionImageUrl"],
    correctAnswer: json["correctAnswer"],
    score: json["score"],
  );

  Map<String, dynamic> toJson() => {
    "question": question,
    "answers": answers.toJson(),
    "questionImageUrl": questionImageUrl,
    "correctAnswer": correctAnswer,
    "score": score,
  };
}

class Answers {
  String a;
  String b;
  String? c;
  String? d;

  Answers({
    required this.a,
    required this.b,
    this.c,
    this.d,
  });

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
    a: json["A"],
    b: json["B"],
    c: json["C"],
    d: json["D"],
  );

  Map<String, dynamic> toJson() => {
    "A": a,
    "B": b,
    "C": c,
    "D": d,
  };
}
