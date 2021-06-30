import 'package:devquiz_nlw/challenge/challenge_page.dart';
import 'package:devquiz_nlw/home/home_controller.dart';
import 'package:devquiz_nlw/home/home_state.dart';
import 'package:devquiz_nlw/home/widget/app_bar/app_bar_widget.dart';
import 'package:devquiz_nlw/home/widget/group_quiz_card/group_quiz_card_widget.dart';
import 'package:devquiz_nlw/home/widget/level_button/level_button.dart';
import 'package:devquiz_nlw/home/widget/quiz_card/quiz_card_widget.dart';
import 'package:devquiz_nlw/shared/enums/levels.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {
        () {};
      });
    });
    controller.dificultStateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.sucess) {
      return Scaffold(
        appBar: AppBarWidget(
          user: controller.user!,
          quizzes: controller.quizzes!,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LevelButtonWidget(
                        label: "Fácil",
                        onTap: () {
                            controller.dificultStateNotifier.value = Level.facil;
                        },
                      ),
                      LevelButtonWidget(
                        label: "Médio",
                        onTap: () {
                          controller.dificultStateNotifier.value = Level.medio;
                        },
                      ),
                      LevelButtonWidget(
                        label: "Difícil",
                        onTap: () {
                          controller.dificultStateNotifier.value = Level.dificl;
                        },
                      ),
                      LevelButtonWidget(
                        label: "Perito",
                        onTap: () {
                          controller.dificultStateNotifier.value = Level.perito;
                        },
                      ),
                    ],
                  ),
                ),
                ValueListenableBuilder<Level>(
                  valueListenable: controller.dificultStateNotifier,
                  builder: (context, value, _) => GroupQuiz(quizzes: controller.quizzes!, state: controller.dificultState,),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF5BBF30)),
          ),
        ),
      );
    }
  }
}
