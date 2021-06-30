import 'package:devquiz_nlw/home/widget/chart/chart_widget.dart';
import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';

class ScoreCardWidget extends StatelessWidget {
  final List<QuizModel> quizzes;
  const ScoreCardWidget({Key? key, required this.quizzes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Container(
        height: 136,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border:
                Border.fromBorderSide(BorderSide(color: Color(0xFFD5C6C6C6)))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Row(
            children: [
              Expanded(flex: 1, child: ChartWidget(quizzes: quizzes)),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Vamos começar",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF021571),
                            fontSize: 20),
                      ),
                      Text("Complete os desafios e avance em conhecimento")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
