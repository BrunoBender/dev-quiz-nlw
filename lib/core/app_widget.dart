import 'package:devquiz_nlw/challenge/challenge_page.dart';
import 'package:devquiz_nlw/home/home_page.dart';
import 'package:devquiz_nlw/secondApp/secondAoo_page.dart';
import 'package:devquiz_nlw/splash/splash_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "DevQuiz",
        home: SplashPage());
  }
}
