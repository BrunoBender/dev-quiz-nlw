import 'package:devquiz_nlw/challenge/challenge_controller.dart';
import 'package:devquiz_nlw/challenge/widget/next_button/next_button_widget.dart';
import 'package:devquiz_nlw/challenge/widget/question_indicator/question_indicator_widget.dart';
import 'package:devquiz_nlw/challenge/widget/quiz/quiz_widget.dart';
import 'package:devquiz_nlw/result/result_page.dart';
import 'package:devquiz_nlw/shared/models/question_model.dart';
import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  final QuizModel quiz;

  const ChallengePage({Key? key, required this.questions, required this.quiz}) : super(key: key);

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  final controller = ChallengeController();
  final pageController = PageController();

  void initState() {
    pageController.addListener(() {
      controller.currentPage = pageController.page!.toInt();
    });
    super.initState();
  }

  void nextPage() {
    if(controller.currentPage < widget.questions.length && controller.currentPage != widget.questions.length -1){
      pageController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.linear);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
            top: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButton(),
                ValueListenableBuilder<int>(
                  valueListenable: controller.currenPageNotifier,
                  builder: (context, value, _) => QuestionIndicator(
                    currentPage: value + 1,
                    lenght: widget.questions.length,
                  ),
                )
              ],
            )),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: widget.questions
            .map((e) => Quiz(
                  question: e,
                  onChange: nextPage,
                ))
            .toList(),
      ),
      bottomNavigationBar: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 10, left: 20, right: 20),
          child: ValueListenableBuilder<int>(
                  valueListenable: controller.currenPageNotifier,
                  builder: (context, value, _) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          if(value != widget.questions.length -1)
                          Expanded(
                              child: NextButtonWidget.white(
                                label: "Pular",
                                onTap: () {
                                  nextPage();
                                },
                              )),
                          if(value == widget.questions.length -1)
                          Expanded(
                              child: NextButtonWidget.green(
                            label: "Confirmar",
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResultPage(quiz: widget.quiz)));
                            },
                          )),
                        ],
                      ),)
        ),
      ),
    );
  }
}
