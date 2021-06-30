 import 'package:devquiz_nlw/shared/models/quiz_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

 class ChartWidget extends StatefulWidget {
   final List<QuizModel> quizzes;
   const ChartWidget({Key? key, required this.quizzes}) : super(key: key);

   @override
   _ChartWidgetState createState() => _ChartWidgetState();
 }

 class _ChartWidgetState extends State<ChartWidget> with SingleTickerProviderStateMixin {

   late AnimationController _controller;
   late Animation<double> _animation;

   void _initAnimation(double percent){
     _controller = AnimationController(vsync: this, duration: Duration(seconds: 3));
     _animation = Tween<double>(begin: 0.0, end: percent).animate(_controller);
     _controller.forward();
   }

   double allQuestionsComplete = 0;
   double allQuestions = 0;

   double calcPercent(){
     for(QuizModel q in widget.quizzes){
       allQuestions += q.questions.length;
       allQuestionsComplete += q.questionAnswered;
     }
     double percentResult = allQuestionsComplete/allQuestions;

     return percentResult;
   }

   @override
  void initState() {
    _initAnimation(calcPercent());
    super.initState();
  }


   @override
   Widget build(BuildContext context) {



     widget.quizzes.map((e) => allQuestions += e.questions.length.toDouble());

     return Container(
       width: 80,
       height: 80,
       child: AnimatedBuilder(animation: _animation,
       builder: (context, _) =>  Stack(children: [
         Center(
           child: Container(width: 80, height: 80, child: CircularProgressIndicator(
             strokeWidth: 10,
               value: _animation.value,
             backgroundColor: Colors.black12,
             valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
           ),),
         ),
         Center(child: Text("${(_animation.value * 100).toInt()}%", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF021571) ),),)
       ],),)

     );
   }
 }

