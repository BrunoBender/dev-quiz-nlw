import 'package:devquiz_nlw/core/app_gradients.dart';
import 'package:devquiz_nlw/home/widget/score_card/score_card_widget.dart';
import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:devquiz_nlw/shared/models/user_model.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends PreferredSize {
  final UserModel user;
  final List<QuizModel> quizzes;
  AppBarWidget({required this.user, required this.quizzes})
      : super(
            preferredSize: Size.fromHeight(250),
            child: Container(
              height: 250,
              child: Stack(
                children: [
                  Container(
                    height: 161,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    width: double.maxFinite,
                    decoration: BoxDecoration(gradient: AppGradients.linear),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text.rich(TextSpan(
                            text: user.name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 23))),
                        Container(
                          width: 58,
                          height: 58,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage(user.photoUrl))),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.0, 1.0),
                    child: ScoreCardWidget(quizzes: quizzes),
                  )
                ],
              ),
            ));
}
