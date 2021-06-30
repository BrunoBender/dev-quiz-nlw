import 'package:devquiz_nlw/challenge/challenge_page.dart';
import 'package:devquiz_nlw/challenge/widget/quiz/quiz_widget.dart';
import 'package:devquiz_nlw/core/app_colors.dart';
import 'package:devquiz_nlw/home/home_state.dart';
import 'package:devquiz_nlw/home/widget/quiz_card/quiz_card_widget.dart';
import 'package:devquiz_nlw/shared/enums/levels.dart';
import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GroupQuiz extends StatefulWidget {
  final List<QuizModel>? quizzes;
  final Level state;

  const GroupQuiz({Key? key, required this.quizzes, required this.state})
      : super(key: key);

  @override
  _GroupQuizState createState() => _GroupQuizState();
}

class _GroupQuizState extends State<GroupQuiz> {
  @override
  Widget build(BuildContext context) {
    List<QuizModel> quizzesShow = <QuizModel>[];

    setQuizzes() {
      if (widget.state == Level.all) {
        quizzesShow.addAll(widget.quizzes!);
      } else {
        for (int i = 0; i < widget.quizzes!.length; i++) {
          if (widget.quizzes![i].level == widget.state) {
            quizzesShow.add(widget.quizzes![i]);
          }
        }
      }
    }

    ;

    setQuizzes();

    if (quizzesShow.length == 0) {
      return Container(
          padding: EdgeInsets.symmetric(horizontal: 63, vertical: 80),
          child: Text(
            "Nenhum Curso encontrado :/",
            style: GoogleFonts.notoSans(
                color: AppColors.darkPurple,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ));
    }
    return SizedBox(
      height: 450,
      child: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        children: quizzesShow
            .map((e) => QuizCard(
                  title: e.title,
                  awnseredQuestions: e.questionAnswered,
                  numberQuestions: e.questions.length,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChallengePage(
                                  questions: e.questions,
                                  quiz: e,
                                )));
                  },
                ))
            .toList(),
      ),
    );
  }
}
