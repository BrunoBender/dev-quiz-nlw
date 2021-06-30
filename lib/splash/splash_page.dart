import 'package:devquiz_nlw/core/app_colors.dart';
import 'package:devquiz_nlw/core/app_gradients.dart';
import 'package:devquiz_nlw/home/home_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _animation;
  late AnimationController _controllerLinearBar;
  late Animation _animationLinearBar;

  void initAnimation() {
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1300));
    _animation = Tween<double>(begin: 200, end: 390).animate(_controller);
    _controller.repeat(reverse: true);

    _controllerLinearBar =
        AnimationController(vsync: this, duration: Duration(seconds: 6));
    _animationLinearBar =
        Tween<double>(begin: 0, end: 1).animate(_controllerLinearBar);
    _controllerLinearBar.forward();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 7)).then((_) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())));

    initAnimation();
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            gradient: AppGradients.linear,
            color: Colors.green,
          ),
          child: Stack(children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, _) => Center(
                  child: Stack(
                children: [
                  Opacity(
                    opacity: (_animation.value - 200) / 190,
                    child: Icon(
                      Icons.lightbulb_outline,
                      size: _animation.value,
                      color: Colors.black12,
                    ),
                  )
                ],
              )),
            ),
            Center(
              child: Container(
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  decoration: BoxDecoration(),
                  child: Text(
                    "Dev.Quiz",
                    style: TextStyle(fontSize: 70, color: Colors.white),
                  )),
            ),
            Container(
              margin: EdgeInsets.only(top: 744),
              child: AnimatedBuilder(
                  animation: _animationLinearBar,
                  builder: (context, _) => LinearProgressIndicator(
                    value: _animationLinearBar.value,
                    backgroundColor: Colors.black12,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(AppColors.purple),
                    minHeight: 20,
                  )),
            )
          ])),
    );
  }
}
