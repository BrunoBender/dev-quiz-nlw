import 'package:devquiz_nlw/home/home_state.dart';
import 'package:devquiz_nlw/shared/models/question_model.dart';
import 'package:devquiz_nlw/shared/widgets/progress_indicator/progress_indicator_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionIndicator extends StatefulWidget {
  final int currentPage;
  final int lenght;

  const QuestionIndicator(
      {Key? key, required this.currentPage, required this.lenght})
      : super(key: key);

  @override
  _QuestionIndicatorState createState() => _QuestionIndicatorState();
}

class _QuestionIndicatorState extends State<QuestionIndicator>
    with TickerProviderStateMixin {

  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation(double begin, double end){
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: 700));
    _animation = Tween<double>(begin: begin, end: end).animate(_controller);
    _controller.forward();
  }

@override
Widget build(BuildContext context) {
    double begin = ((widget.currentPage-1) / widget.lenght);
    double end = (widget.currentPage / widget.lenght);
    _initAnimation(begin, end);
    _controller.forward();

  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.symmetric(horizontal: 20),

        child: AnimatedBuilder(animation: _animation,builder: (context, _) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Questão ${widget.currentPage}",
                  style: GoogleFonts.notoSans(color: Color(0xFF6D6D6D)),
                ),
                Text("de ${widget.lenght}"),
              ],
            ),
            SizedBox(height: 16,),
            ProgressIndicatorWidget(
              value: _animation.value,),
          ],
        ),)
      ),
    ],
  );
}}

