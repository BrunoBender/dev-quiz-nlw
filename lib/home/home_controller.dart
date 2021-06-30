import 'package:devquiz_nlw/home/home_repository.dart';
import 'package:devquiz_nlw/home/home_state.dart';
import 'package:devquiz_nlw/shared/enums/levels.dart';
import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:devquiz_nlw/shared/models/user_model.dart';
import 'package:flutter/cupertino.dart';

class HomeController {
  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);
  set state (HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  final dificultStateNotifier = ValueNotifier<Level>(Level.all);
  set dificultState (Level state) => dificultStateNotifier.value = state;
  Level get dificultState => dificultStateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async{
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));
    user = await repository.getUser();
    state = HomeState.sucess;
  }

  void getQuizzes() async{
    state = HomeState.loading;
    await Future.delayed(Duration(seconds: 2));

    quizzes = await repository.getQuizzes();

    //Versão antiga, se utilizar um banco Mokado

    // quizzes = [
    //   QuizModel(
    //     title: "NLW 5 Flutter",
    //     imagem:
    //         "https://avatars.githubusercontent.com/u/69349855?s=400&u=4d685c9ed3a1c9a78ad774d97e7d10c4ca75e552&v=4",
    //     level: Level.facil,
    //     questionAnswered: 1,
    //     questions: [
    //       QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
    //         AwnserModel(title: "Estou curtindo muuuuito"),
    //         AwnserModel(title: "não estou curtindo"),
    //         AwnserModel(title: "Estou curtindo"),
    //         AwnserModel(title: "Estou curtindo", isRight: true),
    //       ]),
    //       QuestionModel(title: "Está curtindo o Flutter?", awnsers: [
    //         AwnserModel(title: "Estou curtindo muuuuito"),
    //         AwnserModel(title: "não estou curtindo"),
    //         AwnserModel(title: "Estou curtindo"),
    //         AwnserModel(title: "Estou curtindo", isRight: true),
    //       ]),
    //     ],
    //   ),
    // ];
    state = HomeState.sucess;
  }
}
