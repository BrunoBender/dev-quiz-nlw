import 'package:devquiz_nlw/shared/enums/levels.dart';
import 'package:devquiz_nlw/shared/models/question_model.dart';

extension LevelStringExt on String {
  Level get parse => {
        "facil": Level.facil,
        "medio":  Level.medio,
        "dificil": Level.dificl,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get parse => {
    Level.facil: "facil",
    Level.medio: "medio",
    Level.dificl: "dificl",
    Level.perito: "perito",
  }[this]! ;
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
    required this.imagem,
    required this.level,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
      'imagens': imagem,
      'level': level.parse,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions']?.map((x) => QuestionModel.fromMap(x))),
      questionAnswered: map['questionAnswered'],
      imagem: map['imagem'],
      level: map['level'].toString().parse,
    );
  }
}
