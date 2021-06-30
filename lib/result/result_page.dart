import 'dart:ui';

import 'package:devquiz_nlw/challenge/challenge_controller.dart';
import 'package:devquiz_nlw/challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz_nlw/core/app_colors.dart';
import 'package:devquiz_nlw/home/home_page.dart';
import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';

class ResultPage extends StatefulWidget {
  final QuizModel quiz;

  const ResultPage({Key? key, required this.quiz}) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;

  void _initAnimation() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1200));
    _animation = Tween<double>(begin: 50, end: 210).animate(_controller);
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final controller = ChallengeController();

    _initAnimation();
    return Scaffold(
      body: Container(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, _) => Stack(
                children: [
                  Center(
                    child: Opacity(
                      opacity: 1,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: _animation.value - _animation.value * 0.6),
                        width: _animation.value,
                        height: _animation.value,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Opacity(
                      opacity: (_animation.value-50)/160,
                      child: Container(
                        margin: EdgeInsets.only(
                            top: _animation.value - _animation.value * 0.6),
                        width: _animation.value,
                        height: _animation.value,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.purple,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: _animation.value + _animation.value * 0.4,
                      height: _animation.value + _animation.value * 0.4,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://image.flaticon.com/icons/png/512/1986/1986987.png"))),
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  "Parabéns !",
                  style: GoogleFonts.alata(
                      fontSize: 50,
                      color: Color(0xFF443957),
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text.rich(
                  TextSpan(
                      text: "Você concluiu",
                      style: GoogleFonts.alata(
                        fontSize: 17,
                        color: Color(0xFF443957),
                      ),
                      children: [
                        TextSpan(
                            text: "\n${widget.quiz.title}",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                "\ncom ${controller.qtdRight} de ${widget.quiz.questions.length} acertos")
                      ]),
                  textAlign: TextAlign.center,
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 68),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.purple(
                          lavel: "Compartilhar",
                          onTap: () {
                            Share.share(
                                'DevQuiz NLW 5 - Flutter: resultado do Quiz: ${widget.quiz.title}\nObtive: ${controller.qtdRight / widget.quiz.questions.length}% aproveitamento');
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: NextButtonWidget.white(
                            label: "Voltar ao início",
                            onTap: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
